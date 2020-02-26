select * from ebcc.service_status where job_type = 'updateTokenStatus'
insert into ebcc.service_status values('EBCC', 'vendorInvoiceFeed', 'ON', '649')

select * from ebcc.vendor_enrollment
insert into ebcc.vendor_enrollment values('649', 'DTCAN001', 'David Test COMPANY', 'JOB', current timestamp - 1 day, current timestamp - 1 day)
and job_type = 'transactions' and country_code = '649'

select * from ebcc.service_status where application = 'EOL' and job_type = 'decisions'
update ebcc.service_status set status = 'OFF' where application = 'EOLC' and job_type = 'sendProfile'
and job_type = 'decisions'

and job_type = 'transactions' and country_code = '649'

insert into ebcc.service_status 
values
('CR12DAILY', 'controlReports', 'ON', '649'),
('CR12HOURLY', 'controlReports', 'ON', '649'),

insert into ebcc.control_report_emails values
('649', 'cr7EOLC_n', 'castellm@us.ibm.com'),
('649', 'cr7EOLC_n', 'ongyiu@us.ibm.com'),
('649', 'cr7EOLC_e', 'castellm@us.ibm.com'),
('649', 'cr7EOLC_e', 'ongyiu@us.ibm.com'),

('CAN', 'cr7EOLC_n', 'castellm@us.ibm.com'),
('CAN', 'cr7EOLC_n', 'ongyiu@us.ibm.com'),
('CAN', 'cr7EOLC_e', 'castellm@us.ibm.com'),
('CAN', 'cr7EOLC_e', 'ongyiu@us.ibm.com'),
select * from ebcc.control_report_emails where country_code in ('897') and control_report in ('cr7EOLC_n', 'cr7EOLC_e')


select count(*) from ebcc.asset_item

select * from ebcc.