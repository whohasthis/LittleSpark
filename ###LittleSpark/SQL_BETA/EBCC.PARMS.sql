select * from ebcc.app_params where parameter = 'ENABLE_LOG_VI_MISSING_SERIAL_DATA_TO_DUP_TABLE'
select * from eolc.country_parms where field_name = 'DAYS_AFTER_DECISION'
insert into eolc.country_parms 
select '649', field_name, field_value, qualifier 
from eolc.country_parms where field_name in  ('CONTACT_US_ID','CONTACT_US_ID_SUPPORT_USER')
and country_code = '897'
update eolc.country_Parms set field_value = 'castellm@us.ibm.com,smuralid@us.ibm.com' where field_name = 'CONTACT_US_ID' and country_code= '897'

delete from ebcc.country_parms where field_name in  ('CONTACT_US_ID','CONTACT_US_ID_SUPPORT_USER')