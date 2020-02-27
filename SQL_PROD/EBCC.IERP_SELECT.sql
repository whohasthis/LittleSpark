select contract_serial from ebcc.eol_item_info where country_code = '897' and contract_serial in()

select * from ebcc.asset_item where country_code='897' and rtrim(inven_unit_num)||'-'||rtrim(machine_type)||'-'||rtrim(contract_serial) = '549506695-2078-9A288'