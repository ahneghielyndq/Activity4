CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors ( 
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50) NOT NULL, 
    dlastname VARCHAR(50) NOT NULL, 
    specialty VARCHAR(100), 
    phone VARCHAR(15), 
    email VARCHAR(100) 
); 

CREATE TABLE invoices (
 invoiceid INT PRIMARY KEY AUTO_INCREMENT,
 appointid INT,
 totalamount NUMERIC(10,2),
 paymentdate TIME,
 FOREIGN KEY (appointid) REFERENCES
appointments(appointid)
);

CREATE TABLE medicalrecords ( 
    recordid INT PRIMARY KEY, 
    animalid INT, 
    recorddate DATETIME, 
    doctorid INT, 
    diagnosis VARCHAR(255), 
    prescription VARCHAR(255), 
    notes TEXT, 
    FOREIGN KEY (animalid) REFERENCES animals(animalid), 
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Ahneghielyn', 'Salva', 'Masaya', '09171234567', 'ahneghielyn.salva@example.com'),
(2, 'Bianca', 'Santos', 'Rosario', '09182345678', 'bianca.santos@example.com'),
(3, 'Angelo', 'Reyes', 'Timbugan', '09193456789', 'angelo.reyes@example.com'),
(4, 'Angelique', 'Dela Cruz', 'Nato', '09204567891', 'angelique.delacruz@example.com'),
(5, 'Ahngelie', 'Lopez', 'Brgy D', '09215678901', 'ahngelie.lopez@example.com'),
(6, 'Angel', 'Ramirez', 'Balibago', '09226789012', 'angel.ramirez@example.com'),
(7, 'Glenda', 'Flores', 'Pinagkawitan', '09237890123', 'glenda.flores@example.com'),
(8, 'Dennis', 'Gonzales', 'San Juan', '09248901234', 'dennis.gonzales@example.com'),
(9, 'Katrina', 'Torres', 'Sta Cruz', '09259012345', 'katrina.torres@example.com'),
(10, 'Kester', 'Navarro', 'Marilag', '09260123456', 'kester.navarro@example.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid) VALUES
(1, 'Mochi', 'Cat', 'Siamese', '2020-05-15', 'Male', 'Cream', 1),
(2, 'Rocket', 'Dog', 'Golden Retriever', '2019-03-22', 'Male', 'Golden', 2),
(3, 'Nala', 'Cat', 'Persian', '2021-07-10', 'Female', 'White', 3),
(4, 'Thor', 'Dog', 'German Shepherd', '2018-11-05', 'Male', 'Black/Tan', 4),
(5, 'Zara', 'Dog', 'Poodle', '2020-01-30', 'Female', 'Apricot', 5),
(6, 'Leo', 'Cat', 'Maine Coon', '2019-09-14', 'Male', 'Orange Tabby', 6),
(7, 'Bailey', 'Dog', 'Beagle', '2021-02-28', 'Male', 'Tri-color', 7),
(8, 'Ruby', 'Dog', 'Bulldog', '2017-06-19', 'Female', 'Brindle', 8),
(9, 'Onyx', 'Cat', 'Tuxedo', '2022-03-08', 'Male', 'Black/White', 9),
(10, 'Coco', 'Dog', 'Labrador', '2019-12-25', 'Female', 'Chocolate', 10);