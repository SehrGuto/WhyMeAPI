CREATE TABLE Users (
    Id INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Age INTEGER NOT NULL,
    Email TEXT NOT NULL,
    Description TEXT NOT NULL
);

CREATE TABLE Pasts (
    Id INTEGER PRIMARY KEY,
    Action TEXT NOT NULL
);

CREATE TABLE Results (
    Id INTEGER PRIMARY KEY,
    UserId INTEGER NOT NULL,
    PastId INTEGER NOT NULL,
    Reason TEXT DEFAULT 'Unknown reason',
    FOREIGN KEY (userId) REFERENCES Users(id),
    FOREIGN KEY (pastId) REFERENCES Pasts(id)
);