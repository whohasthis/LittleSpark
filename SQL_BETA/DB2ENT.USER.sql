select * from db2ent.user_scope where company_id = 10007540

insert into db2ent.company_profile values(10008117, 'CANADA TEST', 'CANADA test', null, null, null, null, null, null, null, null, null, null,current timestamp, null, 'EBCC' )

insert into db2ent.company_scope values('EBCC', 10008117, '649', '205247372', 'ALL', 'ALL', '', '', 'Y','Steven Qi', 'wjwh@cn.ibm.com', 'Y', 'wjwh@cn.ibm.com', current timestamp)

insert into db2ent.user_scope values('2700011KGE', 'EBCC', 10008117, '649', '205247372', 'ALL', 'ALL','', '', 'wjwh@cn.ibm.com', current timestamp)

insert into db2ent.user_entitlement
select unique_id, application,  10008117, user_type, entitlement, company_flag, comments, modify_by, current timestamp from DB2ENT.USER_ENTITLEMENT where unique_id = '2700011KGE' and company_id = 104950



-- user profile
select * from db2ent.user_profile where user_id = 'ciscolaura@beta.com'
select user_id, email_address from db2ent.user_profile where unique_id in (
select unique_id from db2ent.user_scope where scope_2 = '205247372' and application = 'EOLL' and (scope_4 = '816019' or scope_4 = 'ALL' )
)with ur
select * from eolc.supp_user_enrollment
--insert into eolc.supp_user_enrollment values
('whweiwei@cn.ibm.com', 'USA,897,649,CAN', '2700018084', 'whweiwei@cn.ibm.com', current timestamp)


update eolc.supp_user_enrollment set SUPPORTED_COUNTRY_CODE = '649,CAN,897,USA'
where user_id = 'ebcctest9@ibm.com'
('baixp@cn.ibm.com', '897,649,USA,CAN', '2700025VVQ', 'baixp@cn.ibm.com', current timestamp
)
select * from db2ent.user_scope where unique_id in
(select unique_id from db2ent.user_profile where user_id in ('EOLC#1@beta.com','EOLC#2@beta.com','EOLC#3@beta.com')
)

select * from db2ent.suser_scope where unique_id = '3100010C6K'

select * from eolc.user_entitlements where ir_unique_id = '2800000400'

select * from eolc.support_enrollment

--insert into EBCC.SUPPORT_ENROLLMENT values
('0100002JVC', 'dcdsup@ibm.com', 'tripodi@us.ibm.com', 'Added by David for testing as Maria requested')

select * from eolc.user_entitlements where ir_unique_id = (select unique_id from db2ent.suser_profile where user_id = 'candemo2@ibm.com')
'270003GG3B'

select * from EBCC.VW_ENT_DCD_SCOPE where supp_no = '016282001'

select * from EBCC.VW_ENT_DCD_HDR where supp_no = '016282001'

--support user
select * from db2ent.user_profile where unique_id in (select distinct unique_id from db2ent.user_scope where uSEr_type = 'USUP' and application = 'EBCC')

select * from db2ent.user_scope where unique_id = '010000158Y'

select * from db2ent.user_entitlement where unique_id = '010000158Y'
=======================add support user entitlement===================================
insert into db2ent.user_entitlement values
('010000158Y', 'EBCC', 58, 'USUP','SUP','','', '27000047XM', current timestamp),
('010000158Y', 'EBCC', 89, 'USUP','SUP','','', '27000047XM', current timestamp)


insert into db2ent.user_scope
values
('010000158Y', 'EBCC', 58, 'CAN', 'ALL', 'ALL', 'ALL', 'USUP','SUP', '27000047XM', current timestamp),
('010000158Y', 'EBCC', 89, 'USA', 'ALL', 'ALL', 'ALL', 'USUP','SUP', '27000047XM', current timestamp)
========================================================================================================

===============add user entitlement data ===================================================
insert into db2ent.company_profile values(10008111, 'CANADA TEST', 'CANADA test', null, null, null, null, null, null, null, null, null, null,current timestamp, null, 'EBCC' )

insert into db2ent.company_scope values('EBCC', 10008111, '649', '200091189', 'ALL', 'ALL', '', '', 'Y','Steven Qi', 'wjwh@cn.ibm.com', 'Y', 'wjwh@cn.ibm.com', current timestamp)

insert into db2ent.user_scope values('2700011KGE', 'EBCC', 10008111, '649', '200091189', 'ALL', 'ALL','', '', 'wjwh@cn.ibm.com', current timestamp)

insert into db2ent.user_entitlement
select unique_id, application,  10008111, user_type, entitlement, company_flag, comments, modify_by, current timestamp from DB2ENT.USER_ENTITLEMENT where unique_id = '2700011KGE' and company_id = 10007648
=================================================================================================

===============================revert EOLC userid back to first time sign in==================================

select * from db2ent.user_profile where user_id = 'EOLC#1@beta.com'

select * from db2ent.user_scope where unique_id = '2800009NJX'

--delete from db2ent.user_scope where unique_id = '2800009NJX'

==============================================================================================================