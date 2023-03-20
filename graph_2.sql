/*Preparation of Distance Vector Routing Table
*/

DROP TABLE IF EXISTS dvr;

/*Table should include origin, destination, stopover (via) and cost
*/

CREATE TABLE dvr(
origin VARCHAR(1) NOT NULL,
destination VARCHAR(1), 
via VARCHAR(1),
cost float);


INSERT INTO dvr(origin, destination, via, cost)

--Origin A: 
VALUES 
	 --('A', 'A', 'A', '+infinity'),
	 --('A', 'A', 'B', '+infinity'),
	 --('A', 'A', 'C', '+infinity'),
	 --('A', 'A', 'D', '+infinity'),

	-- ('A', 'B', 'A', '+infinity'),
	   ('A', 'B', 'B', 3),
	   ('A', 'B', 'C', '+infinity'),
	-- ('A', 'B', 'D', '+infinity'),

	-- ('A', 'C', 'A', '+infinity'),
	   ('A', 'C', 'B', '+infinity'),
	   ('A', 'C', 'C', 23),
	-- ('A', 'C', 'D', '+infinity'),

	-- ('A', 'D', 'A', '+infinity'),
	   ('A', 'D', 'B', '+infinity'),
	   ('A', 'D', 'C', '+infinity'),
	-- ('A', 'D', 'D', '+infinity'),

--Origin B:

	  ('B', 'A', 'A', 3),
	--('B', 'A', 'B', '+infinity'),
	  ('B', 'A', 'C', '+infinity'),
	--('B', 'A', 'D', '+infinity'),

	--('B', 'B', 'A', '+infinity'),
	--('B', 'B', 'B', '+infinity'),
	--('B', 'B', 'C', '+infinity'),
	--('B', 'B', 'D', '+infinity'),

	  ('B', 'C', 'A', '+infinity'),
	--('B', 'C', 'B', '+infinity'),
	  ('B', 'C', 'C', 2),
	--('B', 'C', 'D', '+infinity'),

	  ('B', 'D', 'A', '+infinity'),
	--('B', 'D', 'B', '+infinity'),
	  ('B', 'D', 'C', '+infinity'),
	--('B', 'D', 'D', '+infinity'),

--Origin C:

	  ('C', 'A', 'A', 23),
	  ('C', 'A', 'B', '+infinity'),
	--('C', 'A', 'C', '+infinity'),
	  ('C', 'A', 'D', '+infinity'),

	  ('C', 'B', 'A', '+infinity'),
	  ('C', 'B', 'B', 2),
	--('C', 'B', 'C', '+infinity'),
	  ('C', 'B', 'D', '+infinity'),

	--('C', 'C', 'A', '+infinity'),
	--('C', 'C', 'B', '+infinity'),
	--('C', 'C', 'C', '+infinity'),
	--('C', 'C', 'D', '+infinity'),

	  ('C', 'D', 'A', '+infinity'),
	  ('C', 'D', 'B', '+infinity'),
	--('C', 'D', 'C', '+infinity'),
	  ('C', 'D', 'D', 5),

--Origin D: 

   -- ('D', 'A', 'A', '+infinity'),
   -- ('D', 'A', 'B', '+infinity'),
      ('D', 'A', 'C', '+infinity'),
   -- ('D', 'A', 'D', '+infinity'),

   -- ('D', 'B', 'A', '+infinity'),
   -- ('D', 'B', 'B', '+infinity'),
      ('D', 'B', 'C', '+infinity'),
   -- ('D', 'B', 'D', '+infinity'),

   -- ('D', 'C', 'A', '+infinity'),
   -- ('D', 'C', 'B', '+infinity'),
      ('D', 'C', 'C', 5);
   -- ('D', 'C', 'D', '+infinity'),

   -- ('D', 'D', 'A', '+infinity'),
   -- ('D', 'D', 'B', '+infinity'),
   -- ('D', 'D', 'C', '+infinity');
   -- ('D', 'D', 'D', '+infinity');
	  
--Approach to solving the Distance Vector Routing Protocol with the Bellman-Ford equation d_x(y)=min_v{c(x,y)+d_v(y)}

DROP FUNCTION IF EXISTS array_smallest;
CREATE OR REPLACE FUNCTION array_smallest(anyarray)
RETURNS anyelement
LANGUAGE SQL
AS $$
  SELECT min(elements) FROM unnest($1) elements
$$;

DROP TABLE IF EXISTS routers_2;
CREATE TABLE routers_2 ("from", "to", "minimal_cost", "track") as


WITH RECURSIVE exploration as (
		SELECT d.origin as from, 
			   d.destination as to,
			   d.via as first_stopover,
			   d.origin,
			   d.destination,
			   d.via,
			   e.cost as cost_next_hop,
			   CASE WHEN d.destination = d.via THEN array[d.origin] || array[d.via] || array['FINISHED']::VARCHAR[] 
				    ELSE array[d.origin] || array[d.via] END  as track,
			   e.cost as total_cost,
			   CASE WHEN d.destination = d.via THEN d.cost ELSE 'infinity' END as branch_and_bound 
		FROM dvr as d, dvr as e
		WHERE d.origin = e.origin AND d.via = e.via AND e.destination = e.via

	
	UNION ALL
	
		SELECT e.from,  
			   e.to,
			   e.first_stopover,
			   d.origin, 
			   d.destination, 
			   d.via, 
			   d.cost, 
			   CASE WHEN e.to = d.via THEN e.track || array[d.via, 'FINISHED']::VARCHAR[] ELSE e.track || array[d.via] END as track,
			   e.total_cost+d.cost as total_cost,
			   array_smallest(array[e.branch_and_bound]::float[] || array[min(CASE WHEN e.to = d.via THEN e.total_cost+d.cost ELSE 'infinity' END) over win]::float[]) as branch_and_bound
		FROM exploration as e, dvr as d
		WHERE e.via = d.origin 										   AND 
			  d.destination = d.via 								   AND											
			  'FINISHED' <> ALL(e.track) 							   AND 
			  (SELECT cardinality(array_positions(e.track[2:],d.via)) < 1) AND 
			  e.total_cost+d.cost <= e.branch_and_bound 
		WINDOW win as (PARTITION BY e.from, e.to, e.first_stopover ORDER BY e.total_cost RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)

)




/*Test me (recursive CTE in its terminated form):

SELECT * FROM exploration as e;

*/

--Final Transformation:
--Optimal routing tables and routes:


SELECT d.from,
	   d.to,
	   d.minimal_cost,
	   e.track
FROM 
	(
	SELECT e.from, 
		   e.to,
		   min(e.total_cost) as minimal_cost
	FROM exploration as e
	WHERE  'FINISHED' = e.track[array_upper(e.track,1)] 
	GROUP BY e.from, e.to
	) as d, exploration as e 
WHERE d.from    =    e.from     AND 
	  d.to      =    e.to  		AND 
	  e.total_cost        =    d.minimal_cost	    AND 
	  'FINISHED' = e.track[array_upper(e.track,1)] 
ORDER BY d.from, d.to
;


TABLE routers_2;






