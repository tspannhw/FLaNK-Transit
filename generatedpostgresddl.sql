-- public.mtasubwaystations definition

-- Drop table

-- DROP TABLE public.mtasubwaystations;

CREATE TABLE public.mtasubwaystations (
	division text NULL,
	line text NULL,
	borough text NULL,
	stationname text NULL,
	stationlatitude text NULL,
	stationlongitude text NULL,
	daytimeroutes text NULL,
	entrancetype text NULL,
	entry text NULL,
	exitonly text NULL,
	vending text NULL,
	staffing text NULL,
	northsouthstreet text NULL,
	eastweststreet text NULL,
	corner text NULL,
	entrancelatitude text NULL,
	entrancelongitude text NULL,
	entity text NULL,
	entrancegeoreference text NULL,
	stationgeoreference text NULL,
	ts text NULL,
	uuid text NOT NULL,
	CONSTRAINT mtasubwaystations_pkey PRIMARY KEY (uuid)
);
