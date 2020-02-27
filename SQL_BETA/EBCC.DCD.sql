select * from ebcc.dcd_hdr_chg where country_code = '897' and supp_no  ='065026069'

select * from ebcc.dcd_hdr where country_code = '897' and supp_no  ='065026069'


insert into ebcc.dcd_hdr_chg (country_code, supp_no, dcd_status, mod_user_id, last_mod_ts, first_name, last_name) values('897', '065026069', 'COMP', 'GCMS', current timestamp, null, null)
--
delete from ebcc.dcd_item_chg where supp_no in('DavidTest01')

update ebcc.dcd_dec_item set USER_COMMENTS  = 'user_comments'|| ASSET_SEQ_NUM where supp_no in('DCDTest02', 'DavidTest01', 'DCDTest01')

select * from ebcc.dcd_dec_hdr where supp_no like '%DavidTest%'

select * from ebcc.dcd_dec_hdr order by cust_upd_date desc fetch first 10 rows only


--reset DCD Decsion
update ebcc.dcd_dec_hdr set sent_to_backend = null, sent_timestamp = null, backend_received = null, rcvd_timestamp = null, num_retries = 0
where country_code = '897' and supp_no ='DavidTest01'--, '016341007', '803172003') 
--expire an DCD
update ebcc.dcd_hdr set qvd_date_comp = current date - 1 day  where country_code = '649' and supp_no = '016282009'

--unexpire an DCD
update ebcc.dcd_hdr set qvd_date_comp = current date + 1 month  where country_code = '897' and supp_no in('DCDSundryTest03', 'DavidTest01')

--not received DCD decisions
select * from ebcc.dcd_dec_hdr where sent_to_backend is not null and backend_received is null

--entitlement web service
select distinct us.scope_1, us.scope_2
--, us.scope_3, us.scope_4, up.user_id, up.e_mail_address 
from db2ent.user_entitlement e, db2ent.user_profile up, db2ent.user_scope us 
where e.entitlement in ('DVS','DVSE','DVSEA') AND E.APPLICATION = US.APPLICATION
	AND US.COMPANY_ID = E.COMPANY_ID AND US.UNIQUE_ID = uP.UNIQUE_ID AND US.APPLICATION = 'EBCC'
	and us.scope_1 = '897'
fetch first 100 rows only

select * from ebcc.customer where legal_entity_no = '153804570' and customer_type = '1'

