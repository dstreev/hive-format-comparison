SELECT
    --job_id AS "Job Id"                                                 ,
    "name" AS "name"                                                   ,
    --"type" AS "Type"                                                   ,
    --"user" AS "User"                                                   ,
    --launch_time                                                        ,
--finish_time                                                        ,
    CAST((CAST(finish_time as BIGINT) - CAST(launch_time as BIGINT)) AS DOUBLE) / 1000 AS "Query Time(secs)",
    hdfs_read_ops                                                      ,
    round(hdfs_data_read_gb * 1000,3) as "hdfs_data_read_mb"                                                 ,
    cpu_millis                                                         ,
    memory_requested_gb                                                ,
    --memory_requested_gb_millis                                         ,
    round(memory_unused_gb,2) as memory_unused_gb                                                   ,
    --memory_unused_gb_millis                                            ,
    round(network_transfer_gb * 1000, 5) as "network_transfer_mb"
FROM
    activity.job
    Where
    INSTR("name", '${TEST_RUN}') != 0 
    --and INSTR("name",'join') != 0
    --and INSTR("name",'count') != 0
ORDER BY
    "name"