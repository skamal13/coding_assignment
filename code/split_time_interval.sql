DECLARE start_time TIMESTAMP;
DECLARE end_time TIMESTAMP;
SET start_time='2020-03-02 13:02:00';
SET end_time='2020-03-02 15:55:07';

WITH data_table AS
   (SELECT
       time_data, i
   FROM UNNEST((
       SELECT array_concat([TIMESTAMP(start_time)],
       GENERATE_TIMESTAMP_ARRAY(TIMESTAMP_ADD(timestamp_trunc(start_time,hour), INTERVAL 30 MINUTE), end_time,INTERVAL 30 MINUTE),
       [TIMESTAMP(end_time)]) )) as time_data with offset as i )

select
   array(select time_data from data_table where i<=5) as time_a,
   array(select time_data from data_table where  i>0) as time_b
