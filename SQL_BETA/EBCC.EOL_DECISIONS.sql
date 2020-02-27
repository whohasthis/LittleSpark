select distinct inst_le_no from (
select distinct inst_le_no, last_mod_date from eolc.eol_item_info where country_code = '897' order by last_mod_date desc 
) fetch first 10 rows only
select * from ebcc.eol_decisions where country_code = 'USA' and SENT_TIMESTAMP is not null order by sent_timestamp desc fetch first 10 rows only
select * from eolc.eol_supp_info where eol_supp_no = 'E0021096501'
select * from eolc.eol_item_info where eol_supp_no = 'E0021096501'
select * from eolc.tokens where  eol_supp_no = 'E0021096501'
select i.country_code, i.eol_supp_no, i.supp_lev_lease, i.cust_no, d.decision_number from eolc.eol_supp_info i, eolc.eol_decisions d where i.eol_supp_no = d.eol_supp_no and d.decision_number = '64920180828175947955'


select * from eolc.eol_decisions where decision_number = '64920180828174913301'
select * from eolc.eol_supp_info where eol_supp_no = 'E0021096202'
select i.country_code, i.eol_supp_no, i.supp_lev_lease, i.inst_cust_no, d.decision_number from eolc.eol_item_info i, eolc.eol_decisions d where i.eol_supp_no = d.eol_supp_no and d.decision_number = '64920180828174913301'

select * from ebcc.email_queue where confirmation_no = '89720180628132544562'

update ebcc.email_queue set cc = 'whweiwei@cn.ibm.com' where confirmation_no = 'CAN20180129162859104'

update ebcc.eol_decisions set PO_NUMBER = 'PO_NUMBER_TS1T'||'-'||CONTRACT_SERIAL 
where decision_number = '64920180517091209136'


----reset decision
update ebcc.eol_decisions set sent_to_backend = null, sent_timestamp = null, backend_received = null, received_timestamp = null 
where decision_number = '89720191126190244766'

update ebcc.eol_decisions set sent_to_backend = '20191127010110000404', sent_timestamp = '2019-11-27 01:01:10.436764', backend_received = null, received_timestamp = null 
where decision_number = '89720191126190244766'

select * from eolc.eol_decisions order by dec_submit_date desc fetch first 10 rows only

select max(decision_number), min(decision_number) from eolc.eol_decisions

update eolc.eol_decisions set PO_NUMBER = 'PO_NUMBER_TST'||'-'||CONTRACT_SERIAL 
where decision_number = '89720110511074338712'

select * from eolc.eol_decisions where decision_number = '64920180502142705977'

update eolc.eol_decisions set sent_to_backend = null, sent_timestamp = null, backend_received = null, received_timestamp = null 
where decision_number = '89720170809113137924'