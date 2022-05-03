CREATE CONSTRAINT ON (s:Sale) ASSERT s.name IS UNIQUE;

LOAD CSV WITH HEADERS 
FROM 'file:///sale_social.csv' AS line
MERGE (sale:Sale { name: line.`sale_from` })
MERGE (sale:Sale { name: line.`sale_to` })


LOAD CSV WITH HEADERS 
FROM 'file:///sale_social.csv' AS line
MATCH (b:Sale {name: line.sale_to})
MATCH (a:Sale {name: line.sale_from})
MERGE (a)-[r:IS_CONNECTED]->(b);