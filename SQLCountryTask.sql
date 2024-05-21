CREATE DATABASE CountryTask;

-- Ölkə cədvəlini yaratmaq
CREATE TABLE Country (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    phoneCode VARCHAR(10),
    religionId INT,
    population INT,
    area FLOAT,
    president NVARCHAR(100)
);

-- Şəhər cədvəlini yaratmaq
CREATE TABLE City (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    population INT,
    area FLOAT,
    countryId INT,
    FOREIGN KEY (countryId) REFERENCES Country(id)
);

-- Din cədvəlini yaratmaq
CREATE TABLE Religion (
    id INT PRIMARY KEY,
    name NVARCHAR(100)
);

-- Din məlumatlarını daxil etmək
INSERT INTO Religion (id, name) VALUES
(1, 'Xristian'),
(2, 'Buddizm'),
(3, 'İslam');

-- Ölkələri daxil etmək
INSERT INTO Country (id, name, phoneCode, religionId, population, area, president) VALUES
(1, N'Azərbaycan', '+994', 3, 10000000, 86600, N'İlham Əliyev'),
(2, 'Almaniya', '+49', 1, 83000000, 357000, 'Frank-Walter Steinmeier'),
(3, 'Niderland', '+31', 1, 17000000, 41526, 'Mark Rutte');

-- Şəhərləri daxil etmək
INSERT INTO City (id, name, population, area, countryId) VALUES
(1, N'Bakı', 3000000, 2200, 1),
(2, 'Berlin', 3600000, 891.8, 2),
(3, 'Dresden', 550000, 328.3, 2),
(4, 'Den Haag', 860000, 219.3, 3);

SELECT * FROM Country;
SELECT * FROM Religion;
SELECT * FROM City;

--Ölkələri əlifbaya görə seçmək:
SELECT * FROM Country ORDER BY name;

--Şəhər adı "D" ilə başlayanları seçmək:
SELECT * FROM City WHERE name LIKE 'D%';

--Ölkənin 3-cü hərfinin "N" olduğu ölkəni seçmək:
SELECT * FROM Country WHERE SUBSTRING(name, 3, 1) = 'N';

--Əhali 10000-dən çox olan xristian ölkələrini seçmək:
SELECT * FROM Country WHERE religionId = 1 AND population > 10000;

