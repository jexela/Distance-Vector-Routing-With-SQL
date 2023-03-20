/*Preparation of Distance Vector Routing Table
*/

DROP TABLE IF EXISTS graph;

/*Table should include origin, destination, stopover (via) and cost
*/

CREATE TABLE graph(
origin VARCHAR(1) NOT NULL,
destination VARCHAR(1), 
via VARCHAR(1),
cost float);


INSERT INTO graph(origin, destination, via, cost)

--Origin A: 
VALUES 
	 --('A', 'A', 'A', '+infinity'),
	 --('A', 'A', 'B', '+infinity'),
	 --('A', 'A', 'C', '+infinity'),
	 --('A', 'A', 'D', '+infinity'),
	 --('A', 'A', 'E', '+infinity'),

	-- ('A', 'B', 'A', '+infinity'),
	   ('A', 'B', 'B', 7),
	-- ('A', 'B', 'C', '+infinity'),
	-- ('A', 'B', 'D', '+infinity'),
	   ('A', 'B', 'E', '+infinity'),	

	-- ('A', 'C', 'A', '+infinity'),
	   ('A', 'C', 'B', '+infinity'),
	-- ('A', 'C', 'C', '+infinity'),
	-- ('A', 'C', 'D', '+infinity'),
	   ('A', 'C', 'E', '+infinity'),

	-- ('A', 'D', 'A', '+infinity'),
	   ('A', 'D', 'B', '+infinity'),
	-- ('A', 'D', 'C', '+infinity'),
	-- ('A', 'D', 'D', '+infinity'),
	   ('A', 'D', 'E', '+infinity'),	
	
	-- ('A', 'E', 'A', '+infinity'),
	   ('A', 'E', 'B', '+infinity'),
	-- ('A', 'E', 'C', '+infinity'),
	-- ('A', 'E', 'D', '+infinity'),
	   ('A', 'E', 'E', 1),

--Origin B:

	  ('B', 'A', 'A', 7),
	--('B', 'A', 'B', '+infinity'),
	  ('B', 'A', 'C', '+infinity'),
	--('B', 'A', 'D', '+infinity'),
	  ('B', 'A', 'E', '+infinity'),	

	--('B', 'B', 'A', '+infinity'),
	--('B', 'B', 'B', '+infinity'),
	--('B', 'B', 'C', '+infinity'),
	--('B', 'B', 'D', '+infinity'),
	--('B', 'B', 'E', '+infinity'),
	 
	  ('B', 'C', 'A', '+infinity'),
	--('B', 'C', 'B', '+infinity'),
	  ('B', 'C', 'C', 1),
	--('B', 'C', 'D', '+infinity'),
      ('B', 'C', 'E', '+infinity'),
	 
	  ('B', 'D', 'A', '+infinity'),
	--('B', 'D', 'B', '+infinity'),
	  ('B', 'D', 'C', '+infinity'),
	--('B', 'D', 'D', '+infinity'),
	  ('B', 'D', 'E', '+infinity'),
	
	  ('B', 'E', 'A', '+infinity'),
	--('B', 'E', 'B', '+infinity'),
	  ('B', 'E', 'C', '+infinity'),
	--('B', 'E', 'D', '+infinity'),
      ('B', 'E', 'E', 8),
	 
--Origin C:

	--('C', 'A', 'A','+infinity'),
	  ('C', 'A', 'B', '+infinity'),
	--('C', 'A', 'C', '+infinity'),
	  ('C', 'A', 'D', '+infinity'),
	--('C', 'A', 'E', '+infinity'),	  

	--('C', 'B', 'A', '+infinity'),
	  ('C', 'B', 'B', 1),
	--('C', 'B', 'C', '+infinity'),
	  ('C', 'B', 'D', '+infinity'),
	--('C', 'B', 'E', '+infinity'),

	--('C', 'C', 'A', '+infinity'),
	--('C', 'C', 'B', '+infinity'),
	--('C', 'C', 'C', '+infinity'),
	--('C', 'C', 'D', '+infinity'),
    --('C', 'C', 'E', '+infinity'),

	  ('C', 'D', 'A', '+infinity'),
	  ('C', 'D', 'B', '+infinity'),
	--('C', 'D', 'C', '+infinity'),
	  ('C', 'D', 'D', 2),
	--('C', 'D', 'E', '+infinity'),

	--('C', 'E', 'A', '+infinity'),
	  ('C', 'E', 'B', '+infinity'),
	--('C', 'E', 'C', '+infinity'),
	  ('C', 'E', 'D', 5),
	--('C', 'E', 'E', '+infinity'),

--Origin D: 

   -- ('D', 'A', 'A', '+infinity'),
   -- ('D', 'A', 'B', '+infinity'),
      ('D', 'A', 'C', '+infinity'),
   -- ('D', 'A', 'D', '+infinity'),
      ('D', 'A', 'E', '+infinity'),

   -- ('D', 'B', 'A', '+infinity'),
   -- ('D', 'B', 'B', '+infinity'),
      ('D', 'B', 'C', '+infinity'),
   -- ('D', 'B', 'D', '+infinity'),
      ('D', 'B', 'E', '+infinity'),

   -- ('D', 'C', 'A', '+infinity'),
   -- ('D', 'C', 'B', '+infinity'),
      ('D', 'C', 'C', 2),
   -- ('D', 'C', 'D', '+infinity'),
      ('D', 'C', 'E', '+infinity'),

   -- ('D', 'D', 'A', '+infinity'),
   -- ('D', 'D', 'B', '+infinity'),
   -- ('D', 'D', 'C', '+infinity'),
   -- ('D', 'D', 'D', '+infinity'),
   -- ('D', 'D', 'E', '+infinity'),
   
   -- ('D', 'E', 'A', '+infinity'),
   -- ('D', 'E', 'B', '+infinity'),
      ('D', 'E', 'C', '+infinity'),
   -- ('D', 'E', 'D', '+infinity'),
      ('D', 'E', 'E', 2),

--Origin E: 

      ('E', 'A', 'A', 1),
      ('E', 'A', 'B', '+infinity'),
   -- ('E', 'A', 'C', '+infinity'),
      ('E', 'A', 'D', '+infinity'),
   -- ('E', 'A', 'E', '+infinity'),

      ('E', 'B', 'A', '+infinity'),
      ('E', 'B', 'B', 8),
      ('E', 'B', 'C', '+infinity'),
      ('E', 'B', 'D', '+infinity'),
   -- ('E', 'B', 'E', '+infinity'),

      ('E', 'C', 'A', '+infinity'),
      ('E', 'C', 'B', '+infinity'),
      ('E', 'C', 'C', 5),
      ('E', 'C', 'D', '+infinity'),
   -- ('E', 'C', 'E', '+infinity'),

      ('E', 'D', 'A', '+infinity'),
      ('E', 'D', 'B', '+infinity'),
   -- ('E', 'D', 'C', '+infinity'),
      ('E', 'D', 'D', 2);
   -- ('E', 'D', 'E', '+infinity'),
 
   -- ('E', 'E', 'A', '+infinity'),
   -- ('E', 'E', 'B', '+infinity'),
   -- ('E', 'E', 'C', '+infinity'),
   -- ('E', 'E', 'D', '+infinity'),
   -- ('E', 'E', 'E', '+infinity');
	  
--Approach to solving the Distance Vector Routing Protocol with the Bellman-Ford equation d_x(y)=min_v{c(x,y)+d_v(y)}

DROP FUNCTION IF EXISTS array_smallest;
CREATE OR REPLACE FUNCTION array_smallest(anyarray)
RETURNS anyelement
LANGUAGE SQL
AS $$
  SELECT min(elements) FROM unnest($1) elements
$$;

DROP TABLE IF EXISTS routers_1;
CREATE TABLE routers_1 ("from", "to", "minimal_cost", "track") as


WITH RECURSIVE exploration as (
		SELECT g.origin as from, 
			   g.destination as to,
			   g.via as first_stopover,
			   g.origin,
			   g.destination,
			   g.via,
			   e.cost as cost_next_hop,
			   CASE WHEN g.destination = g.via THEN array[g.origin] || array[g.via] || array['FINISHED']::VARCHAR[] 
				    ELSE array[g.origin] || array[g.via] END  as track,
			   e.cost as total_cost,
			   CASE WHEN g.destination = g.via THEN g.cost ELSE 'infinity' END as branch_and_bound 
		FROM graph as g, graph as e
		WHERE g.origin = e.origin AND g.via = e.via AND e.destination = e.via

	
	UNION ALL
	
		SELECT e.from,  
			   e.to,
			   e.first_stopover,
			   g.origin, 
			   g.destination, 
			   g.via, 
			   g.cost, 
			   CASE WHEN e.to = g.via THEN e.track || array[g.via, 'FINISHED']::VARCHAR[] ELSE e.track || array[g.via] END as track,
			   e.total_cost+g.cost as total_cost,
			   array_smallest(array[e.branch_and_bound]::float[] || array[min(CASE WHEN e.to = g.via THEN e.total_cost+g.cost ELSE 'infinity' END) over win]::float[]) as branch_and_bound
		FROM exploration as e, graph as g
		WHERE e.via = g.origin 										   AND 
			  g.destination = g.via 								   AND											
			  'FINISHED' <> ALL(e.track) 							   AND 
			  (SELECT cardinality(array_positions(e.track[2:],g.via)) < 1) AND 
			  e.total_cost <= e.branch_and_bound
		WINDOW win as (PARTITION BY e.from, e.to, e.first_stopover 
		ORDER BY e.total_cost RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)

)

/*Test me (recursive CTE in its terminated form):

SELECT * FROM exploration as e;

*/


--Final Transformation

SELECT g.from,
	   g.to,
	   g.minimal_cost,
	   e.track
FROM 
	(
	SELECT e.from, 
		   e.to,
		   min(e.total_cost) as minimal_cost
	FROM exploration as e
	WHERE  'FINISHED' = e.track[array_upper(e.track,1)] 
	GROUP BY e.from, e.to
	) as g, exploration as e 
WHERE g.from    =    e.from     AND 
	  g.to =    e.to  AND  
	  e.total_cost        =    g.minimal_cost	    AND 
	  'FINISHED' = e.track[array_upper(e.track,1)] 
ORDER BY g.from, g.to
;

TABLE routers_1;










