CREATE DATABASE medical_center;

USE medical_center;

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(255),
    Specialization VARCHAR(255),
    ContanctInfo VARCHAR(255)
);


CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PaitentNAME VARCHAR(255),
    ContactInfo VARCHAR(255),
);

CREATE TABLE Visit(
    VistedId INT PRIMARY KEY,
    DOCTORID INT,
    PatientID INT,
    VisitDate DATE,
    Diagnosis VARCHAR(255),
    FOREIGN KEY (DOCTORID) REFERENCES DOCTOR(DoctorID),
    FOREIGN KEY (PaitentID) REFERENCES Paitent(PaitentID),
);

CREATE TABLE Disease (
    DiseaseID INT PRIMARY KEY,
    DiseaseName VARCHAR(255),
    Description TEXT
);

CREATE TABLE VisitDisease (
    VisitID INT,
    DiseaseID INT,
    PRIMARY KEY (VisitID, DiseaseID),
    FOREIGN KEY (VisitID) REFERENCES Visit(VisitID),
    FOREIGN KEY (DiseaseID) REFERENCES Disease(DiseaseID)
);
