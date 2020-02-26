 select * from db2ent.suser_profile where unique_id in
(
)


--11/17 pending delete
select rtrim(unique_id) as unique_id, rtrim(user_id) as user_id, rtrim(first_name) as first_name,rtrim(last_name) as last_name, rtrim(E_MAIL_ADDRESS) as email from db2ent.suser_profile where unique_id in
(
'270006SHVN','1200009VUB','110000F300','3100019N7N'
)
delete from db2ent.user_scope where unique_id in (ttt)

delete from db2ent.user_scope_exclude where unique_id in(ttt)

delete from db2ent.user_scope_hist where unique_id in(ttt)

delete from db2ent.user_entitle_hist where unique_id in(ttt)

delete from db2ent.user_entitlement where unique_id in(ttt)

delete from db2ent.user_profile2 where unique_id in(ttt)

delete from db2ent.user_profile where unique_id in(ttt)

