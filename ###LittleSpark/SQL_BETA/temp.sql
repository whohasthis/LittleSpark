select * from ebcc.asset_item where country_code = 'IER'

E0092496301
select country_code, machine_type, contract_serial, eol_supp_no, src, last_mod_date, last_mod_user from ebcc.eol_item_info where country_code = '897' and machine_type = 'ZLNN' and contract_serial in('PC0ARN6S','PC0ARPVV','PC0ARPWP','PC0ARPY8','PC0ARPZF','PC0ARPZT','PC0ARPZ2','PC0ARQ0Q','PC0DK4NP','PC0DQ6SS','PC0ETP0D','PC0ETP0E','PC0ETP0F','PC0ETP0G','PC0ETP0H','PC0ETP0Z','PC0ETP02','PC0ETP11','PC0ETP17','PC0ETP19','PC0FMX4E','PC0GFX2V','PC0GFX30','PF0MR1LM','PF0MR1MG','PF0MR1NK','PF0MR3PY','PF0MR3SZ','PF0MR3S3','PF0MR5VW','PF0NEHF6','PF0NEKLT','PF0NEKQK','PF0NEKR5','R90KZLWF','R90K0KAT','R90K0KBB','R90K2NSE','R90K2NSN','R90K2NS6','R90LLHE3','R90LLHE7')
E0092496501
select country_code, machine_type, contract_serial, eol_supp_no, src, last_mod_date, last_mod_user from ebcc.eol_item_info where country_code = '897' and machine_type = 'ZLND' and contract_serial in('MJ03SEXK','000BF02US','000LL8DUS','000LMVGUS','000M7XBUS')

E0091536002
select country_code, machine_type, contract_serial, eol_supp_no, src, last_mod_date, last_mod_user from ebcc.eol_item_info where country_code = '897' and machine_type = 'CISS' and contract_serial in('2FPKP','5GC9V','7GT4E','7GX4A','7MQMK','8MY7U','8N4BK','9N5RC')
E0092063802
select country_code, machine_type, contract_serial, eol_supp_no, src, last_mod_date, last_mod_user from ebcc.eol_item_info where country_code = '897' and machine_type = 'CISS' and contract_serial in('2RR59','2RTKN','2RTPE','2RTTC')


select * from eolc.eol_supp_info where eol_supp_no = 'E0092135901'

update ebcc.Step_Payment set SRC='IER',last_mod_date=current timestamp, contract_serial = '0039959', contract_uniq_id = replace(contract_uniq_id, '39959', '0039959') where country_code = '897' and contract_uniq_id = '832447812-2839-39959-0'
select * from ebcc.step_payment where contract_uniq_id = '832447812-2839-0039959-0'

(select distinct contract_uniq_id from ebcc.asset_item where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = '1164-ZVBTY' with UR);

select machine_type, contract_serial from ebcc.eol_decisions where rtrim(contract_serial) in ('00B35C7','00B9757','00D04F7','21695EW','21695FW')

select machine_type, contract_serial from eolc.eol_decisions where rtrim(contract_serial) in ('02C80D7')

select distinct machine_type, contract_serial, mes from eolc.eol_item_mes where src= 'IER'
order by machine_type, contract_serial

select distinct rtrim(machine_type), rtrim(contract_serial), rtrim(mes) from eolc.eol_item_info where src= 'IER'
order by rtrim(machine_type), rtrim(contract_serial)

select * from eolc.eol_item_info where  machine_type = '9119' and contract_serial in ('00AE467', '21AE467')

select * from eolc.eol_item_info where rtrim(machine_type)||'-'||rtrim(contract_serial) in ('3592-78F0288','3592-7844725','3592-7844856','3952-7815847','3952-7815983','3956-78D1707','3956-78D2006','3957-78H6173')

select * from ebcc.eol_decisions where dec_submit_date > '2020-02-07'


select * from db2ent.user_entitlement where unique_id = '2700011KGE' and application = 'EBTT'
--UPDATE db2ent.user_entitlement set application = 'EBCC' where application = 'EBCC' and unique_id in 
(SELECT DISTINCT A.unique_id
FROM DB2ENT.USER_ENTITLEMENT A INNER JOIN DB2ENT.USER_SCOPE B ON A.UNIQUE_ID
     = B.UNIQUE_ID AND A.COMPANY_ID = B.COMPANY_ID AND A."APPLICATION" = B.
     "APPLICATION" INNER JOIN DB2ENT.ENTITLE_LOOKUP C ON A."APPLICATION" = C.
     "APPLICATION" AND A.ENTITLEMENT = C.ENTITLEMENT
WHERE (B.SCOPE_1 = '897')
     AND NOT (A.ENTITLEMENT IN ('SUP', 'V')))
     
     
select count(*) from ebcc.step_payment where country_code = '897'

select count(*) from ebcc.payment_information where country_code = '897'

select distinct country_code, token_last_chars, eol_supp_no, status, last_mod_date from eolc.tokens where eol_supp_no in(
select eol_supp_no from eolarchive.eol_supp_info where eol_supp_no != 'E0085380601' and ( insert_ts between '2019-06-11' and '2019-06-12' )
) order by last_mod_date, status


select * from ebcc.dcd_hdr where country_code = '649'

select * from eolc.tokens where token_last_chars = 'T319K3'

select * from eolc.eol_item_info where eol_supp_no = 'E0000486301'

insert into ebcc.asset_item
select country_code, machine_type, model, contract_serial, mes, CONTRACT_SUPP_NO, contract_uniq_id,EOL_SUPP_LINE_ITM,
null,null,null,null,null,null,'1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,
country_code,inst_le_no, inst_company,inst_cust_no,null,null,null,null,null,null,null,null,null,null,null,null,null,
country_code,inst_le_no, inst_company,inst_cust_no,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,
'','','','','',''
from ebcc.eol_item_info 
where eol_supp_no = 'E0000488101' and country_code = '649'