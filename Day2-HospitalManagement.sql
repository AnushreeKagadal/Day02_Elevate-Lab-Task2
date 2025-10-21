PRAGMA foreign_keys = ON;

CREATE TABLE doctors (
    doctor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    specialization TEXT NOT NULL,
    phone TEXT,
    experience_years INTEGER DEFAULT 1
);

CREATE TABLE patients (
    patient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    contact TEXT,
    city TEXT DEFAULT 'Not Provided'
);

CREATE TABLE appointments (
    appointment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    doctor_id INTEGER,
    appointment_date TEXT,
    diagnosis TEXT,
    prescription TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

--Inserting Data into tables
-- Inserting doctors
INSERT INTO doctors (name, specialization, phone, experience_years)
VALUES ('Dr. Sandeep Ireshnavar', 'Cardiology', '9876543210', 10);

INSERT INTO doctors (name, specialization)
VALUES ('Dr. Megha Kambale', 'Dermatology');  --here phone & experience use default/NULL

INSERT INTO doctors (name, specialization, phone)
VALUES ('Dr. Ashwini R C', 'Pediatrics', '9123456789');


-- Inserting patients
INSERT INTO patients (name, age, gender, contact, city)
VALUES ('Ravi Karikatti', 45, 'Male', '9988776655', 'Bengaluru');

INSERT INTO patients (name, age, gender, contact)
VALUES ('Anita Kumar', 32, 'Female', '9876501234');  -- city takes default value

INSERT INTO patients (name, age, gender)
VALUES ('Ashwini Gowda', 29, 'Male');  -- contact & city will take null value


-- Inserting appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis, prescription)
VALUES (1, 1, '2025-10-22', 'Chest Pain', 'Blood Test, ECG');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis)
VALUES (2, 2, '2025-10-23', 'Skin Rash');  -- no prescription  so (NULL)

INSERT INTO appointments (patient_id, doctor_id, appointment_date)
VALUES (3, 3, '2025-10-24');  -- missing diagnosis & prescription so NULL

--Verification
Select * from patients;
Select * from doctors;
Select * from appointments;

--Update
UPDATE patients
SET city = 'Chennai'
WHERE name = 'Ashwini Gowda';


UPDATE doctors
SET experience_years = experience_years + 1
WHERE name = 'Dr. Ashwini R C';

--Delete 
DELETE FROM appointments
WHERE appointment_id = 3;


DELETE FROM patients
WHERE name = 'Ashwing Gowda' AND contact IS NULL;



