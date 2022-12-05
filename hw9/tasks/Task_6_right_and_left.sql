-- create repositories table
create table if not exists repositories(
    project varchar,
    commits int,
    contributors int,
    address varchar
);

--verify table
select * from repositories;

insert into repositories(project, commits, contributors, address)
VALUES ('Helium', 3, 4, '0x1e15751Ee575594D3332679bCE8cA399268B8505');

select substr(project, commits) project, substr(address, length(address) - contributors, contributors) address
from repositories;
