select * from repositories;

select regexp_replace(address, '[[:digit:]]', '!', 'g')
from repositories;