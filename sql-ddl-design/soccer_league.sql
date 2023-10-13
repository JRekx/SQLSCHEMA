CREATE DATABASE soccer_league;

USE soccer_league;


CREATE TABLE Teams (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(255),
    TeamLocation VARCHAR(255)
);

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(255),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE Matches (
    MatchID INT PRIMARY KEY,
    Team1ID INT,
    Team2ID INT,
    MatchDate DATE,
    Result VARCHAR(20),
    FOREIGN KEY (Team1ID) REFERENCES Teams(TeamID),
    FOREIGN KEY (Team2ID) REFERENCES Teams(TeamID)
);

CREATE TABLE Goals (
    GoalID INT PRIMARY KEY,
    MatchID INT,
    PlayerID INT,
    GoalMinute INT,
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);

CREATE TABLE Referees (
    RefereeID INT PRIMARY KEY,
    RefereeName VARCHAR(255)
);

CREATE TABLE MatchReferees (
    MatchID INT,
    RefereeID INT,
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (RefereeID) REFERENCES Referees(RefereeID)
);

CREATE TABLE Seasons (
    SeasonID INT PRIMARY KEY,
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE TeamSeasonStats (
    TeamID INT,
    SeasonID INT,
    MatchesPlayed INT,
    MatchesWon INT,
    MatchesDrawn INT,
    MatchesLost INT,
    GoalsFor INT,
    GoalsAgainst INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID)
);
