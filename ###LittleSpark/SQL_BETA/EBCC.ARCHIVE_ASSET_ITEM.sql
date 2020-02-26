--QUERY ARCHIVE TABLE

SELECT distinct audit_ts, count(*) FROM CCAUDIT.ASSET_ITEM where country_code = '897' and audit_ts > '2019-08-10' group by audit_ts
with ur

SELECT max(last_mod_date) FROM CCAUDIT.ASSET_ITEM where country_code = '897' and audit_ts > '2019-06-01' with ur group by audit_ts


select count(contract_uniq_id) from ebcc.asset_item where DATE(last_mod_date) <= (CURRENT DATE - 2 YEARS ) and lease_status in ('2','3','4') and country_code='897' 
with ur
fetch first 50000 rows only

select count(contract_uniq_id) from ebcc.asset_item where DATE(last_mod_date) <= (CURRENT DATE - 3 YEARS) and lease_status in ('2','4') and country_code='649' 
with ur
fetch first 50000 rows only

select max(last_mod_date), min(last_mod_date) from ebcc.asset_item where DATE(last_mod_date) <= (CURRENT DATE - 2 YEARS) and lease_status in ('2','3','4') and country_code='897' 
with ur

select count(*) from ebcc.asset_item where DATE(last_mod_date) <= (CURRENT DATE - 4 YEARS) and lease_status in ('2','3','4') and country_code='897' 
with ur

select * from ebcc.asset_item where contract_serial = 'G0623' and country_code = '897'