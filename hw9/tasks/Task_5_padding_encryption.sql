-- create encryption table
create table if not exists encryption(
    md5 varchar,
    sha1 varchar,
    sha256 varchar
);

--balance table
select rpad(md5, 64, '1'),
       lpad(sha1, 64, '0'),
       sha256
from encryption;

select length(md5) md5_length,
       length(sha1) sha1_length,
       length(sha256) sha256_lenght
from encryption;