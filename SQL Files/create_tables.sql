-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "median_income" (
    "id" INT   ,
    "year" INT   ,
    "location_id" INT   ,
    "median_income" INT   ,
    CONSTRAINT "pk_median_income" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "minimum_wage" (
    "id" INT   ,
    "year" INT   ,
    "location_id" INT   ,
    "min_wage" INT   ,
    CONSTRAINT "pk_minimum_wage" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "occupation_wage" (
    "id" INT   ,
    "year" INT   ,
    "occ_id" INT   ,
    "occ_title" VARCHAR(30)   ,
    "level" VARCHAR(30)   ,
    "hourly_mean" INT   ,
    "annual_mean" INT   ,
    CONSTRAINT "pk_occupation_wage" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "life_expectancy" (
    "location_id" INT   ,
    "life_expectancy" VARCHAR(30)   
);

CREATE TABLE "locations" (
    "location_id" INT   ,
    "location_name" VARCHAR(30)   ,
    CONSTRAINT "pk_locations" PRIMARY KEY (
        "location_id"
     )
);

ALTER TABLE "median_income" ADD CONSTRAINT "fk_median_income_location_id" FOREIGN KEY("location_id")
REFERENCES "locations" ("location_id");

ALTER TABLE "minimum_wage" ADD CONSTRAINT "fk_minimum_wage_year" FOREIGN KEY("year")
REFERENCES "median_income" ("year");

ALTER TABLE "minimum_wage" ADD CONSTRAINT "fk_minimum_wage_location_id" FOREIGN KEY("location_id")
REFERENCES "locations" ("location_id");

ALTER TABLE "occupation_wage" ADD CONSTRAINT "fk_occupation_wage_year" FOREIGN KEY("year")
REFERENCES "median_income" ("year");

ALTER TABLE "life_expectancy" ADD CONSTRAINT "fk_life_expectancy_location_id" FOREIGN KEY("location_id")
REFERENCES "locations" ("location_id");

