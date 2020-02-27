-- SRC='', last_mod_date=current timestamp
--CCEOL
update ebcc.eol_item_info set contract_serial = 'NEW_SERIAL', contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL'
update ebcc.eol_item_mes set contract_serial = 'NEW_SERIAL', contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL'
update ebcc.eol_decisions set contract_serial = 'NEW_SERIAL' where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL'

--EOLC
update eolc.eol_item_info set contract_serial = 'NEW_SERIAL', contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL'
update eolc.eol_item_mes set contract_serial = 'NEW_SERIAL', contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL'
update eolc.eol_decisions set contract_serial = 'NEW_SERIAL' where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL'

-- where country_code = '897' and contract_serial = 'OLD_SERIAL'
-- where country_code = '897' and contract_uniq_id = 'OLD_UNIQ'
-- contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL')
--LM
update ebcc.Asset_Item set contract_serial = 'NEW_SERIAL', manuf_serial_no = 'NEW_SERIAL', contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_serial = 'OLD_SERIAL'
update ebcc.Asset_Comments set contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id = 'OLD_UNIQ'

update ebcc.Asset_User_Data set SRC='IER',last_mod_date=current timestamp, contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id = (select distinct contract_uniq_id from ebcc.asset_item where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL')
update ebcc.A_Item_Cust_Input set SRC='IER',last_mod_date=current timestamp, contract_serial = 'NEW_SERIAL', contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id = (select distinct contract_uniq_id from ebcc.asset_item where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL')

update ebcc.Dmg_Invoice_Credit_Item set serial_number = 'NEW_SERIAL',mfg_serial_num='NEW_SERIAL' contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id = 'OLD_UNIQ'
update ebcc.Dmg_Invoice_Debit set serial_number = 'NEW_SERIAL',mfg_serial_num='NEW_SERIAL' contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id = 'OLD_UNIQ'
****************
update ebcc.Dmg_Invoice_Debit_Defect SET MFG_SERIAL_NUM='NEW_SERIAL' where country_code = '897' and MFG_SERIAL_NUM = 'OLD_SERIAL'
****************

update ebcc.Invoice_Item set SRC='IER',last_mod_date=current timestamp, contract_serial = 'NEW_SERIAL', manuf_ser_no = 'NEW_SERIAL', contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id in (select distinct contract_uniq_id from ebcc.asset_item where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL')
update ebcc.Machine_User set SRC='IER',last_mod_date=current timestamp, contract_serial = 'NEW_SERIAL', contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id in (select distinct contract_uniq_id from ebcc.asset_item where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL')
update ebcc.More_Cust_Input set SRC='IER',last_mod_date=current timestamp, contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id in (select distinct contract_uniq_id from ebcc.asset_item where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL')
update ebcc.Returns set SRC='IER',last_mod_date=current timestamp,  MATCH_SERIAL='NEW_SERIAL' contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id in (select distinct contract_uniq_id from ebcc.asset_item where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL')
update ebcc.User_Comments set SRC='IER',last_mod_date=current timestamp,  contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id in (select distinct contract_uniq_id from ebcc.asset_item where country_code = '897' and rtrim(machine_type)||'-'||rtrim(contract_serial) = 'OLD_TYPE_SERIAL')
update ebcc.Vendor_Asset_Item set contract_serial = 'NEW_SERIAL', contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id = 'OLD_UNIQ' 
update ebcc.Warranty set contract_uniq_id = replace(contract_uniq_id, 'OLD_SERIAL', 'NEW_SERIAL') where country_code = '897' and contract_uniq_id = 'OLD_UNIQ' 
