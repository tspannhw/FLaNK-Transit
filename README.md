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


CREATE TABLE `ssb`.`Meetups`.`jsontranscom` (
  `title` VARCHAR(2147483647),
  `description` VARCHAR(2147483647),
  `pubDate` VARCHAR(2147483647),
  `point` VARCHAR(2147483647),
  `latitude` VARCHAR(2147483647),
  `ts` VARCHAR(2147483647),
  `longitude` VARCHAR(2147483647),
  `uuid` VARCHAR(2147483647),
  `eventTimeStamp` TIMESTAMP(3) WITH LOCAL TIME ZONE METADATA FROM 'timestamp',
  WATERMARK FOR `eventTimeStamp` AS `eventTimeStamp` - INTERVAL '3' SECOND
) WITH (
  'scan.startup.mode' = 'earliest-offset',
  'deserialization.failure.policy' = 'ignore_and_log',
  'properties.request.timeout.ms' = '120000',
  'properties.auto.offset.reset' = 'earliest',
  'format' = 'json',
  'properties.bootstrap.servers' = 'kafka:9092',
  'connector' = 'kafka',
  'properties.transaction.timeout.ms' = '900000',
  'topic' = 'transcom'
)

CREATE TABLE `ssb`.`Meetups`.`jsonmta` (
  `StopPointRef` VARCHAR(2147483647),
  `VehicleRef` VARCHAR(2147483647),
  `ProgressRate` VARCHAR(2147483647),
  `ExpectedDepartureTime` VARCHAR(2147483647),
  `StopPoint` VARCHAR(2147483647),
  `VisitNumber` VARCHAR(2147483647),
  `DataFrameRef` VARCHAR(2147483647),
  `StopPointName` VARCHAR(2147483647),
  `SituationSimpleRef5` VARCHAR(2147483647),
  `SituationSimpleRef3` VARCHAR(2147483647),
  `Bearing` VARCHAR(2147483647),
  `SituationSimpleRef4` VARCHAR(2147483647),
  `SituationSimpleRef1` VARCHAR(2147483647),
  `OriginAimedDepartureTime` VARCHAR(2147483647),
  `SituationSimpleRef2` VARCHAR(2147483647),
  `JourneyPatternRef` VARCHAR(2147483647),
  `RecordedAtTime` VARCHAR(2147483647),
  `OperatorRef` VARCHAR(2147483647),
  `DestinationName` VARCHAR(2147483647),
  `ExpectedArrivalTime` VARCHAR(2147483647),
  `BlockRef` VARCHAR(2147483647),
  `LineRef` VARCHAR(2147483647),
  `VehicleLocationLongitude` VARCHAR(2147483647),
  `DirectionRef` VARCHAR(2147483647),
  `ArrivalProximityText` VARCHAR(2147483647),
  `DistanceFromStop` VARCHAR(2147483647),
  `EstimatedPassengerCapacity` VARCHAR(2147483647),
  `AimedArrivalTime` VARCHAR(2147483647),
  `PublishedLineName` VARCHAR(2147483647),
  `DatedVehicleJourneyRef` VARCHAR(2147483647),
  `Date` VARCHAR(2147483647),
  `Monitored` VARCHAR(2147483647),
  `ProgressStatus` VARCHAR(2147483647),
  `DestinationRef` VARCHAR(2147483647),
  `EstimatedPassengerCount` VARCHAR(2147483647),
  `VehicleLocationLatitude` VARCHAR(2147483647),
  `OriginRef` VARCHAR(2147483647),
  `NumberOfStopsAway` VARCHAR(2147483647),
  `ts` VARCHAR(2147483647),
  `uuid` VARCHAR(2147483647),
  `eventTimeStamp` TIMESTAMP(3) WITH LOCAL TIME ZONE METADATA FROM 'timestamp',
  WATERMARK FOR `eventTimeStamp` AS `eventTimeStamp` - INTERVAL '3' SECOND
) WITH (
  'deserialization.failure.policy' = 'ignore_and_log',
  'properties.request.timeout.ms' = '120000',
  'format' = 'json',
  'properties.bootstrap.servers' = 'kafka:9092',
  'connector' = 'kafka',
  'properties.transaction.timeout.ms' = '900000',
  'topic' = 'mta',
  'scan.startup.mode' = 'earliest-offset',
  'properties.auto.offset.reset' = 'earliest'
)

CREATE TABLE `ssb`.`Meetups`.`weather1` (
  `uuid` VARCHAR(2147483647),
  `ts` BIGINT,
  `credit` VARCHAR(2147483647),
  `credit_URL` VARCHAR(2147483647),
  `image` ROW<`url` VARCHAR(2147483647), `title` VARCHAR(2147483647), `link` VARCHAR(2147483647)>,
  `suggested_pickup` VARCHAR(2147483647),
  `suggested_pickup_period` BIGINT,
  `location` VARCHAR(2147483647),
  `station_id` VARCHAR(2147483647),
  `latitude` DOUBLE,
  `longitude` DOUBLE,
  `observation_time` VARCHAR(2147483647),
  `observation_time_rfc822` VARCHAR(2147483647),
  `weather` VARCHAR(2147483647),
  `temperature_string` VARCHAR(2147483647),
  `temp_f` DOUBLE,
  `temp_c` DOUBLE,
  `relative_humidity` BIGINT,
  `wind_string` VARCHAR(2147483647),
  `wind_dir` VARCHAR(2147483647),
  `wind_degrees` BIGINT,
  `wind_mph` DOUBLE,
  `wind_kt` BIGINT,
  `pressure_in` DOUBLE,
  `dewpoint_string` VARCHAR(2147483647),
  `dewpoint_f` DOUBLE,
  `dewpoint_c` DOUBLE,
  `visibility_mi` DOUBLE,
  `icon_url_base` VARCHAR(2147483647),
  `two_day_history_url` VARCHAR(2147483647),
  `icon_url_name` VARCHAR(2147483647),
  `ob_url` VARCHAR(2147483647),
  `disclaimer_url` VARCHAR(2147483647),
  `copyright_url` VARCHAR(2147483647),
  `privacy_policy_url` VARCHAR(2147483647),
  `eventTimestamp` TIMESTAMP(3) WITH LOCAL TIME ZONE METADATA FROM 'timestamp',
  WATERMARK FOR `eventTimestamp` AS `eventTimestamp` - INTERVAL '3' SECOND
) WITH (
  'deserialization.failure.policy' = 'ignore_and_log',
  'properties.request.timeout.ms' = '120000',
  'format' = 'json',
  'properties.bootstrap.servers' = 'kafka:9092',
  'connector' = 'kafka',
  'properties.transaction.timeout.ms' = '900000',
  'topic' = 'weather',
  'scan.startup.mode' = 'group-offsets',
  'properties.auto.offset.reset' = 'earliest',
  'properties.group.id' = 'ssbweather001'
)

````
