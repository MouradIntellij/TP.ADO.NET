-- =====================================================
-- 01_Create_LangagesDb.sql
-- Cours 420-DA3-AS - TP ADO.NET 3-tiers (Langages / Projets)
-- SQL Server Express (.\SQLEXPRESS) - Windows Auth
-- =====================================================

CREATE DATABASE LangagesDb;
GO
USE LangagesDb;
GO

-- ------------------------------------------------------------------
-- Table 1 : Langages
-- ------------------------------------------------------------------
CREATE TABLE Langages
(
    LangageId     INT IDENTITY(1,1) PRIMARY KEY,
    Nom           NVARCHAR(80)   NOT NULL UNIQUE,
    Paradigme     NVARCHAR(60)   NOT NULL,
    AnneeCreation INT            NULL
);

-- ------------------------------------------------------------------
-- Table 2 : Projets (avec clé étrangère vers Langages)
-- ------------------------------------------------------------------
CREATE TABLE Projets
(
    ProjetId    INT IDENTITY(1,1) PRIMARY KEY,
    LangageId   INT NOT NULL,
    Nom         NVARCHAR(120) NOT NULL,
    Description NVARCHAR(300) NULL,
    CONSTRAINT FK_Projet_Langage FOREIGN KEY (LangageId)
        REFERENCES Langages(LangageId)
);

-- ------------------------------------------------------------------
-- Données de départ
-- ------------------------------------------------------------------
INSERT INTO Langages (Nom, Paradigme, AnneeCreation)
VALUES (N'C#', N'Objet', 2000),
       (N'Python', N'Multi-paradigme', 1991),
       (N'JavaScript', N'Multi-paradigme', 1995);

INSERT INTO Projets (LangageId, Nom, Description)
VALUES (1, N'Application 3-tiers', N'Exercice du cours DAL'),
       (2, N'Analyse de données', N'Traitement de fichiers CSV');
GO

-- ------------------------------------------------------------------
-- Vérifications
-- ------------------------------------------------------------------
SELECT * FROM Langages;
SELECT * FROM Projets;
GO