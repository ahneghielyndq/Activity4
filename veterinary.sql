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

INSERT INTO appointments (appointment_id, pet_id, vet_id, appointment_date, reason, status)
VALUES
(1, 1, 1, '2025-01-10 09:00:00', 'Annual Checkup', 'Completed'),
(2, 2, 2, '2025-01-12 10:30:00', 'Vaccination', 'Completed'),
(3, 3, 1, '2025-01-15 13:00:00', 'Skin Allergy', 'Cancelled'),
(4, 4, 3, '2025-01-17 15:45:00', 'Deworming', 'Completed'),
(5, 5, 2, '2025-01-20 11:15:00', 'Follow-up Checkup', 'Pending'),
(6, 1, 3, '2025-01-22 14:00:00', 'Dental Cleaning', 'Completed'),
(7, 2, 1, '2025-01-25 16:30:00', 'Limping/Leg Injury', 'Pending'),
(8, 3, 3, '2025-01-26 09:45:00', 'Ear Infection', 'Completed'),
(9, 4, 2, '2025-01-28 08:30:00', 'Vaccination Booster', 'Completed'),
(10, 5, 1, '2025-01-30 12:00:00', 'General Illness', 'Pending');

INSERT INTO doctors (doctorid, dfirstname, dlastname, specialty, phone, email) VALUES
(1, 'Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria.santos@vetclinic.com'),
(2, 'Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio.gonzales@vetclinic.com'),
(3, 'Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe.luna@vetclinic.com'),
(4, 'Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia.reyes@vetclinic.com'),
(5, 'Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis.torres@vetclinic.com'),
(6, 'Carmen', 'Fernandez', 'Ophthalmology Specialist', '333-222-1111', 'carmen.fernandez@vetclinic.com'),
(7, 'Robert', 'Chen', 'Neurology Specialist', '444-555-6666', 'robert.chen@vetclinic.com'),
(8, 'Sarah', 'Johnson', 'Cardiology Specialist', '777-888-9999', 'sarah.johnson@vetclinic.com'),
(9, 'James', 'Wilson', 'Dentistry Specialist', '222-333-4444', 'james.wilson@vetclinic.com'),
(10, 'Emily', 'Davis', 'Emergency Care Specialist', '666-777-8888', 'emily.davis@vetclinic.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes) VALUES 
(1, 1, '2023-01-05 10:30:00', 1, 'Annual Checkup', 'None required', 'Healthy adult cat, good weight'),
(2, 2, '2023-02-14 14:15:00', 2, 'Vaccination Update', 'Rabies Vaccine', 'Administered annual rabies vaccination'),
(3, 3, '2023-03-10 09:00:00', 3, 'Limping on right front leg', 'Anti-inflammatory medication', 'X-ray shows mild sprain, recommend rest'),
(4, 4, '2023-04-05 11:45:00', 4, 'Skin Allergy', 'Antihistamines', 'Allergic reaction to new food, switch to hypoallergenic diet'),
(5, 5, '2023-05-20 13:30:00', 5, 'Dental Cleaning', 'Antibiotics for mild gingivitis', 'Completed dental cleaning, teeth in good condition'),
(6, 6, '2023-06-15 10:00:00', 6, 'Eye Infection', 'Antibiotic eye drops', 'Conjunctivitis detected, apply drops twice daily'),
(7, 7, '2023-07-08 15:20:00', 7, 'Flea Infestation', 'Flea treatment', 'Administered topical flea treatment, follow up in 2 weeks'),
(8, 8, '2023-08-12 08:45:00', 8, 'Spaying Surgery', 'Pain medication', 'Successful spaying surgery, recovery going well'),
(9, 9, '2023-09-25 16:10:00', 9, 'Vomiting and Diarrhea', 'Anti-nausea medication', 'Gastrointestinal upset, recommend bland diet for 3 days'),
(10, 10, '2023-10-30 12:00:00', 10, 'Annual Vaccination', 'Distemper/Parvo Vaccine', 'Administered annual vaccines, all vitals normal');

ALTER TABLE owners
ADD COLUMN RegisteredDate DATE;
