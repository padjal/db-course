select category_name
from categories
where category_name in (
    select parent_category
    from categories
    where parent_category is not null
    )