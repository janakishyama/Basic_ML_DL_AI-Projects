//export FILEPATH=file:///CRM_new.csv

// Uniqueness constraints.
CREATE CONSTRAINT ON (s:Sale) ASSERT s.name IS UNIQUE;
CREATE CONSTRAINT ON (p:Product) ASSERT p.name IS UNIQUE;
CREATE CONSTRAINT ON (s:Seller) ASSERT s.name IS UNIQUE;
CREATE CONSTRAINT ON (i:InquirySource) ASSERT i.name IS UNIQUE;
CREATE CONSTRAINT ON (c:Client) ASSERT c.name IS UNIQUE;
CREATE CONSTRAINT ON (b:BusinessProblem) ASSERT b.name IS UNIQUE;
CREATE CONSTRAINT ON (s:SaleStatus) ASSERT s.name IS UNIQUE;


// Load data from CSV file
//USING PERIODIC COMMIT

LOAD CSV WITH HEADERS 
FROM 'file:///CRM_new1.csv' AS line

CREATE (sale:Sale { name: line.`sales_enquiry_id` })
SET sale.Tender = line.`Forml_tend`,
    sale.RFI = line.`RFI`,
    sale.RFP = line.`RFP`,
	sale.CrossSale = line.`Cross_sale`

MERGE (product:Product { name: toUpper(line.Product) })
MERGE (seller:Seller { name: toUpper(line.`Seller`) })
MERGE (inquirysource:InquirySource { name: toUpper(line.`Source`) })
MERGE (client:Client { name: toUpper(line.`Client`) })
SET client.CompanySize = line.`Comp_size`,
    client.HaveBudget = line.`Budgt_alloc`,
    client.GrowthStatus = line.`Growth`,
	client.ClientValue = line.`Att_t_client`

MERGE (businessproblem:BusinessProblem { name: toUpper(line.`Deal_type`) })
SET client.ProblemClarity = line.`Scope`,
    client.BusinessUpscale = line.`Up_sale`,
    client.NeedsDefined = line.`Needs_def`,
	client.BusinessAttitude = line.`Posit_statm`

MERGE (salestatus:SaleStatus { name: toUpper(line.`Status`) })

CREATE (sale)-[:sales_of]->(product)
CREATE (sale)-[s:selling_to]->(client)
SET s.Competitors = line.`Competitors`,
    s.SalesValue = line.`Strat_deal`

CREATE (sale)-[:is_based_on]->(businessproblem)
CREATE (sale)-[:have_outcome]->(salestatus)

CREATE (seller)-[:incharge_of]->(sale)
CREATE (inquirysource)-[:received_request]->(sale)

MERGE (client)-[:have]->(businessproblem)