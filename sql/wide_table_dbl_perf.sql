use orc_avro_test;

set hive.query.name="${TEST_RUN} (DOUBLE) :: csv count - 2 fields";

select
  count(ip_addr)
FROM
  wide_table_dbl_base
WHERE
  double76 > 70 and double76 < 80;

set hive.query.name="${TEST_RUN} (DOUBLE) :: orc count - 2 fields";

select
  count(ip_addr)
FROM
  wide_table_dbl_orc
WHERE
  double76 > 70 and double76 < 80;

set hive.query.name="${TEST_RUN} (DOUBLE) :: avro count - 2 fields";

select
  count(ip_addr)
FROM
  wide_table_dbl_avro
WHERE
  double76 > 70 and double76 < 80;
  
set hive.query.name="${TEST_RUN} (DOUBLE) :: orc join";

select
    opt.ip_addr, opt.string2, opt.string8, opt.double30, opt.double34
from
    wide_table_dbl_orc opt inner join
    wide_table_dbl_search srch on opt.string8 = srch.string8;

set hive.query.name="${TEST_RUN} (DOUBLE) :: orc optimized join";

select
    opt.ip_addr, opt.string2, opt.string8, opt.double30, opt.double34
from
    wide_table_dbl_orc_8_optimized opt inner join
    wide_table_dbl_search srch on opt.string8 = srch.string8;

set hive.query.name="${TEST_RUN} (DOUBLE) :: avro join";
    
select
    opt.ip_addr, opt.string2, opt.string8, opt.double30, opt.double34
from
    wide_table_dbl_avro opt inner join
    wide_table_dbl_search srch on opt.string8 = srch.string8;   

set hive.query.name="${TEST_RUN} (DOUBLE) :: txt join";
    
select
    opt.ip_addr, opt.string2, opt.string8, opt.double30, opt.double34
from
    wide_table_dbl_base opt inner join
    wide_table_dbl_search srch on opt.string8 = srch.string8;     