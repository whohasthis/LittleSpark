--DELETE FROM EBCC.EOL_SUPP_INFO WHERE EOL_SUPP_NO IN ('E0030116709', 'E0030116507') AND COUNTRY_CODE = 'CAN'

select * from eolc.eol_item_info where eol_supp_no in ('E0030230901', 'E0030307801', 'E0030312101')--,'E0030116404','E0030116405')

select * from eolc.eol_item_options where eol_supp_no in ('E0030230901', 'E0030307801', 'E0030312101') and country_code = 'CAN'--,'E0030116404','E0030116405')


select * from ebcc.asset_item where (country_code, contract_uniq_id) in 
(select country_code, contract_uniq_id from ebcc.eol_item_info
where eol_supp_no in ('E0000013301','E0000013401','E0000013501','E0000013601','E0000013701','E0000013801','E0000013901','E0000014001'))


select * from ebcc.eol_item_info where contract_serial = '1F1L81R'

select * from ebcc.eol_decisions where decision_number = '89720171102224813713'

select * from ebcc.email_queue where confirmation_no = '89720171102224813713'

SELECT DISTINCT rtrim(eitm.last_subm_supp_no), rtrim(ewrk.eol_supp_no), rtrim(ewrk.eol_supp_uniq_id), rtrim(eitm.last_tran_reversal), rtrim(eitm.contract_serial), rtrim(eitm.manuf_serial_no), rtrim(eitm.machine_type), rtrim(eitm.model), eitm.mes, ewrk.eol_date, rtrim(ewrk.dec_status), ewrk.dec_stat_chg_date, ewrk.row_number, eitm.country_code, rtrim(ewrk.eol_supp_no), rtrim(ewrk.eol_supp_uniq_id), rtrim(eitm.contract_serial), rtrim(eitm.manuf_serial_no), rtrim(eitm.machine_type), rtrim(eitm.model), eitm.mes, ewrk.eol_date, rtrim(ewrk.dec_status), ewrk.dec_stat_chg_date, rtrim(eitm.supp_lev_lease), rtrim(ewrk.lock_data), ewrk.dec_deadline_date, eitm.price_exp_date, rtrim(ai.contract_supp_no), rtrim(ai.contract_uniq_id), rtrim(ewrk.eol_option), ewrk.renew_term, ewrk.eol_value, ewrk.eol_cur, rtrim(ewrk.frequency), rtrim(ewrk.adv_arr), ewrk.conclude_date, rtrim(eitm.dec_eol_option), eitm.dec_renew_term, eitm.dec_eol_value, eitm.dec_eol_cur, rtrim(eitm.dec_frequency), rtrim(eitm.dec_adv_arr), eitm.dec_conc_date, rtrim(req.request_status), rtrim(eitm.last_tran_reversal), rtrim(eitm.last_subm_supp_no), rtrim(ewrk.po_number), rtrim(eitm.po_number) , case when (ai.contract_uniq_id is null or ent.legal_entity_no is null ) then null else ent.legal_entity_no end as ent_flag ,  COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = eitm.inst_company and epridis.customer_no = eitm.inst_cust_no and epridis.eol_option = ewrk.eol_option and (epridis.tc_id = eitm.tcid_1 or epridis.tc_id = eitm.tcid_2 or epridis.tc_id = eitm.tcid_3 ) ),COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = ewrk.eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ),(select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = 'ALL' and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = ewrk.eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ))) as text_key ,  COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = eitm.inst_company and epridis.customer_no = eitm.inst_cust_no and epridis.eol_option = eitm.dec_eol_option and (epridis.tc_id = eitm.tcid_1 or epridis.tc_id = eitm.tcid_2 or epridis.tc_id = eitm.tcid_3 ) ),COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitm.dec_eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ),(select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = 'ALL' and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitm.dec_eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ))) as text_key ,  case when rtrim(eitm.mes) = '' then '0' else '1' end as coterm_flag FROM ebcc.eol_work ewrk JOIN ebcc.eol_item_info eitm ON (ewrk.eol_supp_no = eitm.eol_supp_no AND ewrk.eol_supp_uniq_id = eitm.eol_supp_uniq_id) LEFT OUTER JOIN ebcc.asset_item ai ON (eitm.country_code = ai.country_code AND eitm.contract_uniq_id = ai.contract_uniq_id) LEFT OUTER JOIN ebcc.change_request req ON (ai.country_code = req.country_code AND ai.contract_uniq_id = req.contract_uniq_id AND req.request_status = '0') LEFT OUTER JOIN ebcc.user_entitlements ent ON (ent.ir_unique_id='2700011KGE'  AND (((ai.country_code = ent.country_code AND ai.inst_le_no = ent.legal_entity_no) AND ((ent.company_number = 'ALL') OR (ai.inst_company = ent.company_number AND ent.customer_number = 'ALL') OR (ai.inst_company = ent.company_number AND ai.inst_cust_no = ent.customer_number))))) WHERE ewrk.ir_unique_id='2700011KGE'  AND ewrk.report_time='2017-10-17 01:22:13.07'  AND eitm.country_code='897'  UNION SELECT DISTINCT rtrim(eitm.last_subm_supp_no), rtrim(ewrk.eol_supp_no), rtrim(ewrk.eol_supp_uniq_id), rtrim(eitm.last_tran_reversal), rtrim(eitm.contract_serial), rtrim(eitm.manuf_serial_no), rtrim(eol_item_mes.machine_type), rtrim(eol_item_mes.model), rtrim(eol_item_mes.mes), eol_item_mes.eol_date, rtrim(ewrk.dec_status), ewrk.dec_stat_chg_date, ewrk.row_number, eitm.country_code, rtrim(ewrk.eol_supp_no), rtrim(ewrk.eol_supp_uniq_id), rtrim(eitm.contract_serial), rtrim(eitm.manuf_serial_no), rtrim(eol_item_mes.machine_type), rtrim(eol_item_mes.model), rtrim(eol_item_mes.mes), eol_item_mes.eol_date, rtrim(ewrk.dec_status), ewrk.dec_stat_chg_date, rtrim(eitm.supp_lev_lease), rtrim(ewrk.lock_data), ewrk.dec_deadline_date, eitm.price_exp_date, rtrim(eol_item_mes.contract_supp_no), rtrim(eol_item_mes.contract_uniq_id), rtrim(ewrk.eol_option), ewrk.renew_term, ewrk.eol_value, ewrk.eol_cur, rtrim(ewrk.frequency), rtrim(ewrk.adv_arr), ewrk.conclude_date, rtrim(eitm.dec_eol_option), eitm.dec_renew_term, eitm.dec_eol_value, eitm.dec_eol_cur, rtrim(eitm.dec_frequency), rtrim(eitm.dec_adv_arr), eitm.dec_conc_date, rtrim(req.request_status), rtrim(eitm.last_tran_reversal), rtrim(eitm.last_subm_supp_no), rtrim(ewrk.po_number), rtrim(eitm.po_number) , case when (ai.contract_uniq_id is null or ent.legal_entity_no is null ) then null else ent.legal_entity_no end as ent_flag ,  '' ,  '' , '3' as coterm_flag FROM ebcc.eol_work ewrk JOIN ebcc.eol_item_info eitm ON (ewrk.eol_supp_no = eitm.eol_supp_no AND ewrk.eol_supp_uniq_id = eitm.eol_supp_uniq_id) JOIN ebcc.eol_item_mes eol_item_mes ON (eol_item_mes.eol_supp_no = eitm.eol_supp_no AND eol_item_mes.country_code = eitm.country_code AND eol_item_mes.contract_serial = eitm.contract_serial AND RTRIM(eitm.mes)  =  ''  AND eitm.eol_date  != eol_item_mes.eol_date) LEFT OUTER JOIN ebcc.asset_item ai ON (eitm.country_code = ai.country_code AND eitm.contract_uniq_id = ai.contract_uniq_id) LEFT OUTER JOIN ebcc.change_request req ON (ai.country_code = req.country_code AND ai.contract_uniq_id = req.contract_uniq_id AND req.request_status = '0') LEFT OUTER JOIN ebcc.user_entitlements ent ON (ent.ir_unique_id='2700011KGE'  AND (((ai.country_code = ent.country_code AND ai.inst_le_no = ent.legal_entity_no) AND ((ent.company_number = 'ALL') OR (ai.inst_company = ent.company_number AND ent.customer_number = 'ALL') OR (ai.inst_company = ent.company_number AND ai.inst_cust_no = ent.customer_number))))) WHERE ewrk.ir_unique_id='2700011KGE'  AND ewrk.report_time='2017-10-17 01:22:13.07'  AND eitm.country_code='897'  ORDER BY 5, 9, 7, 2, 3 WITH UR


select distinct supp_lev_lease from ebcc.eol_supp_info where eol_supp_no = 'E0030116517'

--create asset_item table data from EOL_ITEM_INFO table
--insert into ebcc.asset_item
select country_code, machine_type, model, contract_serial, mes, CONTRACT_SUPP_NO, contract_uniq_id,EOL_SUPP_LINE_ITM,
null,null,null,null,null,null,'1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,
country_code,inst_le_no, inst_company,inst_cust_no,null,null,null,null,null,null,null,null,null,null,null,null,null,
country_code,inst_le_no, inst_company,inst_cust_no,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,
'','','','','',''
from ebcc.eol_item_info 
where eol_supp_no = 'E0000007901' and country_code = '760'
where eol_supp_no in ('E0000013301','E0000013401','E0000013501','E0000013601','E0000013701','E0000013801','E0000013901','E0000014001') 
and country_code = 'CAN'


--beta testing using ebccdev@ibm.com
-- new expired to new 
update ebcc.eol_item_info set eol_date = '2018-08-31', EFFECTIVE_DATE = '2018-08-14',PRICE_EXP_DATE = '2018-11-30', DECISION_DEADLINE = '2018-08-01' 
--where eol_supp_no = 'E0084385601' and country_code = '897'
where eol_supp_no in ('E0030116403','E0030116404','E0030116405','E0030116517') and country_code = 'CAN'


update ebcc.eol_supp_info set eol_date = '2018-08-31', EFFECTIVE_DATE = '2018-08-14',PRICE_EXP_DATE = '2018-11-30', DECISION_DEADLINE = '2018-08-01'
--where eol_supp_no = 'E0084385601' and country_code = '897'
where eol_supp_no in ('E0030116403','E0030116404','E0030116405','E0030116517') and country_code = 'CAN'

--submitted to new
update ebcc.eol_item_info set DEC_STATUS = 'NEW', DEC_EOL_OPTION = null, DEC_RENEW_TERM = null, DEC_EOL_VALUE = null, DEC_EOL_CUR = null,DEC_FREQUENCY=null,DEC_ADV_ARR=null,DEC_CONC_DATE=null,LAST_SUBM_DEC_NO=null,LAST_SUBM_SUPP_LINE_ITM=null,LAST_SUBM_SUPP_NO=null 
--where eol_supp_no = 'E0084385601' and country_code = '897'
where eol_supp_no in ('E0030116403','E0030116404','E0030116405','E0030116517') and country_code = 'CAN'

update ebcc.eol_supp_info set DEC_STATUS = 'NEW', DEC_EOL_OPTION = null, DEC_RENEW_TERM = null, DEC_EOL_VALUE = null, DEC_EOL_CUR = null,DEC_FREQUENCY=null,DEC_ADV_ARR=null,DEC_CONC_DATE=null 
--where eol_supp_no = 'E0084385601' and country_code = '897'
where eol_supp_no in ('E0030116403','E0030116404','E0030116405','E0030116517') and country_code = 'CAN'



update eolc.eol_item_info set DEC_STATUS = 'NEW', DEC_EOL_OPTION = null, DEC_RENEW_TERM = null, DEC_EOL_VALUE = null, DEC_EOL_CUR = null,DEC_FREQUENCY=null,DEC_ADV_ARR=null,DEC_CONC_DATE=null,LAST_SUBM_DEC_NO=null,LAST_SUBM_SUPP_LINE_ITM=null,LAST_SUBM_SUPP_NO=null where inst_le_no = '003254810'

update eolc.eol_supp_info set DEC_STATUS = 'NEW', DEC_EOL_OPTION = null, DEC_RENEW_TERM = null, DEC_EOL_VALUE = null, DEC_EOL_CUR = null,DEC_FREQUENCY=null,DEC_ADV_ARR=null,DEC_CONC_DATE=null where le_no = '003254810'

update eolc.tokens set status = 'NEW' where eol_supp_no in (select distinct eol_supp_no from eolc.eol_supp_info where le_no = '003254810' )

update ebcc.eol_supp_info set eol_date = '2017-11-30', EFFECTIVE_DATE = '2017-10-22',PRICE_EXP_DATE = '2018-01-01', DECISION_DEADLINE = '2017-10-31'
where eol_supp_no = 'E0084385601'

select * from ebcc.eol_supp_info where SUPP_LEV_LEASE = '1' and dec_status = 'NEW' and country_code = '897' order by last_mod_date desc

select * from ebcc.eol_supp_info where eol_supp_no in ('E0086743001','E0000057001','E0000056901', 'E0086875201', 'E0000056501') and country_code = '897'
select * from ebcc.eol_item_info where eol_supp_no in ('E0086743001','E0000057001','E0000056901', 'E0086875201', 'E0000056501') and country_code = '897'

select * from ebcc.eol_item_info where eol_supp_no = 'E0088123201'

update ebcc.eol_supp_info set inst_cust_no = '6962141' where eol_supp_no  = 'E0088123201'

select * from ebcc.eol_supp_info where eol_supp_no  = 'E0088123201'

select * from ebcc.asset_item where (country_code, contract_uniq_id) in (select distinct country_code, contract_uniq_id from ebcc.eol_item_info where eol_supp_no = 'E0088123201')

