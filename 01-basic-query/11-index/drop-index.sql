select *
from USER_INDEXES
where lower(TABLE_NAME) in ('test_indexs', 'test_bitmap_index_table', 'employees');


drop index IDX_BITMAP_JOIN_JK;

drop index IDX_EMP_TOTAL_SAL;
