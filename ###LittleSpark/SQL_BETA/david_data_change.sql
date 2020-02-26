INSERT INTO EBCC.COUNTRY_PARMS 
values
('649', 'DCD', 'TRUE', 'def'),
('649', 'DCD_AMT_FINANCED_EDIT', 'YES_REASON', 'def'),
('649', 'DCD_ARCHIVE_DELETE_MONTH', '180', 'def'),
('649', 'DCD_ARCHIVE_EXPIRED_DAY', '90', 'def'),
('649', 'DCD_ARCHIVE_MONTH', '36', 'def'),
('649', 'DCD_ARCHIVE_REJECTED_DAY', '90', 'def'),
('649', 'DCD_CUSTOMER_REF_EDIT', 'YES', 'def'),
('649', 'DCD_DEACTIVATE_ARCHIVE_DAY', '90', 'def'),
('649', 'DCD_MFR_SER_NUM_EDIT', 'YES_REASON', 'def'),
('649', 'DCD_TERM_EDIT', 'YES', 'def')

insert into ebcc.service_status 
values
('CR12DAILY', 'controlReports', 'ON', '649'),
('CR12HOURLY', 'controlReports', 'ON', '649')

--if the text reference is loaded from host, this is not needed.
insert into ebcc.text_reference values
('649', '', 'DCD_REASON', 'CO', 'Cancelled order', 'CC', current timestamp),
('649', '', 'DCD_REASON', 'IP', 'Incorrect product', 'CC', current timestamp),
('649', '', 'DCD_REASON', 'OT', 'Other (Comment)', 'CC', current timestamp),
('649', '', 'DCD_REASON', 'SS', 'Short shipment (No replacement)', 'CC', current timestamp),
('649', '', 'DCD_REASON', 'DG', 'Damaged goods (No replacement)', 'CC', current timestamp),
('649', '', 'DCD_REASON', 'IQ', 'Incorrect quantity', 'CC', current timestamp),
('649', '', 'DCD_REASON', 'IA', 'Incorrect invoice amount', 'CC', current timestamp),
('649', '', 'DCD_REASON', 'AI', 'Additional invoices needed', 'CC', current timestamp),

('649', '', 'DCD_STATUS', 'EXPR', 'Expired', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'NEW', 'New', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'PNDS', 'Pending/signed', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'PNDR', 'Pending/rejected', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'SREV', 'Sent for review', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'SSGN', 'Sent for signature', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'COMP', 'Completed', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'REJT', 'Rejected', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'CMPV', 'Completed - view only', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'VNEW', 'New - view only', 'CC', current timestamp),
('649', '', 'DCD_STATUS', 'DEAC', 'Deactivated', 'CC', current timestamp)

insert into ebcc.service_status values('EBCC', 'vendorInvoiceFeed', 'ON', '649')

insert into ebcc.control_report_emails values
('897', 'cr12Hourly','tripodi@us.ibm.com'),
('649', 'cr12Hourly','tripodi@us.ibm.com'),
('897', 'cr12Hourly','whweiwei@cn.ibm.com'),
('649', 'cr12Hourly','whweiwei@cn.ibm.com')

insert into ebcc.control_report_emails values
('649', 'cr7EOLC_n', 'castellm@us.ibm.com'),
('649', 'cr7EOLC_n', 'ongyiu@us.ibm.com'),
('649', 'cr7EOLC_e', 'castellm@us.ibm.com'),
('649', 'cr7EOLC_e', 'ongyiu@us.ibm.com'),

('CAN', 'cr7EOLC_n', 'castellm@us.ibm.com'),
('CAN', 'cr7EOLC_n', 'ongyiu@us.ibm.com'),
('CAN', 'cr7EOLC_e', 'castellm@us.ibm.com'),
('CAN', 'cr7EOLC_e', 'ongyiu@us.ibm.com')



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
