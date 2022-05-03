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


LOAD CSV WITH HEADERS 
FROM 'file:///CRM_social.csv' AS line
MERGE (sale:Sale { name: line.`sale_from` })
SET sale.product = line.`Product`,
	sale.seller = line.`Seller`,
	sale.authority = line.`Authority`,
	sale.comp_size = line.`Comp_size`,
	sale.Competitors = line.`Competitors`,
	sale.Purch_dept = line.`Purch_dept`,
	sale.Partnership = line.`Partnership`,
	sale.Budgt_alloc = line.`Budgt_alloc`,
	sale.Forml_tend = line.`Forml_tend`,
	sale.Growth = line.`Growth`,
	sale.Posit_statm = line.`Posit_statm`,
	sale.Source = line.`Source`,
	sale.Client = line.`Client`,
	sale.Scope = line.`Scope`,
	sale.Strat_deal = line.`Strat_deal`,
	sale.Up_sale = line.`Up_sale`,
	sale.Deal_type = line.`Deal_type`,
	sale.Needs_def = line.`Needs_def`,
	sale.Att_t_client = line.`Att_t_client`,
    sale.RFI = line.`RFI`,
    sale.RFP = line.`RFP`,
	sale.CrossSale = line.`Cross_sale`
	sale.status = line.`status`