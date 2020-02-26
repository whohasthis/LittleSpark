select * from ccaudit.background_request where create_timestamp > '2018-11-12 00:00:00'

select * from ccaudit.background_request where parameters like '%david 615%'

--copy download request from audit table
--insert into ebcc.background_request
select 'jobDownload', '1', parameters, current timestamp, created_by, 'OPEN', attempts, current timestamp, updated_by
from ccaudit.background_request where create_timestamp = '2018-06-13 11:10:53.669'

2018-04-11 00:42:11.544587

select seq_num, parameters 
select *
from ccaudit.background_request where TRIG_INSERT_DATE in ('2018-04-11 00:42:11.544587', '2018-05-17 21:56:06.451988') and  CREATED_BY = '310001WWYF'

select * from ebcc.background_request where create_timestamp > '2018-05-29 00:00:00' and created_by = '2700025VVQ'

select * from db2ent.suser_profile where user_id = 'baixp@cn.ibm.com'


 SELECT DISTINCT eitm.country_code, rtrim(eitm.machine_type) as machine_type, rtrim(eitm.model) as model, rtrim(eitm.contract_serial) as contract_serial, eitm.mes, rtrim(eitm.manuf_serial_no) as manuf_serial_no, rtrim(ai.product_class) as product_class, rtrim(ai.product_type) as product_type, rtrim(ai.product_category) as product_category, rtrim(ai.manufacturer_name) as manufacturer_name, rtrim(aici.asset_tag) as asset_tag, rtrim(ai.asset_description) as asset_description, rtrim(aici.configuration_id) as configuration_id, rtrim(aici.cust_asset_status) as cust_asset_status, rtrim(aici.machine_comments) as machine_comments, rtrim(aici.inst_site_name) as inst_site_name, rtrim(aici.customer_division) as customer_division, rtrim(aici.cust_dept) as cust_dept, rtrim(eitm.contract_supp_no) as contract_supp_no, eitm.contract_item_no, rtrim(aici.purchase_order) as purchase_order, rtrim(aici.cost_center) as cost_center, rtrim(ai.type_of_financing) as type_of_financing, rtrim(eitm.mla_no) as mla_no, rtrim(ai.cust_ref_1) as cust_ref_1, rtrim(ai.cust_ref_2) as cust_ref_2, rtrim(eitm.dcd_supp_no) as dcd_supp_no, rtrim(ai.CONTR_ENTITY_IND) as CONTR_ENTITY_IND, rtrim(eitm.offline_decision) as offline_decision, eitm.offline_eff_date, rtrim(eitm.last_subm_supp_no) as last_subm_supp_no, eitm.eol_date, eitm.dec_status, rtrim(edec.decision_number) as decision_number, edec.dec_submit_date, edec.first_name, edec.last_name, eitm.dec_eol_option, eitm.dec_renew_term, eitm.dec_eol_value, eitm.dec_eol_cur,  COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = eitm.inst_company and epridis.customer_no = eitm.inst_cust_no and epridis.eol_option = eitm.dec_eol_option and (epridis.tc_id = eitm.tcid_1 or epridis.tc_id = eitm.tcid_2 or epridis.tc_id = eitm.tcid_3 ) ),COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitm.dec_eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ),(select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = 'ALL' and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitm.dec_eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ))) as text_key , eitm.dec_frequency, eitm.dec_adv_arr, eitm.dec_conc_date, rtrim(eitm.eol_supp_no) as eol_supp_no, rtrim(eitm.po_number) as po_number, rtrim(mu.user_last_name) as user_last_name, rtrim(mu.user_first_name) as user_first_name, rtrim(mu.user_employee_id) as user_employee_id, rtrim(mu.user_email_add) as user_email_add, rtrim(mu.user_telephone) as user_telephone, rtrim(mu.user_division) as user_division, rtrim(mu.user_department) as user_department, rtrim(ai.inst_cust_no) as inst_cust_no, rtrim(custinst.customer_name) as customer_name, rtrim(custinst.address1) as address1, rtrim(custinst.address2) as address2, rtrim(custinst.address3) as address3, rtrim(custinst.address4) as address4, rtrim(custinst.address5) as address5, rtrim(custinst.address6) as address6, rtrim(custinv.address1) as o_address1, rtrim(custinv.address2) as o_address2, rtrim(custinv.address3) as o_address3, rtrim(custinv.address4) as o_address4, rtrim(custinv.address5) as o_address5, rtrim(custinv.address6) as o_address6, rtrim(ai.bill_cust_no) as bill_cust_no, rtrim(custinv.customer_name) as o_customer_name, CAST(COALESCE(ret.RECEIVE_DATE, ai.RETURN_DATE) AS DATE), COALESCE(ret.RECEIVE_STATUS, ai.RETURN_STATUS) , rtrim(aud.asset_user_def1) as asset_user_def1, rtrim(aud.asset_user_def2) as asset_user_def2, rtrim(aud.asset_user_def3) as asset_user_def3, rtrim(aud.asset_user_def4) as asset_user_def4, rtrim(aud.finance_user_def1) as finance_user_def1, rtrim(aud.finance_user_def2) as finance_user_def2, rtrim(aud.loc_user_def1) as loc_user_def1, rtrim(aud.loc_user_def2) as loc_user_def2, rtrim(aud.billing_user_def1) as billing_user_def1, rtrim(aud.billing_user_def2) as billing_user_def2, rtrim(mu.user_def1) as user_def1, rtrim(mu.user_def2) as user_def2, rtrim(vud.user_def1) as o_user_def1, rtrim(vud.user_def2) as o_user_def2, rtrim(edec.eol_opt_decision) as eol_opt_decision, rtrim(eitm.last_tran_reversal) as last_tran_reversal, eitm.country_code as o_country_code, rtrim(eitm.eol_supp_no) as o_eol_supp_no, eitm.eol_supp_line_itm, rtrim(eitm.contract_serial) as o_contract_serial, eitm.mes as o_mes, rtrim(eitm.machine_type) as o_machine_type, rtrim(eitm.model) as o_model, eitm.dec_status as o_dec_status, rtrim(eitm.lock_data) as lock_data, eitm.price_exp_date, rtrim(eitm.eol_supp_uniq_id) as eol_supp_uniq_id, 'eol_item_info' , case when (ai.contract_uniq_id is null or ent_outer.legal_entity_no is null ) then null else eitmopt.eol_option end as eol_option, case when (ai.contract_uniq_id is null or ent_outer.legal_entity_no is null ) then null else eitmopt.renew_term end as renew_term, case when (ai.contract_uniq_id is null or ent_outer.legal_entity_no is null ) then null else eitmopt.eol_value end as eol_value, case when (ai.contract_uniq_id is null or ent_outer.legal_entity_no is null ) then null else eitmopt.eol_cur end as eol_cur,  COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = eitm.inst_company and epridis.customer_no = eitm.inst_cust_no and epridis.eol_option = eitmopt.eol_option and (epridis.tc_id = eitm.tcid_1 or epridis.tc_id = eitm.tcid_2 or epridis.tc_id = eitm.tcid_3 ) ),COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitmopt.eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ),(select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = 'ALL' and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitmopt.eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ))) as text_key , case when (ai.contract_uniq_id is null or ent_outer.legal_entity_no is null ) then null else eitmopt.frequency end as frequency, case when (ai.contract_uniq_id is null or ent_outer.legal_entity_no is null ) then null else eitmopt.adv_arr end as adv_arr , 'item' as query_type , '0' as coterm_type FROM (ebcc.eol_item_info eitm JOIN ebcc.user_entitlements ent ON (ent.ir_unique_id='2700011KGE' AND (((eitm.country_code = ent.country_code AND eitm.inst_le_no = ent.legal_entity_no) AND ((ent.company_number = 'ALL') OR (eitm.inst_company = ent.company_number AND ent.customer_number = 'ALL') OR (eitm.inst_company = ent.company_number AND eitm.inst_cust_no = ent.customer_number)))))) LEFT OUTER JOIN ebcc.asset_item ai ON (eitm.country_code = ai.country_code AND eitm.machine_type = ai.machine_type AND eitm.contract_serial = ai.contract_serial AND eitm.mes = ai.mes) LEFT OUTER JOIN ebcc.user_entitlements ent_outer ON (ent_outer.ir_unique_id='2700011KGE' AND (((ai.country_code = ent_outer.country_code AND ai.inst_le_no = ent_outer.legal_entity_no) AND ((ent_outer.company_number = 'ALL') OR (ai.inst_company = ent_outer.company_number AND ent_outer.customer_number = 'ALL') OR (ai.inst_company = ent_outer.company_number AND ai.inst_cust_no = ent_outer.customer_number))))) LEFT OUTER JOIN ebcc.eol_supp_info esup ON (eitm.country_code = esup.country_code AND eitm.eol_supp_no = esup.eol_supp_no) LEFT OUTER JOIN ebcc.a_item_cust_input aici ON (eitm.country_code = aici.country_code AND eitm.contract_uniq_id = aici.contract_uniq_id) LEFT OUTER JOIN ebcc.eol_decisions edec ON (eitm.country_code = edec.country_code AND eitm.last_subm_supp_no = edec.eol_supp_no AND eitm.last_subm_dec_no = edec.decision_number AND eitm.last_subm_supp_line_itm = edec.eol_supp_line_itm) LEFT OUTER JOIN ebcc.eol_item_options eitmopt ON (eitm.country_code = eitmopt.country_code AND eitm.eol_supp_no = eitmopt.eol_supp_no AND eitm.eol_supp_uniq_id = eitmopt.eol_supp_uniq_id AND eitm.price_exp_date >= cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date) AND esup.hide_opt_details = '2' ) LEFT OUTER JOIN ebcc.machine_user mu ON (eitm.country_code = mu.country_code AND eitm.contract_uniq_id = mu.contract_uniq_id) LEFT OUTER JOIN ebcc.asset_user_data aud ON (eitm.country_code = aud.country_code AND eitm.contract_uniq_id = aud.contract_uniq_id) LEFT OUTER JOIN ebcc.vendor_user_data vud ON (eitm.country_code = vud.country_code AND eitm.contract_uniq_id = vud.contract_uniq_id) LEFT OUTER JOIN ebcc.vw_customer_install custinst ON (ai.country_code = custinst.country_code AND ai.inst_le_no = custinst.legal_entity_no AND ai.inst_company = custinst.company_number AND ai.inst_cust_no = custinst.customer_number) LEFT OUTER JOIN ebcc.vw_customer_invoice custinv ON (ai.bill_to_country = custinv.country_code AND ai.bill_le_no = custinv.legal_entity_no AND ai.bill_to_company = custinv.company_number AND ai.bill_cust_no = custinv.customer_number) LEFT OUTER JOIN ebcc.returns ret ON (eitm.country_code = ret.country_code AND eitm.contract_uniq_id = ret.contract_uniq_id) LEFT OUTER JOIN ebcc.eol_decision_grid edecgrid ON (esup.country_code = edecgrid.country_code AND edecgrid.time_period = CASE WHEN cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date) BETWEEN esup.effective_date AND esup.decision_deadline THEN '1' WHEN cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date) BETWEEN esup.decision_deadline +1 DAY AND esup.eol_date THEN '2' WHEN cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date) BETWEEN esup.eol_date +1 DAY AND esup.price_exp_date THEN '3' WHEN cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date) > esup.price_exp_date THEN '4' ELSE '0' END  AND edecgrid.decision = CASE WHEN esup.dec_eol_option IS NULL THEN 'NU' WHEN esup.dec_status != 'SUBM' THEN 'NU' ELSE SUBSTR(esup.dec_eol_option, 1, 2) END AND edecgrid.new_decision = SUBSTR(eitmopt.eol_option, 1, 2)  AND edecgrid.allowed = '1') WHERE eitm.country_code='760'  AND eitm.eol_date between '2010-1-1' and '2010-1-31'  AND (eitm.lock_data = '1' OR eitm.dec_status IN ('DRAF' ,'NEW' ,'OFFLINE' ,'SUBM' )) AND eitm.EFFECTIVE_DATE <= cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date) 
 UNION ALL 
SELECT DISTINCT eol_item_mes.country_code, rtrim(eol_item_mes.machine_type) as machine_type, rtrim(eol_item_mes.model) as model, rtrim(eol_item_mes.contract_serial) as contract_serial, eol_item_mes.mes, rtrim(ai.manuf_serial_no) as manuf_serial_no, rtrim(ai.product_class) as product_class, rtrim(ai.product_type) as product_type, rtrim(ai.product_category) as product_category, rtrim(ai.manufacturer_name) as manufacturer_name, rtrim(aici.asset_tag) as asset_tag, rtrim(ai.asset_description) as asset_description, rtrim(aici.configuration_id) as configuration_id, rtrim(aici.cust_asset_status) as cust_asset_status, rtrim(aici.machine_comments) as machine_comments, rtrim(aici.inst_site_name) as inst_site_name, rtrim(aici.customer_division) as customer_division, rtrim(aici.cust_dept) as cust_dept, rtrim(eol_item_mes.contract_supp_no) as contract_supp_no, eol_item_mes.contract_item_no, rtrim(aici.purchase_order) as purchase_order, rtrim(aici.cost_center) as cost_center, rtrim(ai.type_of_financing) as type_of_financing, rtrim(ai.mla_no) as mla_no, rtrim(ai.cust_ref_1) as cust_ref_1, rtrim(ai.cust_ref_2) as cust_ref_2, rtrim(eitm.dcd_supp_no) as dcd_supp_no, rtrim(ai.CONTR_ENTITY_IND) as CONTR_ENTITY_IND, rtrim(eitm.offline_decision) as offline_decision, eitm.offline_eff_date, rtrim(eitm.last_subm_supp_no) as last_subm_supp_no, eol_item_mes.eol_date, eitm.dec_status, rtrim(edec.decision_number) as decision_number, edec.dec_submit_date, edec.first_name, edec.last_name, eitm.dec_eol_option, eitm.dec_renew_term, eitm.dec_eol_value, eitm.dec_eol_cur,  COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = eitm.inst_company and epridis.customer_no = eitm.inst_cust_no and epridis.eol_option = eitm.dec_eol_option and (epridis.tc_id = eitm.tcid_1 or epridis.tc_id = eitm.tcid_2 or epridis.tc_id = eitm.tcid_3 ) ),COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitm.dec_eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ),(select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = 'ALL' and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitm.dec_eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ))) as text_key , eitm.dec_frequency, eitm.dec_adv_arr, eitm.dec_conc_date, rtrim(eol_item_mes.eol_supp_no) as eol_supp_no, rtrim(eitm.po_number) as po_number, rtrim(mu.user_last_name) as user_last_name, rtrim(mu.user_first_name) as user_first_name, rtrim(mu.user_employee_id) as user_employee_id, rtrim(mu.user_email_add) as user_email_add, rtrim(mu.user_telephone) as user_telephone, rtrim(mu.user_division) as user_division, rtrim(mu.user_department) as user_department, rtrim(ai.inst_cust_no) as inst_cust_no, rtrim(custinst.customer_name) as customer_name, rtrim(custinst.address1) as address1, rtrim(custinst.address2) as address2, rtrim(custinst.address3) as address3, rtrim(custinst.address4) as address4, rtrim(custinst.address5) as address5, rtrim(custinst.address6) as address6, rtrim(custinv.address1) as o_address1, rtrim(custinv.address2) as o_address2, rtrim(custinv.address3) as o_address3, rtrim(custinv.address4) as o_address4, rtrim(custinv.address5) as o_address5, rtrim(custinv.address6) as o_address6, rtrim(ai.bill_cust_no) as bill_cust_no, rtrim(custinv.customer_name) as o_customer_name, CAST(COALESCE(ret.RECEIVE_DATE, ai.RETURN_DATE) AS DATE), COALESCE(ret.RECEIVE_STATUS, ai.RETURN_STATUS) , rtrim(aud.asset_user_def1) as asset_user_def1, rtrim(aud.asset_user_def2) as asset_user_def2, rtrim(aud.asset_user_def3) as asset_user_def3, rtrim(aud.asset_user_def4) as asset_user_def4, rtrim(aud.finance_user_def1) as finance_user_def1, rtrim(aud.finance_user_def2) as finance_user_def2, rtrim(aud.loc_user_def1) as loc_user_def1, rtrim(aud.loc_user_def2) as loc_user_def2, rtrim(aud.billing_user_def1) as billing_user_def1, rtrim(aud.billing_user_def2) as billing_user_def2, rtrim(mu.user_def1) as user_def1, rtrim(mu.user_def2) as user_def2, rtrim(vud.user_def1) as o_user_def1, rtrim(vud.user_def2) as o_user_def2, rtrim(edec.eol_opt_decision) as eol_opt_decision, rtrim(eitm.last_tran_reversal) as last_tran_reversal, eol_item_mes.country_code as o_country_code, rtrim(eol_item_mes.eol_supp_no) as o_eol_supp_no, eol_item_mes.eol_supp_line_itm, rtrim(eol_item_mes.contract_serial) as o_contract_serial, eol_item_mes.mes as o_mes, rtrim(eol_item_mes.machine_type) as o_machine_type, rtrim(eol_item_mes.model) as o_model, eitm.dec_status as o_dec_status, rtrim(eitm.lock_data) as lock_data, eitm.price_exp_date, rtrim(eitm.eol_supp_uniq_id) as eol_supp_uniq_id, 'eol_item_mes' , cast(null as char) as eol_option , cast(null as int) as renew_term , cast(null as dec) as eol_value , cast(null as char) as eol_cur , cast(null as char) as text_key , cast(null as char) as frequency , cast(null as char) as adv_arr  , 'mes' as query_type , case when eitm.eol_date = eol_item_mes.eol_date then '2' else '3' end as coterm_type FROM (ebcc.eol_item_info eitm JOIN ebcc.user_entitlements ent ON (ent.ir_unique_id='2700011KGE' AND (((eitm.country_code = ent.country_code AND eitm.inst_le_no = ent.legal_entity_no) AND ((ent.company_number = 'ALL') OR (eitm.inst_company = ent.company_number AND ent.customer_number = 'ALL') OR (eitm.inst_company = ent.company_number AND eitm.inst_cust_no = ent.customer_number)))))) JOIN ebcc.eol_item_mes eol_item_mes ON (eitm.country_code = eol_item_mes.country_code AND eitm.eol_supp_no = eol_item_mes.eol_supp_no AND eitm.contract_serial = eol_item_mes.contract_serial AND RTRIM(eitm.mes) = '' ) LEFT OUTER JOIN ebcc.asset_item ai ON (eol_item_mes.country_code = ai.country_code AND eol_item_mes.machine_type = ai.machine_type AND eol_item_mes.contract_serial = ai.contract_serial AND eol_item_mes.mes = ai.mes) LEFT OUTER JOIN ebcc.eol_supp_info esup ON (eol_item_mes.country_code = esup.country_code AND eol_item_mes.eol_supp_no = esup.eol_supp_no) LEFT OUTER JOIN ebcc.a_item_cust_input aici ON (eol_item_mes.country_code = aici.country_code AND eol_item_mes.contract_uniq_id = aici.contract_uniq_id) LEFT OUTER JOIN ebcc.eol_decisions edec ON (eitm.country_code = edec.country_code AND eitm.last_subm_supp_no = edec.eol_supp_no AND eitm.last_subm_dec_no = edec.decision_number AND eitm.last_subm_supp_line_itm = edec.eol_supp_line_itm) LEFT OUTER JOIN ebcc.machine_user mu ON (eol_item_mes.country_code = mu.country_code AND eol_item_mes.contract_uniq_id = mu.contract_uniq_id) LEFT OUTER JOIN ebcc.asset_user_data aud ON (eol_item_mes.country_code = aud.country_code AND eol_item_mes.contract_uniq_id = aud.contract_uniq_id) LEFT OUTER JOIN ebcc.vendor_user_data vud ON (eol_item_mes.country_code = vud.country_code AND eol_item_mes.contract_uniq_id = vud.contract_uniq_id) LEFT OUTER JOIN ebcc.vw_customer_install custinst ON (ai.country_code = custinst.country_code AND ai.inst_le_no = custinst.legal_entity_no AND ai.inst_company = custinst.company_number AND ai.inst_cust_no = custinst.customer_number) LEFT OUTER JOIN ebcc.vw_customer_invoice custinv ON (ai.bill_to_country = custinv.country_code AND ai.bill_le_no = custinv.legal_entity_no AND ai.bill_to_company = custinv.company_number AND ai.bill_cust_no = custinv.customer_number) LEFT OUTER JOIN ebcc.returns ret ON (eol_item_mes.country_code = ret.country_code AND eol_item_mes.contract_uniq_id = ret.contract_uniq_id) WHERE EXISTS (SELECT 1 FROM (ebcc.eol_item_info eiSub JOIN ebcc.user_entitlements ent ON (ent.ir_unique_id='2700011KGE' AND (((eiSub.country_code = ent.country_code AND eiSub.inst_le_no = ent.legal_entity_no) AND ((ent.company_number = 'ALL') OR (eiSub.inst_company = ent.company_number AND ent.customer_number = 'ALL') OR (eiSub.inst_company = ent.company_number AND eiSub.inst_cust_no = ent.customer_number)))))) LEFT OUTER JOIN ebcc.asset_item ai ON (eiSub.country_code = ai.country_code AND eiSub.machine_type = ai.machine_type AND eiSub.contract_serial = ai.contract_serial AND eiSub.mes = ai.mes) LEFT OUTER JOIN ebcc.a_item_cust_input aici ON (eiSub.country_code = aici.country_code AND eiSub.contract_uniq_id = aici.contract_uniq_id) LEFT OUTER JOIN ebcc.eol_decisions edec ON (eiSub.country_code = edec.country_code AND eiSub.last_subm_supp_no = edec.eol_supp_no AND eiSub.last_subm_dec_no = edec.decision_number AND eiSub.last_subm_supp_line_itm = edec.eol_supp_line_itm) LEFT OUTER JOIN ebcc.machine_user mu ON (eiSub.country_code = mu.country_code AND eiSub.contract_uniq_id = mu.contract_uniq_id) LEFT OUTER JOIN ebcc.asset_user_data aud ON (eiSub.country_code = aud.country_code AND eiSub.contract_uniq_id = aud.contract_uniq_id) LEFT OUTER JOIN ebcc.vendor_user_data vud ON (eiSub.country_code = vud.country_code AND eiSub.contract_uniq_id = vud.contract_uniq_id) LEFT OUTER JOIN ebcc.vw_customer_install custinst ON (ai.country_code = custinst.country_code AND ai.inst_le_no = custinst.legal_entity_no AND ai.inst_company = custinst.company_number AND ai.inst_cust_no = custinst.customer_number) LEFT OUTER JOIN ebcc.vw_customer_invoice custinv ON (ai.bill_to_country = custinv.country_code AND ai.bill_le_no = custinv.legal_entity_no AND ai.bill_to_company = custinv.company_number AND ai.bill_cust_no = custinv.customer_number) LEFT OUTER JOIN ebcc.returns ret ON (eiSub.country_code = ret.country_code AND eiSub.contract_uniq_id = ret.contract_uniq_id) WHERE eiSub.country_code='760'  AND eiSub.eol_date between '2010-1-1' and '2010-1-31'  AND (eitm.lock_data = '1' OR eitm.dec_status IN ('DRAF' ,'NEW' ,'OFFLINE' ,'SUBM' )) AND eiSub.EFFECTIVE_DATE <= cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date)  AND (eiSub.country_code=eol_item_mes.country_code  AND eiSub.contract_serial=eol_item_mes.contract_serial)  AND eiSub.eol_supp_no=eol_item_mes.eol_supp_no  AND eiSub.mes='' ) AND eol_item_mes.EFFECTIVE_DATE <= cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date)  union SELECT DISTINCT eol_item_mes.country_code, rtrim(eol_item_mes.machine_type) as machine_type, rtrim(eol_item_mes.model) as model, rtrim(eol_item_mes.contract_serial) as contract_serial, eol_item_mes.mes, rtrim(ai.manuf_serial_no) as manuf_serial_no, rtrim(ai.product_class) as product_class, rtrim(ai.product_type) as product_type, rtrim(ai.product_category) as product_category, rtrim(ai.manufacturer_name) as manufacturer_name, rtrim(aici.asset_tag) as asset_tag, rtrim(ai.asset_description) as asset_description, rtrim(aici.configuration_id) as configuration_id, rtrim(aici.cust_asset_status) as cust_asset_status, rtrim(aici.machine_comments) as machine_comments, rtrim(aici.inst_site_name) as inst_site_name, rtrim(aici.customer_division) as customer_division, rtrim(aici.cust_dept) as cust_dept, rtrim(eol_item_mes.contract_supp_no) as contract_supp_no, eol_item_mes.contract_item_no, rtrim(aici.purchase_order) as purchase_order, rtrim(aici.cost_center) as cost_center, rtrim(ai.type_of_financing) as type_of_financing, rtrim(ai.mla_no) as mla_no, rtrim(ai.cust_ref_1) as cust_ref_1, rtrim(ai.cust_ref_2) as cust_ref_2, rtrim(eitm.dcd_supp_no) as dcd_supp_no, rtrim(ai.CONTR_ENTITY_IND) as CONTR_ENTITY_IND, rtrim(eitm.offline_decision) as offline_decision, eitm.offline_eff_date, rtrim(eitm.last_subm_supp_no) as last_subm_supp_no, eol_item_mes.eol_date, eitm.dec_status, rtrim(edec.decision_number) as decision_number, edec.dec_submit_date, edec.first_name, edec.last_name, eitm.dec_eol_option, eitm.dec_renew_term, eitm.dec_eol_value, eitm.dec_eol_cur,  COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = eitm.inst_company and epridis.customer_no = eitm.inst_cust_no and epridis.eol_option = eitm.dec_eol_option and (epridis.tc_id = eitm.tcid_1 or epridis.tc_id = eitm.tcid_2 or epridis.tc_id = eitm.tcid_3 ) ),COALESCE(( select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = eitm.inst_le_no and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitm.dec_eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ),(select max(text_key) from ebcc.eol_pricing_display epridis where epridis.country_code = eitm.country_code and epridis.enterprise_no = 'ALL' and epridis.company_no = 'ALL' and epridis.customer_no = 'ALL' and (epridis.eol_option = eitm.dec_eol_option  or epridis.eol_option = 'ALL') and epridis.tc_id =  'ALL' ))) as text_key , eitm.dec_frequency, eitm.dec_adv_arr, eitm.dec_conc_date, rtrim(eol_item_mes.eol_supp_no) as eol_supp_no, rtrim(eitm.po_number) as po_number, rtrim(mu.user_last_name) as user_last_name, rtrim(mu.user_first_name) as user_first_name, rtrim(mu.user_employee_id) as user_employee_id, rtrim(mu.user_email_add) as user_email_add, rtrim(mu.user_telephone) as user_telephone, rtrim(mu.user_division) as user_division, rtrim(mu.user_department) as user_department, rtrim(ai.inst_cust_no) as inst_cust_no, rtrim(custinst.customer_name) as customer_name, rtrim(custinst.address1) as address1, rtrim(custinst.address2) as address2, rtrim(custinst.address3) as address3, rtrim(custinst.address4) as address4, rtrim(custinst.address5) as address5, rtrim(custinst.address6) as address6, rtrim(custinv.address1) as o_address1, rtrim(custinv.address2) as o_address2, rtrim(custinv.address3) as o_address3, rtrim(custinv.address4) as o_address4, rtrim(custinv.address5) as o_address5, rtrim(custinv.address6) as o_address6, rtrim(ai.bill_cust_no) as bill_cust_no, rtrim(custinv.customer_name) as o_customer_name, CAST(COALESCE(ret.RECEIVE_DATE, ai.RETURN_DATE) AS DATE), COALESCE(ret.RECEIVE_STATUS, ai.RETURN_STATUS) , rtrim(aud.asset_user_def1) as asset_user_def1, rtrim(aud.asset_user_def2) as asset_user_def2, rtrim(aud.asset_user_def3) as asset_user_def3, rtrim(aud.asset_user_def4) as asset_user_def4, rtrim(aud.finance_user_def1) as finance_user_def1, rtrim(aud.finance_user_def2) as finance_user_def2, rtrim(aud.loc_user_def1) as loc_user_def1, rtrim(aud.loc_user_def2) as loc_user_def2, rtrim(aud.billing_user_def1) as billing_user_def1, rtrim(aud.billing_user_def2) as billing_user_def2, rtrim(mu.user_def1) as user_def1, rtrim(mu.user_def2) as user_def2, rtrim(vud.user_def1) as o_user_def1, rtrim(vud.user_def2) as o_user_def2, rtrim(edec.eol_opt_decision) as eol_opt_decision, rtrim(eitm.last_tran_reversal) as last_tran_reversal, eol_item_mes.country_code as o_country_code, rtrim(eol_item_mes.eol_supp_no) as o_eol_supp_no, eol_item_mes.eol_supp_line_itm, rtrim(eol_item_mes.contract_serial) as o_contract_serial, eol_item_mes.mes as o_mes, rtrim(eol_item_mes.machine_type) as o_machine_type, rtrim(eol_item_mes.model) as o_model, eitm.dec_status as o_dec_status, rtrim(eitm.lock_data) as lock_data, eitm.price_exp_date, rtrim(eitm.eol_supp_uniq_id) as eol_supp_uniq_id, 'eol_item_mes' , cast(null as char) as eol_option , cast(null as int) as renew_term , cast(null as dec) as eol_value , cast(null as char) as eol_cur , cast(null as char) as text_key , cast(null as char) as frequency , cast(null as char) as adv_arr  , 'mes' as query_type , '4' as coterm_type FROM (ebcc.eol_item_info eitm JOIN ebcc.user_entitlements ent ON (ent.ir_unique_id='2700011KGE' AND (((eitm.country_code = ent.country_code AND eitm.inst_le_no = ent.legal_entity_no) AND ((ent.company_number = 'ALL') OR (eitm.inst_company = ent.company_number AND ent.customer_number = 'ALL') OR (eitm.inst_company = ent.company_number AND eitm.inst_cust_no = ent.customer_number)))))) JOIN ebcc.eol_item_mes eol_item_mes ON (eitm.country_code = eol_item_mes.country_code AND eitm.eol_supp_no = eol_item_mes.eol_supp_no AND eitm.contract_serial = eol_item_mes.contract_serial AND RTRIM(eitm.mes) != ''  and eitm.eol_date=eol_item_mes.eol_date ) LEFT OUTER JOIN ebcc.asset_item ai ON (eol_item_mes.country_code = ai.country_code AND eol_item_mes.machine_type = ai.machine_type AND eol_item_mes.contract_serial = ai.contract_serial AND eol_item_mes.mes = ai.mes) LEFT OUTER JOIN ebcc.eol_supp_info esup ON (eol_item_mes.country_code = esup.country_code AND eol_item_mes.eol_supp_no = esup.eol_supp_no) LEFT OUTER JOIN ebcc.a_item_cust_input aici ON (eol_item_mes.country_code = aici.country_code AND eol_item_mes.contract_uniq_id = aici.contract_uniq_id) LEFT OUTER JOIN ebcc.eol_decisions edec ON (eitm.country_code = edec.country_code AND eitm.last_subm_supp_no = edec.eol_supp_no AND eitm.last_subm_dec_no = edec.decision_number AND eitm.last_subm_supp_line_itm = edec.eol_supp_line_itm) LEFT OUTER JOIN ebcc.machine_user mu ON (eol_item_mes.country_code = mu.country_code AND eol_item_mes.contract_uniq_id = mu.contract_uniq_id) LEFT OUTER JOIN ebcc.asset_user_data aud ON (eol_item_mes.country_code = aud.country_code AND eol_item_mes.contract_uniq_id = aud.contract_uniq_id) LEFT OUTER JOIN ebcc.vendor_user_data vud ON (eol_item_mes.country_code = vud.country_code AND eol_item_mes.contract_uniq_id = vud.contract_uniq_id) LEFT OUTER JOIN ebcc.vw_customer_install custinst ON (ai.country_code = custinst.country_code AND ai.inst_le_no = custinst.legal_entity_no AND ai.inst_company = custinst.company_number AND ai.inst_cust_no = custinst.customer_number) LEFT OUTER JOIN ebcc.vw_customer_invoice custinv ON (ai.bill_to_country = custinv.country_code AND ai.bill_le_no = custinv.legal_entity_no AND ai.bill_to_company = custinv.company_number AND ai.bill_cust_no = custinv.customer_number) LEFT OUTER JOIN ebcc.returns ret ON (eol_item_mes.country_code = ret.country_code AND eol_item_mes.contract_uniq_id = ret.contract_uniq_id) WHERE EXISTS (SELECT 1 FROM (ebcc.eol_item_info eiSub JOIN ebcc.user_entitlements ent ON (ent.ir_unique_id='2700011KGE' AND (((eiSub.country_code = ent.country_code AND eiSub.inst_le_no = ent.legal_entity_no) AND ((ent.company_number = 'ALL') OR (eiSub.inst_company = ent.company_number AND ent.customer_number = 'ALL') OR (eiSub.inst_company = ent.company_number AND eiSub.inst_cust_no = ent.customer_number)))))) LEFT OUTER JOIN ebcc.asset_item ai ON (eiSub.country_code = ai.country_code AND eiSub.machine_type = ai.machine_type AND eiSub.contract_serial = ai.contract_serial AND eiSub.mes = ai.mes) LEFT OUTER JOIN ebcc.a_item_cust_input aici ON (eiSub.country_code = aici.country_code AND eiSub.contract_uniq_id = aici.contract_uniq_id) LEFT OUTER JOIN ebcc.eol_decisions edec ON (eiSub.country_code = edec.country_code AND eiSub.last_subm_supp_no = edec.eol_supp_no AND eiSub.last_subm_dec_no = edec.decision_number AND eiSub.last_subm_supp_line_itm = edec.eol_supp_line_itm) LEFT OUTER JOIN ebcc.machine_user mu ON (eiSub.country_code = mu.country_code AND eiSub.contract_uniq_id = mu.contract_uniq_id) LEFT OUTER JOIN ebcc.asset_user_data aud ON (eiSub.country_code = aud.country_code AND eiSub.contract_uniq_id = aud.contract_uniq_id) LEFT OUTER JOIN ebcc.vendor_user_data vud ON (eiSub.country_code = vud.country_code AND eiSub.contract_uniq_id = vud.contract_uniq_id) LEFT OUTER JOIN ebcc.vw_customer_install custinst ON (ai.country_code = custinst.country_code AND ai.inst_le_no = custinst.legal_entity_no AND ai.inst_company = custinst.company_number AND ai.inst_cust_no = custinst.customer_number) LEFT OUTER JOIN ebcc.vw_customer_invoice custinv ON (ai.bill_to_country = custinv.country_code AND ai.bill_le_no = custinv.legal_entity_no AND ai.bill_to_company = custinv.company_number AND ai.bill_cust_no = custinv.customer_number) LEFT OUTER JOIN ebcc.returns ret ON (eiSub.country_code = ret.country_code AND eiSub.contract_uniq_id = ret.contract_uniq_id) WHERE eiSub.country_code='760'  AND eiSub.eol_date between '2010-1-1' and '2010-1-31'  AND (eitm.lock_data = '1' OR eitm.dec_status IN ('DRAF' ,'NEW' ,'OFFLINE' ,'SUBM' )) AND eiSub.EFFECTIVE_DATE <= cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date)  AND (eiSub.country_code=eol_item_mes.country_code  AND eiSub.contract_serial=eol_item_mes.contract_serial)  AND eiSub.eol_supp_no=eol_item_mes.eol_supp_no  AND eiSub.mes!=''  AND eiSub.eol_date=eol_item_mes.eol_date ) and not EXISTS (SELECT 1 FROM (ebcc.eol_item_info eiSub JOIN ebcc.user_entitlements ent ON (ent.ir_unique_id='2700011KGE' AND (((eiSub.country_code = ent.country_code AND eiSub.inst_le_no = ent.legal_entity_no) AND ((ent.company_number = 'ALL') OR (eiSub.inst_company = ent.company_number AND ent.customer_number = 'ALL') OR (eiSub.inst_company = ent.company_number AND eiSub.inst_cust_no = ent.customer_number)))))) LEFT OUTER JOIN ebcc.asset_item ai ON (eiSub.country_code = ai.country_code AND eiSub.machine_type = ai.machine_type AND eiSub.contract_serial = ai.contract_serial AND eiSub.mes = ai.mes) LEFT OUTER JOIN ebcc.a_item_cust_input aici ON (eiSub.country_code = aici.country_code AND eiSub.contract_uniq_id = aici.contract_uniq_id) LEFT OUTER JOIN ebcc.eol_decisions edec ON (eiSub.country_code = edec.country_code AND eiSub.last_subm_supp_no = edec.eol_supp_no AND eiSub.last_subm_dec_no = edec.decision_number AND eiSub.last_subm_supp_line_itm = edec.eol_supp_line_itm) LEFT OUTER JOIN ebcc.machine_user mu ON (eiSub.country_code = mu.country_code AND eiSub.contract_uniq_id = mu.contract_uniq_id) LEFT OUTER JOIN ebcc.asset_user_data aud ON (eiSub.country_code = aud.country_code AND eiSub.contract_uniq_id = aud.contract_uniq_id) LEFT OUTER JOIN ebcc.vendor_user_data vud ON (eiSub.country_code = vud.country_code AND eiSub.contract_uniq_id = vud.contract_uniq_id) LEFT OUTER JOIN ebcc.vw_customer_install custinst ON (ai.country_code = custinst.country_code AND ai.inst_le_no = custinst.legal_entity_no AND ai.inst_company = custinst.company_number AND ai.inst_cust_no = custinst.customer_number) LEFT OUTER JOIN ebcc.vw_customer_invoice custinv ON (ai.bill_to_country = custinv.country_code AND ai.bill_le_no = custinv.legal_entity_no AND ai.bill_to_company = custinv.company_number AND ai.bill_cust_no = custinv.customer_number) LEFT OUTER JOIN ebcc.returns ret ON (eiSub.country_code = ret.country_code AND eiSub.contract_uniq_id = ret.contract_uniq_id) WHERE eiSub.country_code='760'  AND eiSub.eol_date between '2010-1-1' and '2010-1-31'  AND (eitm.lock_data = '1' OR eitm.dec_status IN ('DRAF' ,'NEW' ,'OFFLINE' ,'SUBM' )) AND eiSub.EFFECTIVE_DATE <= cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date)  AND (eiSub.country_code=eol_item_mes.country_code  AND eiSub.contract_serial=eol_item_mes.contract_serial)  AND eiSub.eol_supp_no=eol_item_mes.eol_supp_no  AND eiSub.mes='' ) AND eol_item_mes.EFFECTIVE_DATE <= cast(((current_timestamp - cast(current_timezone/10000 as integer) hour) + 9.0 hour) as date)  ORDER BY country_code,eol_supp_no,contract_serial,mes, eol_option