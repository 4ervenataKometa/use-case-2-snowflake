CREATE DATABASE SQUIRREL_ZOO_DB;

CREATE SCHEMA SQUIRREL_ZOO_DB.MASTER_DATA;

CREATE TABLE SQUIRREL_ZOO_DB.MASTER_DATA.zoo_info (
  RECORD_ID INT AUTOINCREMENT,
  ZOO_JSON VARIANT
);

INSERT INTO SQUIRREL_ZOO_DB.MASTER_DATA.zoo_info (ZOO_JSON)
SELECT PARSE_JSON('{
  "zooName": "Cosmic Critters Galactic Zoo",
  "location": "Space Station Delta-7, Sector Gamma-9",
  "establishedDate": "2077-01-01",
  "director": {
    "name": "Zorp Glorbax",
    "species": "Xylosian"
  }
}');

CREATE TABLE SQUIRREL_ZOO_DB.MASTER_DATA.habitats (
  RECORD_ID INT AUTOINCREMENT,
  HABITAT_JSON VARIANT
);

INSERT INTO SQUIRREL_ZOO_DB.MASTER_DATA.habitats (HABITAT_JSON)
SELECT PARSE_JSON('{
  "habitats": [
    {
    "id": "H001",
    "name": "Crystal Caves",
    "environmentType": "Subterranean",
    "sizeSqMeters": 1500,
    "safetyRating": 4.5,
    "features": ["Luminescent Flora", "Geothermal Vents", "Echo Chambers"],
    "currentTempCelsius": 15
    },
    {
    "id": "H002",
    "name": "Azure Aquarium",
    "environmentType": "Aquatic",
    "sizeSqMeters": 3000,
    "safetyRating": 4.8,
    "features": ["Coral Reef Simulation", "High-Pressure Zone", "Bioluminescent Plankton"],
    "currentTempCelsius": 22
    },
    {
    "id": "H003",
    "name": "Floating Forest",
    "environmentType": "Zero-G Jungle",
    "sizeSqMeters": 2500,
    "safetyRating": 4.2,
    "features": ["Magnetic Vines", "Floating Islands", "Simulated Rain"],
    "currentTempCelsius": 28
    },
    {
    "id": "H004",
    "name": "Frozen Tundra",
    "environmentType": "Arctic",
    "sizeSqMeters": 1800,
    "safetyRating": 4.0,
    "features": ["Ice Caves", "Simulated Aurora"],
    "currentTempCelsius": -10
        }
  ]
}');

CREATE TABLE SQUIRREL_ZOO_DB.MASTER_DATA.creatures (
  RECORD_ID INT AUTOINCREMENT,
  CREATURE_JSON VARIANT
);

INSERT INTO SQUIRREL_ZOO_DB.MASTER_DATA.creatures (CREATURE_JSON)
SELECT PARSE_JSON('{
  "creatures": [
    {
    "id": "C001",
    "name": "Gloob",
    "species": "Gelatinoid",
    "originPlanet": "Xylar",
    "diet": "Photosynthesis",
    "temperament": "Docile",
    "habitatId": "H001",
    "acquisitionDate": "2077-01-15",
    "specialAbilities": null,
    "healthStatus": { "lastCheckup": "2077-03-01", "status": "Excellent" }
    },
    {
    "id": "C002",
    "name": "Finblade",
    "species": "Aqua-Predator",
    "originPlanet": "Neptunia Prime",
    "diet": "Carnivore",
    "temperament": "Aggressive",
    "habitatId": "H002",
    "acquisitionDate": "2077-02-01",
    "specialAbilities": ["Sonar Burst", "Camouflage"],
    "healthStatus": { "lastCheckup": "2077-03-10", "status": "Good" }
    },
    {
    "id": "C003",
    "name": "Sky-Wisp",
    "species": "Aether Flyer",
    "originPlanet": "Cirrus V",
    "diet": "Energy Absorption",
    "temperament": "Shy",
    "habitatId": "H003",
    "acquisitionDate": "2077-02-20",
    "specialAbilities": ["Invisibility", "Phase Shift"],
    "healthStatus": { "lastCheckup": "2077-03-15", "status": "Fair" }
    },
    {
    "id": "C004",
    "name": "Krystal Krawler",
    "species": "Silicate Arthropod",
    "originPlanet": "Xylar",
    "diet": "Mineralvore",
    "temperament": "Neutral",
    "habitatId": "H001",
    "acquisitionDate": "2077-03-05",
    "specialAbilities": ["Crystal Armor", "Burrowing"],
    "healthStatus": { "lastCheckup": "2077-03-20", "status": "Excellent" }
    },
    {
    "id": "C005",
    "name": "Ice Strider",
    "species": "Cryo-Mammal",
    "originPlanet": "Cryonia",
    "diet": "Herbivore",
    "temperament": "Docile",
    "habitatId": "H004",
    "acquisitionDate": "2077-03-10",
    "specialAbilities": ["Thermal Resistance", "Ice Skating"],
    "healthStatus": { "lastCheckup": "2077-03-25", "status": "Good"}
    }
  ]
}');

CREATE SCHEMA SQUIRREL_ZOO_DB.EMPLOYEES;

CREATE TABLE SQUIRREL_ZOO_DB.EMPLOYEES.STAFF (
  RECORD_ID INT AUTOINCREMENT,
  STAFF_JSON VARIANT
);

INSERT INTO SQUIRREL_ZOO_DB.EMPLOYEES.STAFF (STAFF_JSON)
SELECT PARSE_JSON('{
  "staff": [
    {
    "employeeId": "S001",
    "name": "Grunga",
    "role": "Senior Keeper",
    "species": "Gronk",
    "assignedHabitatIds": ["H001", "H004"]
    },
    {
    "employeeId": "S002",
    "name": "Dr. Elara Vance",
    "role": "Chief Veterinarian",
    "species": "Human",
    "assignedHabitatIds": []
    },
    {
    "employeeId": "S003",
    "name": "Bleep-Bloop",
    "role": "Maintenance Droid",
    "species": "Robotic Unit 7",
    "assignedHabitatIds": ["H002", "H003"]
    }
  ]
}');

CREATE SCHEMA SQUIRREL_ZOO_DB.EVENTS;

CREATE TABLE SQUIRREL_ZOO_DB.EVENTS.UPCOMINGEVENTS (
  RECORD_ID INT AUTOINCREMENT,
  EVENT_JSON VARIANT
);

INSERT INTO SQUIRREL_ZOO_DB.EVENTS.UPCOMINGEVENTS (EVENT_JSON)
SELECT PARSE_JSON('{
  "upcomingEvents": [
    {
    "eventId": "E001",
    "name": "Finblade Feeding Frenzy",
    "type": "Feeding Show",
    "scheduledTime": "2077-04-01T14:00:00Z",
    "locationHabitatId": "H002",
    "involvedCreatureIds": ["C002"]
    },
    {
    "eventId": "E002",
    "name": "Sky-Wisp Visibility Demo",
    "type": "Educational",
    "scheduledTime": "2077-04-05T11:00:00Z",
    "locationHabitatId": "H003",
    "involvedCreatureIds": ["C003"]
    }
  ]
}');


--Профил на зоопарка
SELECT ZOO_JSON:zooName AS zoo_name, 
    ZOO_JSON:location AS location
FROM SQUIRREL_ZOO_DB.MASTER_DATA.zoo_info;

--Достъп до данни вложен обект
SELECT ZOO_JSON:director.name AS director_name, 
    ZOO_JSON:director.species AS director_species
FROM SQUIRREL_ZOO_DB.MASTER_DATA.zoo_info;

--Изброяване на всички същества
SELECT CREATURE.value:name AS creature_name,
    CREATURE.value:species AS creature_species
FROM SQUIRREL_ZOO_DB.MASTER_DATA.creatures,
    LATERAL FLATTEN(input => CREATURE_JSON:creatures) AS CREATURE;

--Филтриране на същества по произход
SELECT CREATURE.value:name AS creature_name
FROM SQUIRREL_ZOO_DB.MASTER_DATA.creatures,
    LATERAL FLATTEN(input => CREATURE_JSON:creatures) AS CREATURE
WHERE CREATURE.value:originPlanet = 'Xylar';

--Заявка за хабитати по размер
SELECT HABITAT.value:name AS habitat_name,
    HABITAT.value:environmentType AS environment_type
FROM SQUIRREL_ZOO_DB.MASTER_DATA.habitats,
    LATERAL FLATTEN(input => HABITAT_JSON:habitats) HABITAT
WHERE HABITAT.value:sizeSqMeters::NUMBER > 2000;

--Намиране на същества със специфични способности
SELECT creature.value:name AS creature_name
FROM SQUIRREL_ZOO_DB.MASTER_DATA.creatures,
    LATERAL FLATTEN(input => CREATURE_JSON:creatures) CREATURE
WHERE creature.value:specialAbilities IS NOT NULL 
    AND ARRAY_CONTAINS('Camouflage'::VARIANT, creature.value:specialAbilities);


--Проверка на здравния статус на съществата
SELECT creature.value:name AS creature_name,
    creature.value:healthStatus.status AS health_status
FROM SQUIRREL_ZOO_DB.MASTER_DATA.creatures,
    LATERAL FLATTEN(input => CREATURE_JSON:creatures) AS CREATURE
WHERE creature.value:healthStatus.status != 'Excellent';

--Разпределения на персонала**
SELECT s.value:name AS employee_name,
    s.value:role AS employee_role
FROM SQUIRREL_ZOO_DB.EMPLOYEES.STAFF,
    LATERAL FLATTEN(input => STAFF_JSON:staff) AS s
WHERE ARRAY_CONTAINS('H001'::VARIANT, s.value:assignedHabitatIds);

--Брой същества по хабитат**
SELECT CREATURE.value:habitatId AS habitat_id,
    COUNT(*) AS creature_count
FROM SQUIRREL_ZOO_DB.MASTER_DATA.creatures,
    LATERAL FLATTEN(input => CREATURE_JSON:creatures) AS CREATURE
GROUP BY habitat_id
ORDER BY creature_count DESC;


--Изследване на характеристиките на хабитатите**
SELECT DISTINCT
    FEATURE.value AS feature
FROM SQUIRREL_ZOO_DB.MASTER_DATA.habitats,
    LATERAL FLATTEN(input => HABITAT_JSON:habitats) AS HABITAT,
    LATERAL FLATTEN(input => HABITAT.value:features) AS FEATURE
ORDER BY feature;

--Детайли за предстоящи събития
SELECT EVENT.value:name AS event_name,
    EVENT.value:type AS event_type,
    TO_TIMESTAMP(EVENT.value:scheduledTime) AS scheduled_time
FROM SQUIRREL_ZOO_DB.EVENTS.UPCOMINGEVENTS,
    LATERAL FLATTEN(input => EVENT_JSON:upcomingEvents) AS EVENT
ORDER BY scheduled_time;

--Свързване на същества с типовете среда на хабитатите им
WITH creature_data AS (
  SELECT 
    CREATURE.value:id AS creature_id,
    CREATURE.value:name AS creature_name,
    CREATURE.value:habitatId AS habitat_id
  FROM SQUIRREL_ZOO_DB.MASTER_DATA.creatures,
       LATERAL FLATTEN(input => CREATURE_JSON:creatures) CREATURE
),
habitats_data AS (
  SELECT 
    HABITAT.value:id AS habitat_id,
    HABITAT.value:environmentType AS habitat_environment_type
  FROM SQUIRREL_ZOO_DB.MASTER_DATA.habitats,
       LATERAL FLATTEN(input => HABITAT_JSON:habitats) HABITAT
)

SELECT 
  c.creature_name,
  h.habitat_environment_type
FROM creature_data c
JOIN habitats_data h
  ON c.habitat_id = h.habitat_id;










