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
  `latitude` VARCHAR(2147483647),
  `ts` VARCHAR(2147483647),
  `longitude` VARCHAR(2147483647),
  `uuid` VARCHAR(2147483647),
  `parselatlong` VARCHAR(2147483647),
  `eventTimeStamp` TIMESTAMP(3) WITH LOCAL TIME ZONE METADATA FROM 'timestamp',
  WATERMARK FOR `eventTimeStamp` AS `eventTimeStamp` - INTERVAL '3' SECOND
) WITH (
  'deserialization.failure.policy' = 'ignore_and_log',
  'properties.request.timeout.ms' = '120000',
  'format' = 'json',
  'properties.bootstrap.servers' = 'kafka:9092',
  'connector' = 'kafka',
  'properties.transaction.timeout.ms' = '900000',
  'topic' = 'nytrafficspeed',
  'scan.startup.mode' = 'group-offsets',
  'properties.auto.offset.reset' = 'earliest',
  'properties.group.id' = 'nytrafficspeedreader1'
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


### Flink SQL

````



select n.speed, n.travel_time, n.borough, n.link_name, n.link_points,
       n.latitude, n.longitude
from nytrafficspeed n

select t.title, t.descrtiption, t.pubDate, t.latitude, t.longitude
from jsontranscom t


select m.VehicleLocationLatitude, m.VehicleLocationLongitude, 
       m.StopPointRef, m.VehicleRef,
       m.ProgressRate, m.ExpectedDepartureTime, m.StopPoint,
       m.VisitNumber, m.DataFrameRef, m.StopPointName,
       m.Bearing, m.OriginAimedDepartureTime, m.OperatorRef,
       m.DestinationName, m.ExpectedArrivalTime, m.BlockRef,
       m.LineRef, m.DirectionRef, m.ArrivalProximityText,
       m.DistanceFromStop, m.EstimatedPassengerCapacity, 
       m.AimedArrivalTime, m.PublishedLineName, m.Date,
       m.ProgressStatus, m.DestinationRef, m.EstimatedPassengerCount,
       m.OriginRef, m.NumberOfStopsAway, m.ts
from jsonmta m


````


#FLINK JOIN SQL

````

SELECT n.speed, n.travel_time, n.borough, n.link_name, n.link_points,
       n.latitude, n.longitude, DISTANCE_BETWEEN(CAST(t.latitude as STRING), 
                 CAST(t.latitude as STRING), 
                 m.VehicleLocationLatitude, m.VehicleLocationLongitude) as miles, 
       t.title, t.`description`, t.pubDate, t.latitude, t.longitude,
       m.VehicleLocationLatitude, m.VehicleLocationLongitude, 
       m.StopPointRef, m.VehicleRef,
       m.ProgressRate, m.ExpectedDepartureTime, m.StopPoint,
       m.VisitNumber, m.DataFrameRef, m.StopPointName,
       m.Bearing, m.OriginAimedDepartureTime, m.OperatorRef,
       m.DestinationName, m.ExpectedArrivalTime, m.BlockRef,
       m.LineRef, m.DirectionRef, m.ArrivalProximityText,
       m.DistanceFromStop, m.EstimatedPassengerCapacity, 
       m.AimedArrivalTime, m.PublishedLineName, 
       m.ProgressStatus, m.DestinationRef, m.EstimatedPassengerCount,
       m.OriginRef, m.NumberOfStopsAway, m.ts
FROM  jsonmta /*+ OPTIONS('scan.startup.mode' = 'earliest-offset') */  m
      FULL OUTER JOIN jsontranscom /*+ OPTIONS('scan.startup.mode' = 'earliest-offset') */  t
       ON (t.latitude >= CAST(m.VehicleLocationLatitude as float) - 0.3) 
       AND (t.longitude >= CAST(m.VehicleLocationLongitude as float) - 0.3) 
       AND (t.latitude <= CAST(m.VehicleLocationLatitude as float) + 0.3) 
       AND (t.longitude <= CAST(m.VehicleLocationLongitude as float) + 0.3)   
     FULL OUTER JOIN nytrafficspeed /*+ OPTIONS('scan.startup.mode' = 'earliest-offset') */  n
     ON (n.latitude >= CAST(m.VehicleLocationLatitude as float) - 0.3) 
     AND (n.longitude >= CAST(m.VehicleLocationLongitude as float) - 0.3) 
     AND (n.latitude <= CAST(m.VehicleLocationLatitude as float) + 0.3) 
     AND (n.longitude <= CAST(m.VehicleLocationLongitude as float) + 0.3) 
WHERE m.VehicleRef is not null  
AND   t.title is not null


````


## Flink SQL Materialized View

````
SELECT n.speed, n.travel_time, n.borough, n.link_name, n.link_points,
       n.latitude, n.longitude, DISTANCE_BETWEEN(CAST(t.latitude as STRING), 
                 CAST(t.latitude as STRING), 
                 m.VehicleLocationLatitude, m.VehicleLocationLongitude) as miles, 
       t.title, t.`description`, t.pubDate, t.latitude, t.longitude,
       m.VehicleLocationLatitude, m.VehicleLocationLongitude, 
       m.StopPointRef, m.VehicleRef,
       m.ProgressRate, m.ExpectedDepartureTime, m.StopPoint,
       m.VisitNumber, m.DataFrameRef, m.StopPointName,
       m.Bearing, m.OriginAimedDepartureTime, m.OperatorRef,
       m.DestinationName, m.ExpectedArrivalTime, m.BlockRef,
       m.LineRef, m.DirectionRef, m.ArrivalProximityText,
       m.DistanceFromStop, m.EstimatedPassengerCapacity, 
       m.AimedArrivalTime, m.PublishedLineName, 
       m.ProgressStatus, m.DestinationRef, m.EstimatedPassengerCount,
       m.OriginRef, m.NumberOfStopsAway, m.ts, n.eventTimeStamp, (m.uuid || t.uuid || n.uuid) as allid 
FROM  jsonmta /*+ OPTIONS('scan.startup.mode' = 'earliest-offset') */  m
      FULL OUTER JOIN jsontranscom /*+ OPTIONS('scan.startup.mode' = 'earliest-offset') */  t
       ON (t.latitude >= CAST(m.VehicleLocationLatitude as float) - 0.3) 
       AND (t.longitude >= CAST(m.VehicleLocationLongitude as float) - 0.3) 
       AND (t.latitude <= CAST(m.VehicleLocationLatitude as float) + 0.3) 
       AND (t.longitude <= CAST(m.VehicleLocationLongitude as float) + 0.3)   
     FULL OUTER JOIN nytrafficspeed /*+ OPTIONS('scan.startup.mode' = 'earliest-offset') */  n
     ON (n.latitude >= CAST(m.VehicleLocationLatitude as float) - 0.3) 
     AND (n.longitude >= CAST(m.VehicleLocationLongitude as float) - 0.3) 
     AND (n.latitude <= CAST(m.VehicleLocationLatitude as float) + 0.3) 
     AND (n.longitude <= CAST(m.VehicleLocationLongitude as float) + 0.3) 
WHERE m.VehicleRef is not null  
AND   t.title is not null

````


# Example Record

````
{"speed":"47.22","travel_time":"30","borough":"Staten Island","link_name":"SIE W BRADLEY AVENUE - WOOLEY AVENUE","link_points":"40.6077805,-74.14091 40.60826,-74.132101","latitude":"40.6077805","longitude":"-74.14091","miles":"5475.42","title":"Prudential Center - ROCK :wrestling","description":"Prudential Center: wrestling on Prudential Center - ROCK at (Newark) World Championship Sumo The Biggest Show On Earth, Sunday February 18th, 2024, 07:00 PM thru 10:00 PM","pubDate":"2023-12-28T13:21:01","latitude0":"40.7335901472838","longitude0":"-74.1711848974228","VehicleLocationLatitude":"40.793904","VehicleLocationLongitude":"-73.970047","StopPointRef":"MTA_401935","VehicleRef":"MTA NYCT_9774","ProgressRate":"normalProgress","ExpectedDepartureTime":"2024-02-14T08:35:06.327-05:00","StopPoint":"","VisitNumber":"1","DataFrameRef":"2024-02-14","StopPointName":"W 96 ST/AMSTERDAM AV","Bearing":"337.36087","OriginAimedDepartureTime":"","OperatorRef":"MTA NYCT","DestinationName":"EAST HARLEM FDR DRIVE CROSSTOWN","ExpectedArrivalTime":"2024-02-14T08:35:06.327-05:00","BlockRef":"MTA NYCT_MV_A4-Weekday-SDon_E_MV_25200_M96-811","LineRef":"MTA NYCT_M106","DirectionRef":"0","ArrivalProximityText":"at stop","DistanceFromStop":"8","EstimatedPassengerCapacity":"","AimedArrivalTime":"2024-02-14T08:29:18.691-05:00","PublishedLineName":"M106","ProgressStatus":"","DestinationRef":"MTA_803066","EstimatedPassengerCount":"","OriginRef":"MTA_401933","NumberOfStopsAway":"0","ts":"1707917736851","eventTimeStamp":"2024-02-16 00:21:35.259","allid":"e3c0e9d8-473d-4edd-9b07-5c83c66e73b116fb14f5-e981-48ef-879e-1d4eee92131e8ab5b20a-f907-4ad6-bbd7-853ef81f0464"},

````
