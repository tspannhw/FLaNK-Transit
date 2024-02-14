# FLaNK-Transit
More transit details



# Flink SQL Tables on Kafka

````

CREATE TABLE `ssb`.`Meetups`.`nytrafficspeed` (
  `id` VARCHAR(2147483647),
  `speed` VARCHAR(2147483647),
  `travel_time` VARCHAR(2147483647),
  `status` VARCHAR(2147483647),
  `data_as_of` VARCHAR(2147483647),
  `link_id` VARCHAR(2147483647),
  `link_points` VARCHAR(2147483647),
  `encoded_poly_line` VARCHAR(2147483647),
  `encoded_poly_line_lvls` VARCHAR(2147483647),
  `owner` VARCHAR(2147483647),
  `transcom_id` VARCHAR(2147483647),
  `borough` VARCHAR(2147483647),
  `link_name` VARCHAR(2147483647),
  `eventTimeStamp` TIMESTAMP(3) WITH LOCAL TIME ZONE METADATA FROM 'timestamp',
  WATERMARK FOR `eventTimeStamp` AS `eventTimeStamp` - INTERVAL '3' SECOND
) WITH (
  'scan.startup.mode' = 'group-offsets',
  'deserialization.failure.policy' = 'ignore_and_log',
  'properties.request.timeout.ms' = '120000',
  'properties.auto.offset.reset' = 'earliest',
  'format' = 'json',
  'properties.bootstrap.servers' = 'kafka:9092',
  'connector' = 'kafka',
  'properties.transaction.timeout.ms' = '900000',
  'topic' = 'nytrafficspeed',
  'properties.group.id' = 'nytrafficflink1'
)



````
