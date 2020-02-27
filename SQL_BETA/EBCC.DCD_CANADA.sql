SELECT * FROM ebcc.country_parms WHERE country_code = '649' and
--country_code in ('897' ,'724' ,'758' ,'866' ,'838' ,'846' ,'788' ,'706' ,'766' ,'CAN' ,'856' ,'818' ,'672' ,'778' ,'834' ,'796' ) and      
field_name like  '%DCD%' and field_name not in ('DCD_LOCATION_EDIT','DCD_PO_NUM_EDIT', 'DCD_COST_CENTER_EDIT')

INSERT INTO EBCC.COUNTRY_PARMS 
select '649', field_name, field_value, QUALIFIER FROM ebcc.country_parms WHERE country_code = '897' and
field_name like  '%DCD%' and field_name not in ('DCD_LOCATION_EDIT','DCD_PO_NUM_EDIT', 'DCD_COST_CENTER_EDIT', 'DCD')

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

---------
insert into ebcc.vendor_enrollment values('649', '205247372', 'ROYAL BANK CANADA', 'JOB', current timestamp - 1 day, current timestamp - 1 day)
insert into ebcc.vendor_enrollment values('649', '078705161', 'ADT SERVICES', 'JOB', current timestamp - 1 day, current timestamp - 1 day)
insert into EBCC.VENDOR_ENROLLMENT (COUNTRY_CODE, ENTERPRISE_NUM, ENTERPRISE_NAME, SRC, LAST_MOD_DATE, LAST_VENDOR_INV_LOAD_DATE)
values('649','690566815','HONDA','JOB', current timestamp - 1 day, '2018-04-01 00:00:00' )
select * from ebcc.vendor_enrollment where country_code = '649'


insert into ebcc.text_reference 
select 'CAN', LOCALE, FIELD_NAME,FIELD_VALUE,FIELD_TEXT,SRC,LAST_MOD_DATE from ebcc.text_reference where country_code in ('649') and field_name in( 'DCD_STATUS', 'DCD_REASON')

