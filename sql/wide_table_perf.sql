use orc_avro_test;

set hive.query.name="${TEST_RUN} (STRING) :: csv count - 2 fields";

select
  count(ip_addr)
FROM
  wide_table_base
WHERE
  substr(string76, 3, 1) = "A";

set hive.query.name="${TEST_RUN} (STRING) :: orc count - 2 fields";

select
  count(ip_addr)
FROM
  wide_table_orc
WHERE
  substr(string76, 3, 1) = "A";

set hive.query.name="${TEST_RUN} (STRING) :: avro count - 2 fields";

select
  count(ip_addr)
FROM
  wide_table_avro
WHERE
  substr(string76, 3, 1) = "A";
  
set hive.query.name="${TEST_RUN} (STRING) :: orc join";

select
    opt.ip_addr, opt.string2, opt.string8, opt.string30, opt.string34
from
    wide_table_orc opt inner join
    wide_table_search srch on opt.string8 = srch.string8;

set hive.query.name="${TEST_RUN} (STRING) :: orc optimized join";

select
    opt.ip_addr, opt.string2, opt.string8, opt.string30, opt.string34
from
    wide_table_orc_8_optimized opt inner join
    wide_table_search srch on opt.string8 = srch.string8;

set hive.query.name="${TEST_RUN} (STRING) :: avro join";
    
select
    opt.ip_addr, opt.string2, opt.string8, opt.string30, opt.string34
from
    wide_table_avro opt inner join
    wide_table_search srch on opt.string8 = srch.string8;   

set hive.query.name="${TEST_RUN} (STRING) :: txt join";
    
select
    opt.ip_addr, opt.string2, opt.string8, opt.string30, opt.string34
from
    wide_table_base opt inner join
    wide_table_search srch on opt.string8 = srch.string8;     
    
