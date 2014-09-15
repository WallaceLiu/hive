set hive.exec.dynamic.partition.mode=nonstrict;
set hive.support.concurrency=true;
set hive.txn.manager=org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;
set hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
set hive.enforce.bucketing=true;
set hive.mapred.supports.subdirectories=true;

create table ivdp(i int,
                 de decimal(5,2),
                 vc varchar(128)) partitioned by (ds string) clustered by (i) into 2 buckets stored as orc;

insert into table ivdp partition (ds) values 
    (1, 109.23, 'and everywhere that mary went', 'today'),
    (6553, 923.19, 'the lamb was sure to go', 'tomorrow');

select * from ivdp order by ds;
