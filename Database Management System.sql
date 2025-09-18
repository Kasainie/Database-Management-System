-- Create the database
CREATE DATABASE ClinicBookingSystem;

-- Use the newly created database
USE ClinicBookingSystem;

-- Create the Specializations table
-- This table stores different medical specializations.
CREATE TABLE Specializations (
    specialization_id INT PRIMARY KEY AUTO_INCREMENT,
    specialization_name VARCHAR(255) UNIQUE NOT NULL
);

-- Create the Doctors table
-- This table stores information about doctors, with a foreign key linking to Specializations.
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    specialization_id INT,
    FOREIGN KEY (specialization_id) REFERENCES Specializations(specialization_id)
);

-- Create the Patients table
-- This table stores information about patients.
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    phone_number VARCHAR(20),
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Create the Appointments table
-- This table manages the bookings, linking a patient to a doctor at a specific time.
-- It establishes a many-to-many relationship between Doctors and Patients.
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Insert sample data into the Specializations table
INSERT INTO Specializations (specialization_name) VALUES
('Cardiology'),
('Pediatrics'),
('Dermatology');

-- Insert sample data into the Doctors table
INSERT INTO Doctors (first_name, last_name, email, phone_number, specialization_id) VALUES
('Jane', 'Doe', 'jane.doe@clinic.com', '555-1234', 1),
('John', 'Smith', 'john.smith@clinic.com', '555-5678', 2),
('Emily', 'Jones', 'emily.jones@clinic.com', '555-9012', 3);

-- Insert sample data into the Patients table
INSERT INTO Patients (first_name, last_name, date_of_birth, phone_number, email) VALUES
('Michael', 'Brown', '1985-04-12', '555-2345', 'michael.brown@email.com'),
('Sarah', 'Davis', '2010-08-25', '555-6789', 'sarah.davis@email.com'),
('David', 'Wilson', '1970-11-30', '555-0123', 'david.wilson@email.com');

-- Insert sample data into the Appointments table
INSERT INTO Appointments (appointment_date, appointment_time, patient_id, doctor_id, status) VALUES
('2025-09-20', '10:00:00', 1, 1, 'Scheduled'),
('2025-09-21', '14:30:00', 2, 2, 'Scheduled'),
('2025-09-22', '09:15:00', 3, 3, 'Scheduled');
