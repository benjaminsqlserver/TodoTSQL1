-- Step 1: Create the Database
CREATE DATABASE ToDoAppDB;
GO

-- Switch context to the new database
USE ToDoAppDB;
GO

-- Step 2: Create the PriorityLevel table
CREATE TABLE PriorityLevels (
    PriorityID INT PRIMARY KEY,               -- Unique identifier for each priority level
    PriorityName NVARCHAR(50) NOT NULL        -- Name of the priority level (e.g., "Low", "Medium", "High")
);

-- Insert sample priority levels
INSERT INTO PriorityLevels (PriorityID, PriorityName) VALUES (1, 'Low');
INSERT INTO PriorityLevels (PriorityID, PriorityName) VALUES (2, 'Medium');
INSERT INTO PriorityLevels (PriorityID, PriorityName) VALUES (3, 'High');

-- Step 3: Create the Status table
CREATE TABLE Statuses (
    StatusID INT PRIMARY KEY,                 -- Unique identifier for each status
    StatusName NVARCHAR(50) NOT NULL          -- Name of the status (e.g., "Pending", "In Progress", "Completed")
);

-- Insert sample statuses
INSERT INTO Statuses (StatusID, StatusName) VALUES (1, 'Pending');
INSERT INTO Statuses (StatusID, StatusName) VALUES (2, 'In Progress');
INSERT INTO Statuses (StatusID, StatusName) VALUES (3, 'Completed');

-- Step 4: Create the ToDoList table with foreign key references to PriorityLevel and Status
CREATE TABLE ToDoLists (
    TaskID INT IDENTITY(1,1) PRIMARY KEY,     -- Unique identifier for each task
    TaskDescription NVARCHAR(255) NOT NULL,   -- Description of the task
    PriorityID INT,                           -- Reference to PriorityLevel table
    StatusID INT,                             -- Reference to Status table
    DueDate DATE NULL,                        -- Due date for the task
    CreatedAt DATETIME DEFAULT GETDATE(),     -- Creation date of the task
    UpdatedAt DATETIME DEFAULT GETDATE(),     -- Last updated date, default to creation date initially
    Notes NVARCHAR(500) NULL,                 -- Optional notes for additional details
    CONSTRAINT FK_ToDoList_PriorityLevel FOREIGN KEY (PriorityID) REFERENCES PriorityLevels(PriorityID),
    CONSTRAINT FK_ToDoList_Status FOREIGN KEY (StatusID) REFERENCES Statuses(StatusID)
);

-- Step 5: Insert sample tasks into ToDoList table
INSERT INTO ToDoLists (TaskDescription, PriorityID, StatusID, DueDate, Notes)
VALUES 
    ('Buy groceries', 2, 1, '2024-11-10', 'Get milk, eggs, bread, and vegetables'),
    ('Complete project report', 3, 2, '2024-11-15', 'Finalize data analysis section'),
    ('Schedule dentist appointment', 1, 1, '2024-11-20', NULL),
    ('Call plumber for leak repair', 2, 1, '2024-11-11', 'Follow up if no response by 11/12'),
    ('Finish reading book', 1, 1, '2024-11-30', 'Book title: Atomic Habits'),
    ('Prepare presentation for meeting', 3, 1, '2024-11-17', 'Present to management'),
    ('Update resume', 2, 1, '2024-12-01', 'Include recent projects'),
    ('Plan weekend trip', 1, 1, '2024-11-18', 'Look for hotel deals'),
    ('Organize files on computer', 1, 1, '2024-11-12', NULL),
    ('Workout session', 2, 1, '2024-11-08', 'Leg day at the gym'),
    ('Write blog post', 2, 1, '2024-11-16', 'Topic: Productivity tips'),
    ('Email project team update', 3, 1, '2024-11-09', 'Include project timeline'),
    ('Check car maintenance', 2, 1, '2024-11-22', 'Schedule oil change'),
    ('Renew car insurance', 1, 1, '2024-11-25', 'Check policy details'),
    ('Plan family dinner', 1, 1, '2024-11-29', 'Invite family members'),
    ('Back up phone data', 2, 1, '2024-11-10', NULL),
    ('Attend workshop', 3, 2, '2024-11-14', 'Professional development'),
    ('Organize closet', 1, 1, '2024-11-19', 'Donate old clothes'),
    ('Set monthly budget', 2, 1, '2024-11-15', 'Plan expenses for the month'),
    ('Prepare for client presentation', 3, 2, '2024-11-13', 'Confirm with team members');
