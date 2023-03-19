## Distance Vector Routing with SQL

Author: Alexej Onken   

Institution: Enrolled student at the University of Tuebingen  

Program: Computer Science Master's degree    

Course: SQL is a Programming Language


This repository includes the SQL code and relevant files, along with a PDF article on Distance-Vector Routing with SQL.

## Abstract

*Recursive queries are useful for working with data that is organized in a hierarchical or tree-like manner*, as similarly promoted by the official PostgreSQL documentation. In this article, we explore the solution of Distance-Vector Routing using SQL and compare it with the established method, which employs the Bellman-Ford algorithm. The Distance-Vector algorithm aims to calculate the shortest path from each node to every other node by having each router use its routing table to communicate exclusively with its immediate neighbours. We study the solution of the Distance-Vector problem using a recursive CTE (Common Table Expression) that filters exploding path discoveries through appropriate upper bounds and cycle detections to avoid exponential run times in certain cases. This approach is scrutinized in comparison with the established method that performs periodic updates in routing tables. Here, the implementation of the recursive CTE and the accompanying SQL script are explained in detail. We then investigate whether using recursive CTE with SQL can be practically useful in solving the Distance-Vector Routing problem.

## Repository Contents

- `graph_1.sql`: The PostgreSQL script implementing the recursive CTE solution for Distance Vector Routing for a sample graph with 5 nodes.
- `graph_2.sql`: The PostgreSQL script implementing the recursive CTE solution for Distance Vector Routing for a sample graph with 4 nodes.
- 'Distance_Vector_Routing_with_SQL.pdf': University Presentation on Distance Vector Routing with SQL.
-  'Ausarbeitung_SQL.pdf': Article on the topic of Distance-Vector Routing with SQL.

## Usage

To use the SQL script, follow these steps:

1. Visit the PostgreSQL downloads page https://www.postgresql.org/download/ and select the appropriate version for your operating system.
2. Import the `graph_1.sql` or `graph_2.sql` file into your PostgreSQL database.
3. Run the scripts in your PostgreSQL environment.
4. Alternatively, create your own input graph by following the conventions used in the article or SQL files and run the algorithm.

## Article Link

You can find the full article https://github.com/jexela/Distance-Vector-Routing-With-SQL.

## License

This work is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).

## Questions and Feedback

If you have any questions or feedback, please feel free to maronken@arcor.de
