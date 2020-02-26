select * from ebcc.text_reference where field_name LIKE '%LEASE_SUB_STATUS%' and country_code = '897' order by field_name 

select * from ebcc.text_reference where field_text  LIKE '%Continuer%' and country_code = '897' order by field_name 


insert into ebcc.text_reference values
('649', '', 'DCD_REASON', 'CO')
select '649', locale, field_name, field_value, field_text, 'CC', current timestamp
from ebcc.text_reference where field_name in('DCD_STATUS', 'DCD_REASON') and country_code = '897'

select * from ebcc.text_reference where field_name in ('TAX_TYPE') and country_code = '649'

--delete from ebcc.text_reference where field_value in('RSNT', 'RCAL','VEWR', 'VEWN') and field_name = 'DCD_STATUS'