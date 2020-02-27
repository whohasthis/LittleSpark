select * from eolc.customer where country_code = '897' and customer_number ='6962141'

select * from ebcc.asset_item where country_code = '649' and  MANUF_SERIAL_NO = 'FCH1728843H' 

Select DISTINCT country_code, customer_number, rtrim(street_address), rtrim(compl_address), rtrim(city_post_town), rtrim(state_prov), rtrim(postal_code), rtrim(customer_name), rtrim(customer_type) as ct, rtrim(po_box), rtrim(po_box_city), rtrim(po_box_zip)  from eolc.customer  
where ( country_code='897' and legal_entity_no='003254810' and company_number='003254810' and customer_number='0014703'  ) 
or  ( country_code='897' and legal_entity_no='003254810' and company_number='003254810' and customer_number='6962141'  ) order by ct  

update eolc.customer set postal_code = null, po_box_zip = null where country_code='897' and legal_entity_no='003254810' and company_number='003254810' and customer_number='6962141' and customer_type='2'

Select DISTINCT rtrim(street_address), rtrim(compl_address), rtrim(city_post_town), rtrim(state_prov), rtrim(postal_code), rtrim(customer_name), rtrim(customer_type) as ct, rtrim(po_box), rtrim(po_box_city), rtrim(po_box_zip)  from eolc.customer  
where ( country_code='649' and legal_entity_no='222495088' and company_number='222495088' and customer_number='924759' and customer_type='1' ) 
or  ( country_code='649' and legal_entity_no='222495088' and company_number='253406912' and customer_number='100277' and customer_type='2' ) order by ct  

select * from eolc.customer where   country_code='649' and legal_entity_no='222495088' and company_number='222495088' and customer_number='0924759' 

Select DISTINCT rtrim(street_address), rtrim(compl_address), rtrim(city_post_town), rtrim(state_prov), rtrim(postal_code), rtrim(customer_name), rtrim(customer_type) as ct, rtrim(po_box), rtrim(po_box_city), rtrim(po_box_zip)  from eolc.customer  
where ( country_code='649' and legal_entity_no='205247372' and company_number='205247372' and customer_number='815275' and customer_type='1' ) 
or  ( country_code='649' and legal_entity_no='205247372' and company_number='205247372' and customer_number='087320' and customer_type='2' ) order by ct  