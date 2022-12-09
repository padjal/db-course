# HW 11


## Tasks
This section contains additional information about the different tasks. The sql queries can be found [here](./scripts/tasks.sql).

1. ✅ Connect to Oracle instance database under <username> (for example, in sqlplus). 
2. ✅ Execute script students/lesson5/0_create_base.sql to create base table and populate it.
3. ✅ Gather statistics for t_books table.
4. ✅ Create Oracle Text index  (t_books_title_idx) on title column of t_books table.
In the context of Postgres there are no Text indexes. The equivalent are the GIN and GIST indexes. I will create a GIN index in this case.
5. Select from t_books data about books where title contains substring 'expert' (case-insensitive) and get expected execution plan for this query. Please, explain the result.
```shell
Seq Scan on t_books  (cost=0.00..432.51 rows=1 width=100) (actual time=15.646..15.648 rows=1 loops=1)
  Filter: ((title)::text ~~* '%expert%'::text)
  Rows Removed by Filter: 15000
Planning Time: 0.368 ms
Execution Time: 15.662 ms
```

We can see that although we included an index, it has not been used in this example.
6. Drop t_books_title_idx index.
7. Create table t_lookup with columns:
    a. item_key (VARCHAR2(10), NOT NULL);
    b. item_value (VARCHAR2(100)).
8. To t_lookup table add primary key constraint t_lookup_pk on item_key.
This can be done while initializing the table.
9. Populate t_lookup table with data and commit changes:
```sql
INSERT INTO t_lookup SELECT ROWNUM, o.object_name, o.object_type FROM all_objects o WHERE ROWNUM <= 150000;
```

I will instead use a [seeder script](./scripts/t_lookup_seeder.sql).
10. Create the same Index-Organized Table with name t_lookup_iot and with primary key on item_key.
11. Populate t_lookup_iot table with data and commit changes as in step 9.
12. Gather statistics on two new tables.
- Stats about `t_lookup`:
```shell
analyzing "public.t_lookup"
"t_lookup": scanned 149 of 149 pages, containing 15000 live rows and 22 dead rows; 15000 rows in sample, 15000 estimated total rows
[2022-12-09 23:14:25] completed in 117 ms
```

- Stats about `t_lookup_iot`:
```shell
analyzing "public.t_lookup_iot"
"t_lookup_iot": scanned 149 of 149 pages, containing 15000 live rows and 0 dead rows; 15000 rows in sample, 15000 estimated total rows
[2022-12-09 23:14:37] completed in 65 ms
```
13. Select from t_lookup data about items where item_key = 455 and get expected execution plan for this query. Please, explain the result.
```shell
Index Scan using t_lookup_pkey on t_lookup  (cost=0.29..8.30 rows=1 width=48) (actual time=0.036..0.041 rows=1 loops=1)
  Index Cond: ((item_key)::text = '455'::text)
Planning Time: 0.109 ms
Execution Time: 0.128 ms
```

Since the `item_key` is a primary key, it is being used as an index to find the given value.
14. Select from t_lookup_iot data about items where item_key = 455 and get expected execution plan for this query. Please, explain the result.
```shell
Index Scan using t_lookup_iot_pkey on t_lookup_iot  (cost=0.29..8.30 rows=1 width=48) (actual time=0.534..0.536 rows=0 loops=1)
  Index Cond: ((item_key)::text = '455'::text)
Planning Time: 1.267 ms
Execution Time: 0.574 ms
```

Similar results for this table.
15. Create index for t_lookup table on item_value column.
16. Create index for t_lookup_iot table on item_value column.
17. Select from t_lookup data about items where item_value = 'T_BOOKS' and get expected execution plan for this query. Please, explain the result.
```shell
Index Scan using t_lookup_value_idx on t_lookup  (cost=0.41..8.43 rows=1 width=48) (actual time=0.016..0.018 rows=1 loops=1)
  Index Cond: ((item_value)::text = 'T_BOOKS'::text)
Planning Time: 0.443 ms
Execution Time: 0.035 ms
```

Since we are using the index we created in the previous tasks on the value column, we get a fast execution.
18. Select from t_lookup_iot data about items where item_value = 'T_BOOKS' and get expected execution plan for this query. Please, explain the result.

```shell
Index Scan using t_lookup_iot_value_idx on t_lookup_iot  (cost=0.41..8.43 rows=1 width=48) (actual time=0.783..0.784 rows=0 loops=1)
  Index Cond: ((item_value)::text = 'T_BOOKS'::text)
Planning Time: 1.391 ms
Execution Time: 0.810 ms
```

Similar results observed.
19. Create your own example of Index Clustered Tables.
20. Create your own example of Hash Clustered Tables.