select country_code, contract_uniq_id, inst_le_no,contract_serial, LEASE_ACCEPT_DATE, INACTIVE_DATE, LEASE_START_DATE,LEASE_EXP_DATE, last_mod_date from ebcc.asset_item where country_code = 'USA' and inst_le_no='690543517'
AND CONTRACT_SERIAL IN ('028295H', '040619H','091662H')

SELECT COUNTRY_CODE,eol_supp_no, lock_data, eol_date,PRICE_EXP_DATE,DEC_STATUS,DECISION_DEADLINE,DEC_STAT_CHG_DATE, last_mod_user, last_mod_date from ebcc.eol_item_info
where (country_code, contract_uniq_id) in (
select country_code, contract_uniq_id from ebcc.asset_item where country_code = 'USA' and inst_le_no='690543517'
AND CONTRACT_SERIAL IN ('028295H', '040619H','091662H'))

SELECT COUNTRY_CODE,eol_supp_no, lock_data, eol_date,PRICE_EXP_DATE,DEC_STATUS,DECISION_DEADLINE,DEC_STAT_CHG_DATE, last_mod_user, last_mod_date, trigger_insert_ts from ccaudit.eol_item_info
where (country_code, contract_uniq_id) in (
select country_code, contract_uniq_id from ebcc.asset_item where country_code = 'USA' and inst_le_no='690543517'
AND CONTRACT_SERIAL IN ('028295H', '040619H','091662H'))

SELECT COUNTRY_CODE,eol_supp_no, lock_data, eol_date,PRICE_EXP_DATE,DEC_STATUS,DECISION_DEADLINE,DEC_STAT_CHG_DATE, last_mod_user, last_mod_date, trigger_insert_ts from ccaudit.eol_item_info
where (country_code, contract_uniq_id) in (
select country_code, contract_uniq_id from ebcc.asset_item where country_code = 'CAN' and inst_le_no='AC41'
AND CONTRACT_SERIAL IN ('MJVZZR4', 'MJVZZT3','MJVZZV3'))


update ebcc.eol_item_info set LAST_MOD_DATE=current timestamp, LAST_MOD_USER='DEMODATA',
DEC_STAT_CHG_DATE = current timestamp, EOL_DATE=current timestamp, PRICE_EXP_DATE=current timestamp + 1 month,
DECISION_DEADLINE=current timestamp + 1 month,  DEC_CONC_DATE=current timestamp
where country_code in ('USA','CAN') and eol_supp_no in ('E0086025601', 'E0086075301', 'E0086079601',  'E0017863203', 'E0018170001', 'E0018170801' )


update ebcc.eol_supp_info set LAST_MOD_DATE=current timestamp, LAST_MOD_USER='DEMODATA',
DEC_STAT_CHG_DATE = current timestamp, EOL_DATE=current timestamp, PRICE_EXP_DATE=current timestamp + 1 month,
DECISION_DEADLINE=current timestamp + 1 month,  DEC_CONC_DATE=current timestamp
where country_code in ('USA','CAN') and eol_supp_no in ('E0086025601', 'E0086075301', 'E0086079601',  'E0017863203', 'E0018170001', 'E0018170801' )


update ebcc.asset_item set last_mod_date=current timestamp, src='CAD', lease_accept_date=current timestamp - 45 days, 
lease_start_date=current timestamp - 1 month, inactive_date=current timestamp + 1 month, 
lease_exp_date='2099-12-31',original_lease_start_date= current timestamp - 4 month, original_lease_end_date=current timestamp - 3 month
where (country_code, machine_type, contract_serial, mes) in
(select country_code, machine_type, contract_serial, mes from ebcc.eol_item_info
where country_code in ('USA','CAN') and eol_supp_no in ('E0086025601', 'E0086075301', 'E0086079601',  'E0017863203', 'E0018170001', 'E0018170801' )
)
