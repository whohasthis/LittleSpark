--sections
select * from ebcc.rpt_wiz_sections where report_name = 'dlEolcItem'

--fields in a report section
select * from ebcc.rpt_wiz_fields where report_name = 'dlFiStep'
--and section_name = 'secEolInf' 
order by field_order
--field definition
select * from ebcc.rpt_wiz_field_def where field_name in (select field_name from ebcc.rpt_wiz_virtual where virtual_field = 'eolMesObjData')
order by field_name
--virtual field
select * from ebcc.rpt_wiz_virtual where virtual_field = 'fiBillingSchedule' order by field_order

select * from ebcc.rpt_wiz_virtual order by virtual_field, field_order

select * from ebcc.rpt_wiz_virtual where virtual_field = 'eolMesObjData' order by virtual_field,field_order




select * from ebcc.rpt_wiz_virtual where field_name = 'ecwiPoNum'

select * from ebcc.rpt_wiz_virtual where field_name = 'ecwsPoNum'

select * from ebcc.rpt_wiz_field_def where field_name = 'eoliDecConcludeDate'

select * from ebcc.rpt_wiz_fields where field_name ='eolcsPoNum'

select * from ebcc.rpt_wiz_fields where report_name = 'dlEolItem'

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
