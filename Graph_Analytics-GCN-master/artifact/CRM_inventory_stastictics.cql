// count of all lables
CALL db.labels() YIELD label
CALL apoc.cypher.run('MATCH (:`'+label+'`) RETURN count(*) as count',{}) YIELD value
RETURN label, value.count

//or 

CALL apoc.meta.stats() YIELD labels
RETURN labels

//count of all relationships
CALL db.relationshipTypes() YIELD relationshipType as type
CALL apoc.cypher.run('MATCH ()-[:`'+type+'`]->() RETURN count(*) as count',{}) YIELD value
RETURN type, value.count

//Database schema
:schema

//Database schema visualization
CALL db.schema.visualization

// list all relationships
CALL db.relationshipTypes()

// List node labels
CALL db.labels()

// Count all nodes
MATCH (n) RETURN count(n)

// Count all relationships
MATCH ()-[r]->() RETURN count(*)

// Data storage sizes
:sysinfo

// return some sample data
MATCH (n) WHERE rand() <= 0.1
RETURN
DISTINCT labels(n),
count(*) AS SampleSize,
avg(size(keys(n))) as Avg_PropertyCount,
min(size(keys(n))) as Min_PropertyCount,
max(size(keys(n))) as Max_PropertyCount,
avg(size( (n)-[]-() ) ) as Avg_RelationshipCount,
min(size( (n)-[]-() ) ) as Min_RelationshipCount,
max(size( (n)-[]-() ) ) as Max_RelationshipCount

// List all node types and counts
MATCH (n) RETURN labels(n) AS NodeType, count(n) AS NumberOfNodes;

// List all properties of a node - Sale
MATCH (u:Sale) RETURN keys(u) LIMIT 1
// List all properties of a node - Client
MATCH (u:Client) RETURN keys(u) LIMIT 1
// List all properties of a node - BusinessProblem
MATCH (u:BusinessProblem) RETURN keys(u) LIMIT 1

// List all properties of a relationship
MATCH ()-[t:selling_to]-() RETURN keys(t) LIMIT 1

//calculate uniqueness of a property
MATCH (u:Sale) 
RETURN count(DISTINCT u.name) AS DistinctName, 
       count(u.name) AS TotalUser, 
       100*count(DISTINCT u.name)/count(u.name) AS Uniqueness_percentage;

// Calculate nullability of a property
MATCH (u:Sale) WHERE u.name IS null RETURN count(u);

// Calculate min, max, average and standard deviation of the values of a property
//MATCH (p:Product) 
//RETURN min(p.favorites) AS MinFavorites, 
      // max(p.favorites) AS MaxFavorites, 
       //avg(p.favorites) AS AvgFavorites, 
       //stDev(p.favorites) AS StdFavorites;

//Find out most often used values for a property - Client
MATCH (p:Client)
RETURN p.name AS Answers, count(p.name) AS Count
ORDER BY Answers ASC;


//Find out most often used values for a property - BusinessProblem
MATCH (p:BusinessProblem)
RETURN p.name AS Answers, count(p.name) AS Count
ORDER BY Answers ASC;

