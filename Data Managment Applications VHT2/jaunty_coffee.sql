/*
*   Part 1 Develop SQL code to create each table as specified in 
*   the attached “Jaunty Coffee Co. ERD”
*/

CREATE TABLE IF NOT EXISTS coffee_shop
(
    shop_id INT,
    shop_name VARCHAR(50) NOT NULL,
    city VARCHAR(50)  NOT NULL,
    state CHAR(2)  NOT NULL,
    PRIMARY KEY(shop_id)
);

CREATE TABLE IF NOT EXISTS supplier
(
    supplier_id INT,
    company_name VARCHAR(50) NOT NULL,
    country VARCHAR(30) NOT NULL,
    sales_contact_name VARCHAR(50) NOT NULL DEFAULT 'Joe Doe',
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY(supplier_id)
);

CREATE TABLE IF NOT EXISTS coffee 
(
    coffee_id INT,
    shop_id INT NOT NULL,
    supplier_id INT NOT NULL,
    coffee_name VARCHAR(30) NOT NULL,
    price_per_pound DECIMAL(5,2) NOT NULL DEFAULT '0.00',
    PRIMARY KEY(coffee_id),
    FOREIGN KEY (shop_id) REFERENCES coffee_shop(shop_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS employee
(
    employee_id INT,
    first_name VARCHAR(30) NOT NULL DEFAULT 'JOE',
    last_name VARCHAR(30)  NOT NULL DEFAULT 'DOE',
    hire_date DATE  NOT NULL DEFAULT '2000-01-01',
    job_title VARCHAR(30) NOT NULL,
    shop_id INT NOT NULL,
    PRIMARY KEY(employee_id),
    FOREIGN KEY (shop_id) REFERENCES coffee_shop(shop_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

/*
    Insert Data Into each table
*/
INSERT INTO coffee_shop
VALUES
('200', "Supreme Coffee & Donuts", 'Brockton', 'MA'),
('201', 'Common Word Cafe', 'Roxbury', 'MA'),
('202', 'NajmaDinar', 'Dorchester', 'MA'),
('203', 'Open Kettle', 'Quincy', 'MA'),
('204', 'Son of Coffee Bean', 'Stoughton', 'MA'),
('205', 'No Doze Cafe', 'Haverhill', 'MA'),
('206', "White's Bakery & Cafe", 'Methun', 'MA'),
('207', "Heav'nly Donuts", 'Methun', 'MA'),
('208', 'Wicked Big Cafe', 'Haverhill', 'MA'),
('209', 'Cafe Mediterano', 'Essex Junction', 'VT'),
('210', 'Wayfarer Coffee Roasters', 'Laconia', 'NH'),
('211', 'Main Street Cafe', 'Avon', 'MA');

INSERT INTO supplier
VALUES
('300', 'Farmer Brothers', 'USA', 'Joesph Griffen', "j.griffen@fmb.com"),
('301', 'Burdent Coffee', 'Spain', "Sebastian De Leon", "leon@burdentcoffee.com"),
('302', 'Kaldi Gourmet Coffee Roasters', 'Canada', 'George Saul', "george.saul@kaldi.com"),
('303', 'Kahve Tedarikci', 'Turkey', "Hamid Ould-Brahim", "ouldbrahim.hamid@kahve.com"),
('304', 'Firebrand Roasters', 'USA', 'Michael Booth', "booth@firebrand.com"),
('305', "Patel's Wholesale Coffee Co.", 'United Kingdom', 'Kalpesh Patel', "kpatel@pwc.co.uk"),
('306', 'Altas Coffee Importers', 'USA', 'James Fahey', "j.fahey@atlas.com"),
('307', 'Aztec Cafe', 'Mexico', 'Isabella Morlas', "morlas@ac.co.mx"),
('308', 'BattleForged Rebels Coffee', 'Ireland', 'Sean Tracy', "sean.tracy@bcr.com"),
('309', 'Bunaroma Royal Coffee Exporter', 'Ethiopia', 'Ibrahim Ottwa', "ottwa@bunaroma.com"),
('310', 'Reykjavik Roasters', 'Iceland', 'Freydis Guomundsdottir', "frey@rr.com"),
('311', 'Mayorga Organics', 'USA', 'Martin Mayorga', "martin@mayorga.com");

INSERT INTO coffee
VALUES
('400', '200', '301', 'EXTRA CREME', '12.46'),
('401', '209', '302', 'CELEBES SULAWESI KALOSSI', '10.35'),
('402', '211', '300', 'Sierra Blend Medium Roast', '2.50'),
('403', '206', '306', 'Jamaica Blue Mountain', '4.50'),
('404', '201', '309', 'Specialty Sidamo Coffee','6.95'),
('405', '203', '310', 'Dona Nenem', '15.30'),
('406', '205', '304', 'Firebrand Colombo Medium Roast', '3.50'),
('407', '204', '308', 'Celtic Storm', '9.50'),
('408', '207', '307', 'Heavenly Hazelnut', '10.00'),
('409', '208', '311', 'Muy Macho', '11.60'),
('410', '210', '305', 'Monsoon Malabar AA Arabica', '8.35'),
('411', '202', '303', 'Kahve Tedarikci Special', '20.00');

INSERT INTO employee
VALUES
('100', 'Jose', 'Pellicier', '1998-03-21', 'Manager', '200'),
('101', 'Nicolas', 'Do', '2017-12-13', 'Porter', '201'),
('102', 'Rachida', 'Burkina', '1990-02-01', 'Manager', '202'),
('103', 'Cindy', 'Noname', '2020-09-28', 'Barista', '203'),
('104', 'Darach', "O'Cathain", '2005-10-20', 'Buyer', '204'),
('105', 'Sara', 'Smith', '2021-08-19', 'Team Member', '205'),
('106', 'Ruth', 'Saul', '2000-02-28', 'Sr Baker', '206'), 
('107', 'Janet', 'Peters', '2005-04-08', 'Porter', '207'),
('108', 'Carlos', 'Nee', '1995-05-19', 'Maintenance', '208'),
('109', 'Kevin', 'Hellmuth', '2016-06-23', 'Shift Supervisor', '209'),
('110', 'Ken', 'Prescott', '2009-09-15', 'Solution Architect Technology', '210'),
('111', 'Mary', 'Barber', '2017-09-28', 'Sales', '211');

/*
*   Part 3 Develop SQL code to create a view by doing the following: 
*   Provide the SQL code you wrote to create your view. 
*   The view should show all of the information from the “Employee” table 
*   but concatenate each employee’s first and last name, 
*   formatted with a space between the first and last name, into a new attribute called employee_full_name.
*/
CREATE VIEW employee_view AS
    SELECT 
        employee_id, 
        CONCAT(first_name, ' ', last_name) AS employee_full_name,
        hire_date,
        job_title,
        shop_id
    FROM 
        employee;

CREATE VIEW coffeeshop_view AS
    SELECT 
        *
    FROM
        coffee_shop;

CREATE VIEW coffee_view AS
    SELECT 
        *
    FROM
        coffee;

CREATE VIEW supplier_view AS
    SELECT 
        *
    FROM
        supplier;
/*
*   B4.Develop SQL code to create an index on the coffee_name field.
*/
CREATE INDEX idx_coffename
ON coffee(coffee_name);

/*
*   B5.Develop SQL code to create an SFW (SELECT–FROM–WHERE) query 
*   for any of your tables or views
*/
SELECT coffee_name, price_per_pound
FROM coffee
WHERE price_per_pound >= '10.00'
ORDER BY coffee_name;

SELECT employee_full_name, job_title
FROM employee_view
WHERE hire_date >= '2000-01-01'
ORDER BY employee_full_name;


/*
*   Develop SQL code to create a join query on three different tables.
*   The query joins together 3 different tables and includes attributes from all 3 tables in its output.
*/

SELECT * 
FROM coffee_shop
INNER JOIN coffee
USING (shop_id)
INNER JOIN supplier
USING (supplier_id);


