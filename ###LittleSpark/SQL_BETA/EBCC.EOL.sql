select distinct country_code, eol_supp_no, 
--INST_LE_NO, INST_COMPANY, 
inst_cust_no,
--,INVOICE_LE_NO, INVOICE_COMPANY, 
invoice_cust_no 
from eolc.eol_item_info where eol_supp_no IN ('E0000008801', 'E0000008901', 'E0000009001', 'E0000009101', 'E0000009201')
E0000008801
E0000008901
E0000009001
E0000009101
E0000009201

select distinct inst_le_no, load_timestamp from ebcc.eol_supp_info where country_code = '897' and supp_lev_lease = '1'  order by load_timestamp desc fetch first 10 rows only