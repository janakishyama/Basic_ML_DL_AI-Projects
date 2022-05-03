// All source of contact or sales enquery
MATCH (i:InquirySource)
RETURN i.name AS InquirySource
ORDER BY InquirySource;

// All sourses with total count of  sales requests where sales outcome is successfull (Tabular view)
MATCH (ss:SaleStatus {name:'WON'})
MATCH (sid:Sale)-[:have_outcome]->(ss)
MATCH (i:InquirySource)-[:received_request]->(sid)
RETURN i.name AS source, ss.name AS total_won, COUNT(*) AS count
ORDER BY count DESC;

//graph view --- all sales node for InquirySource= OTHER and displaying all the parent and child node of sales noded 
MATCH (i:InquirySource{name:'OTHER'})
MATCH (i)-[:received_request]->(sid:Sale)
Match p=()-[*1]->(sid:Sale)-[*1]->()
return p

//graph view --- all sales node for InquirySource= OTHER and displaying all the child node of sales noded 
MATCH (i:InquirySource{name:'OTHER'})
MATCH (i)-[:received_request]->(sid:Sale)
Match p=(sid:Sale)-[*1]->() return p

// Table count of product with successfull sales
MATCH pl=(sid:Sale)-[:have_outcome]->(ss:SaleStatus {name:'WON'})
MATCH (sid:Sale)-[:sales_of]->(p:Product)
RETURN p.name as books, count(pl) as total

// Table of sales with total WON and LOST 
MATCH (sid:Sale)-[:have_outcome]->(ss:SaleStatus {name:'WON'})
WITH count(sid) as positive
MATCH (sid2:Sale)-[:have_outcome]->(ss:SaleStatus {name:'LOST'})
RETURN positive, count(sid2) as negative

// Table of product with count of total loss and win --- Cross table view
MATCH (p:Product) <-[:sales_of]- (sid:Sale)-[:have_outcome]->(ss:SaleStatus )
With p.name as product, ss.name as type, count(ss) as type_val
With product, collect([type,type_val]) as keypairlist 
With product, apoc.map.fromPairs(keypairlist)as value 
Return product, COALESCE(value.WON,0) as Won, COALESCE(value.LOST,0) as Lost

//Table of product with count of total loss and win - table list view
MATCH (p:Product) <-[:sales_of]- (sid:Sale)-[:have_outcome]->(ss:SaleStatus )
With p.name as product, ss.name as type, count(ss) as type_val
With product, collect([type,type_val]) as keypairlist 
With product, apoc.map.fromPairs(keypairlist)as value 
Return product,value

//count of products sold by each sellers
MATCH (sl:Seller)-[:incharge_of]- (sid:Sale)-[:have_outcome]->(ss:SaleStatus )
With sl.name as seller, ss.name as type, count(ss) as type_val
With seller, collect([type,type_val]) as keypairlist 
With seller, apoc.map.fromPairs(keypairlist)as value 
Return seller, COALESCE(value.WON,0) as Won, COALESCE(value.LOST,0) as Lost

//List of clients with churn count.
MATCH (p:Client) <-[:selling_to]- (sid:Sale)-[:have_outcome]->(ss:SaleStatus )
With p.name as client, ss.name as type, count(ss) as type_val
With client, collect([type,type_val]) as keypairlist 
With client, apoc.map.fromPairs(keypairlist)as value 
Return client, COALESCE(value.WON,0) as Won, COALESCE(value.LOST,0) as Lost

// Cross table for cilent type with business problem as Solution
MATCH (sid:Sale)-[:is_based_on]->(bp:BusinessProblem {name:'SOLUTION'})
MATCH (p:Client) <-[:selling_to]- (sid)-[:have_outcome]->(ss:SaleStatus )
With p.name as client, ss.name as type, count(ss) as type_val
With client, collect([type,type_val]) as keypairlist 
With client, apoc.map.fromPairs(keypairlist)as value 
Return client, COALESCE(value.WON,0) as Won, COALESCE(value.LOST,0) as Lost

// Cross table for cilent type with business problem as Project
MATCH (sid:Sale)-[:is_based_on]->(bp:BusinessProblem {name:'PROJECT'})
MATCH (p:Client) <-[:selling_to]- (sid)-[:have_outcome]->(ss:SaleStatus )
With p.name as client, ss.name as type, count(ss) as type_val
With client, collect([type,type_val]) as keypairlist 
With client, apoc.map.fromPairs(keypairlist)as value 
Return client, COALESCE(value.WON,0) as Won, COALESCE(value.LOST,0) as Lost

// Graph View of all slellers whose sales outcome is WON along with product list
MATCH (sid:Sale)-[:have_outcome]->(ss:SaleStatus {name:'WON'})
MATCH (sl:Seller)-[:incharge_of]- (sid:Sale)-[:sales_of]->(p:Product )
return * LIMIT 5

// Table view of count each seller and corrsponding product combination whose sale status is = WON
MATCH (sid:Sale)-[:have_outcome]->(ss:SaleStatus {name:'WON'})
MATCH (sl:Seller)-[:incharge_of]- (sid:Sale)-[:sales_of]->(p:Product )
return sl.name as seller, p.name as product, COUNT(ss) as won_count
ORDER BY won_count DESC

//consolidated list view - of count each seller and corrsponding product combination for toatal sale enqueries
MATCH (sl:Seller)-[:incharge_of]- (sid:Sale)-[:sales_of]->(p:Product )
WITH sl.name as seller, p.name as type, COUNT(sid) as type_val
With seller, collect([type, type_val]) as keypairlist 
With seller, apoc.map.fromPairs(keypairlist)as value 
Return seller, value

// consolidated list view - of count each seller and corrsponding product combination whose sale status is = WON
MATCH (sid:Sale)-[:have_outcome]->(ss:SaleStatus {name:'WON'})
MATCH (sl:Seller)-[:incharge_of]- (sid:Sale)-[:sales_of]->(p:Product )
WITH sl.name as seller, p.name as type, COUNT(sid) as type_val
With seller, collect([type,type_val]) as keypairlist 
With seller, apoc.map.fromPairs(keypairlist)as value 
Return seller, value


// table view of total count of seller, products and source currently in the dataset
MATCH (n:Product)
WITH count(n) as count
RETURN 'Product' as label, count
UNION ALL
MATCH (n:Seller)
WITH count(n) as count
RETURN 'Seller' as label, count
UNION ALL
MATCH (n:InquirySource)
WITH count(n) as count
RETURN 'InquirySource' as label, count