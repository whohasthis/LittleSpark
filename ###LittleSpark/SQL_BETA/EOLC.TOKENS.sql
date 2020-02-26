--EOLC emulate ent#
select distinct inst_le_no from eolc.eol_item_info where country_code = '897'

select * from eolc.eol_item_info where eol_supp_no = 'E0000486901'

--
select * from eolc.tokens where country_code = 'CAN' and sync_icfs = 'N'

UPDATE EOLC.TOKENS SET SYNC_ICFS = 'Y' where country_code = 'CAN' and sync_icfs = 'N'

select country_code, eol_supp_no, machine_type,model,contract_serial, inst_cust_no, invoice_cust_no from eolc.eol_item_info where eol_supp_no = 'E0030323301'

--EOLC guest user tokens
SELECT DISTINCT RTRIM(EI.COUNTRY_CODE) AS COUNTRY_CODE, RTRIM(EI.INST_LE_NO) AS INST_LE_NO, RTRIM(EI.INST_COMPANY) AS INST_COMPANY, RTRIM(EI.INST_CUST_NO) AS INST_CUST_NO,RTRIM(EI.INVOICE_CUST_NO) AS INVOICE_CUST_NO,RTRIM(SI.CUST_NO) AS SUPP_CUST_NO,RTRIM(EI.CONTRACT_SUPP_NO) AS CONTRACT_SUPP_NO, rtrim(decrypt_char(CAST(t.token_no AS VARCHAR(32)), CAST('aug11cct' AS VARCHAR(27)))) as TOKEN, rtrim(ei.eol_supp_no) as eol_supp_no, rtrim(INST_LE_NO) as INST_LE_NO, rtrim(INST_COMPANY) as INST_COMPANY FROM EOLC.TOKENS T, EOLC.EOL_ITEM_INFO EI, EOLC.EOL_SUPP_INFO SI WHERE T.EOL_SUPP_NO=EI.EOL_SUPP_NO AND T.STATUS = 'NEW' 
and ei.country_code = '649' fetch first row only
--AND EI.EOL_SUPP_NO = SI.EOL_SUPP_NO AND EI.COUNTRY_CODE = SI.COUNTRY_CODE and ei.country_code = '649'
and ei.eol_supp_no in ('E0000486901')
(select distinct customer_number    from eolc.customer where country_code = '649' and COMPL_ADDRESS is null
)
and ei.supp_lev_lease = '1'

update eolc.tokens set status = 'NEW' where eol_supp_no = 'E0000002601'

select * from eolc.tokens where token_last_chars = 'A8QXOF'

select * from eolc.eol_item_info where eol_supp_no = 'E0030311901'

--EOLC registered user tokens
SELECT DISTINCT RTRIM(EI.INST_LE_NO) AS INST_LE_NO, RTRIM(EI.INST_COMPANY) AS INST_COMPANY, RTRIM(EI.INST_CUST_NO) AS INST_CUST_NO,RTRIM(EI.CONTRACT_SUPP_NO) AS CONTRACT_SUPP_NO, rtrim(decrypt_char(CAST(t.token_no AS VARCHAR(32)), CAST('aug11cct' AS VARCHAR(27)))) as TOKEN , ei.eol_supp_no  FROM EOLC.TOKENS T, EOLC.EOL_ITEM_INFO EI
WHERE T.EOL_SUPP_NO=EI.EOL_SUPP_NO AND T.STATUS in ('NEW', 'SUB')
and( ei.inst_cust_no in ('6962141','0014703') or ei.invoice_cust_no in ('6962141','0014703'))
--EOLC search by token
select t.*, i.inst_cust_no, i.invoice_cust_no, s.cust_no from eolc.TOKENS t, eolc.eol_item_info i, eolc.eol_supp_info s where t.token_no = encrypt(CAST('CR9YSASAOQ' AS VARCHAR(32)), CAST('aug11cct' AS VARCHAR(27)))
and t.country_code = i.country_code and t.eol_supp_no = i.eol_supp_no
and i.country_code = s.country_code and i.eol_supp_no = s.eol_supp_no

select * from eolc.tokens where token_last_chars in ('SASAOQ','T319K3')

update eolc.tokens set status = 'NEW' where token_last_chars in ('SASAOQ','T319K3')

select distinct sync_icfs, STATUS from eolc.tokens where country_code = '649' 

select * from eolc.eol_supp_info where eol_supp_no in ('E0030112302','E0030120801','E0030120701')

select * from eolc.eol_item_info where eol_supp_no in ('E0030112302','E0030120801','E0030120701')

select * from eolarchive.eol_item_info where eol_supp_no in ('E0030112302','E0030120801','E0030120701')

select * from eolarchive.eol_supp_info where eol_supp_no in ('E0030112302','E0030120801','E0030120701')


--token status update job
select distinct rtrim(si.le_no), rtrim(si.company_no), rtrim(si.cust_no),  rtrim(t.status), rtrim(t.country_code), rtrim(decrypt_char(CAST(t.token_no AS VARCHAR(32)), CAST('aug11cct' AS VARCHAR(27))))  from eolc.tokens t, EOLC.EOL_SUPP_INFO si  where t.country_code=si.country_code and t.eol_supp_no=si.eol_supp_no and t.status in ('EXP', 'SUB')  and (t.sync_icfs != 'Y' or t.sync_icfs is null)  
union  
select distinct rtrim(si.le_no), rtrim(si.company_no), rtrim(si.cust_no),  rtrim(t.status), rtrim(t.country_code), rtrim(decrypt_char(CAST(t.token_no AS VARCHAR(32)), CAST('aug11cct' AS VARCHAR(27))))  from eolc.tokens t, EOLARCHIVE.EOL_SUPP_INFO si  where t.country_code=si.country_code and t.eol_supp_no=si.eol_supp_no and t.status in ('EXP', 'SUB')  and (t.sync_icfs != 'Y' or t.sync_icfs is null)  order by 5 

