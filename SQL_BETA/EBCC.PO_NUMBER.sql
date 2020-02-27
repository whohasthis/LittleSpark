insert into ebcc.country_parms values
('DEF', 'EOL_PO_NUMBER_ENABLED', 'FALSE', 'def'),
('897', 'EOL_PO_NUMBER_ENABLED', 'TRUE', 'def'),
('USA', 'EOL_PO_NUMBER_ENABLED', 'TRUE', 'def'),
('649', 'EOL_PO_NUMBER_ENABLED', 'TRUE', 'def'),
('CAN', 'EOL_PO_NUMBER_ENABLED', 'TRUE', 'def'),
('724', 'EOL_PO_NUMBER_ENABLED', 'FALSE', 'def'),
('GER', 'EOL_PO_NUMBER_ENABLED', 'FALSE', 'def')


insert into eolc.country_parms values
('DEF', 'EOL_PO_NUMBER_ENABLED', 'FALSE', 'def'),
('897', 'EOL_PO_NUMBER_ENABLED', 'TRUE', 'def'),
('USA', 'EOL_PO_NUMBER_ENABLED', 'TRUE', 'def'),
('649', 'EOL_PO_NUMBER_ENABLED', 'TRUE', 'def'),
('CAN', 'EOL_PO_NUMBER_ENABLED', 'TRUE', 'def'),
('724', 'EOL_PO_NUMBER_ENABLED', 'FALSE', 'def'),
('GER', 'EOL_PO_NUMBER_ENABLED', 'FALSE', 'def')

insert into ebcc.rpt_wiz_field_def 
values('ewPoNum', 'STR', 'eol_work', 'po_number', null, null, null),
('ewiPoNum', 'STR', 'eol_item_info', 'po_number', null, null, null),
('ewsPoNum', 'STR', 'eol_supp_info', 'po_number', null, null, null),
--download report
('eoliPoNum', 'STR', 'eol_item_info', 'po_number', null, null, null),
('eolsPoNum', 'STR', 'eol_supp_info', 'po_number', null, null, null),

insert into ebcc.rpt_wiz_virtual
values
--item level
('ewiObjData', 'ewPoNum', 34),
('ewiObjData', 'ewiPoNum', 35),
('eolMesObjData', 'ewPoNum', 34),
('eolMesObjData', 'ewiPoNum', 35),
--supplement level
('ewsObjData', 'ewPoNum', 24),
('ewsObjData', 'ewsPoNum', 25),
--supplement decision at asset level
('ewsiObjData', 'ewPoNum', 24),
('ewsiObjData', 'ewsPoNum', 25),

insert into ebcc.rpt_wiz_fields values('dlEolItem', 'secEolInf', 'eoliPoNum', 19, 1, 2)

insert into ebcc.rpt_wiz_fields values('dlEolSupplement', 'secEolInf', 'eolsPoNum', 200, 1, 2)

select * from ebcc.rpt_wiz_field_def where field_name = 'eoliPoNum'
