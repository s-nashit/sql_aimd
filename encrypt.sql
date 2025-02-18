-- encryption
use a;
create table new_s(
id int,
usern text, 
passw text,
enc_p varbinary(255));
insert into new_s values (1, 'nashit','1234', aes_encrypt('1234', 'key'));
select * from new_s;

select id, usern, passw, cast(aes_decrypt(enc_p, 'key') as char) from new_s;
select id, usern, passw, cast(aes_decrypt(enc_p, 'gkey') as char) from new_s;

