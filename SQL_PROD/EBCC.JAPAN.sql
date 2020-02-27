select * from ebcc.service_status where country_code = '760' and application  = 'EOL'

insert into ebcc.service_status 
values
('EOL', 'dataload', 'ON', '760'),
('EOL', 'decisions', 'ON', '760'),
('EOL', 'transactions', 'ON', '760')