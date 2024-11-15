--
-- File generated with SQLiteStudio v3.4.4 on Di. Nov 12 13:00:29 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Connection
CREATE TABLE IF NOT EXISTS Connection (pk_connected PRIMARY KEY, fk_person_source REFERENCES Person (pk_person), fk_person_target REFERENCES Person (pk_person));

-- Table: Event
CREATE TABLE IF NOT EXISTS Event (pk_event PRIMARY KEY, fk_place REFERENCES Place (pk_place), description, title, date);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (1, NULL, 'Cortona', 'Cortona 1', 1985);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (5, NULL, 'Cortona', 'Metamorphosis', 1991);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (4, NULL, 'Cortona', 'Utopia & Science', 1989);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (3, NULL, 'Cortona', 'Perception', 1988);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (2, NULL, 'Cortona', 'Cortona 2', 1986);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (6, NULL, 'Cortona', 'Borders & Limits', 1992);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (9, NULL, 'Cortona', 'Inside- Outside', 1996);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (8, NULL, 'Cortona', 'The Many Ways', 1995);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (7, NULL, 'Cortona', 'Mythos & Science', 1994);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (16, NULL, 'Cortona', 'Curiosity & Creativity', 2003);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (15, NULL, 'Cortona', 'Global - Local', 2002);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (14, NULL, 'Cortona', 'Science & Emotions', 2001);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (13, NULL, 'Cortona', 'Creation', 2000);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (12, NULL, 'Cortona', 'Continuity & Jumps', 1999);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (11, 1, 'Cortona', 'Future Visions', 1998);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (10, NULL, 'Cortona', 'Becoming / Being / Passing Away', 1997);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (18, NULL, 'Cortona', 'Beauty', 2005);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (17, NULL, 'Cortona', 'Mind Matters', 2004);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (22, NULL, 'Cortona', 'Bridges over Troubled Water', 2009);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (21, NULL, 'Cortona', 'Knowledge Vs Belief', 2008);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (20, NULL, 'Cortona', 'Ties & Webs', 2007);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (19, NULL, 'Cortona', 'Sign Symbols Codes', 2006);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (27, NULL, 'Cortona', 'I', 2014);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (26, NULL, 'Cortona ', 'Non Local', 2013);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (25, NULL, 'Cortona', 'No Time at All!', 2012);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (24, NULL, 'Cortona', 'Plausibilities', 2011);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (23, NULL, 'Cortona', 'Laybrinth', 2010);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (30, NULL, 'Cortona', 'Concepts on the Move', 2017);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (29, NULL, 'Cortona', 'Uncertainty & Serendipitiy', 2016);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (28, NULL, 'Cortona', 'Reproducibility', 2015);
INSERT INTO Event (pk_event, fk_place, description, title, date) VALUES (31, 9, 'New Age Konferenz', 'Andere
Wirklichkeiten:
Die Konve rgenz neuer Naturwissenschaften
und alter spiritueller Tiaditionen.', 1983);

-- Table: Is_mentioned
CREATE TABLE IF NOT EXISTS Is_mentioned (pk_is_mentioned PRIMARY KEY NOT NULL, description, fk_person REFERENCES Person (pk_person) NOT NULL, fk_publication REFERENCES Publication (pk_publication) NOT NULL);

-- Table: Occupation
CREATE TABLE IF NOT EXISTS Occupation (pk_occupation PRIMARY KEY, description, fk_place REFERENCES Place (pk_place), fk_organization REFERENCES Organization (pk_organization));
INSERT INTO Occupation (pk_occupation, description, fk_place, fk_organization) VALUES (1, 'Professor f�r makromolekulare Chemie', 3, 1);
INSERT INTO Occupation (pk_occupation, description, fk_place, fk_organization) VALUES (2, 'Professor f�r Biochemie', 4, 2);
INSERT INTO Occupation (pk_occupation, description, fk_place, fk_organization) VALUES (3, 'Assistenzprofessor', 3, 1);
INSERT INTO Occupation (pk_occupation, description, fk_place, fk_organization) VALUES (4, 'Freischaffender K�nstler (Bildhauer, Landschaftsarchitekt)', 3, NULL);
INSERT INTO Occupation (pk_occupation, description, fk_place, fk_organization) VALUES (5, 'Psychotherapeutin (Analyse nach C. G. Jung, neoreichianische K�rperarbeit, Prana-Energetik, NLP)', 3, NULL);
INSERT INTO Occupation (pk_occupation, description, fk_place, fk_organization) VALUES (6, 'Dozent f�r persische Sprache und Literatur und islamische Kalligraphie', 6, 5);
INSERT INTO Occupation (pk_occupation, description, fk_place, fk_organization) VALUES (7, 'Research Fellow', 7, 6);
INSERT INTO Occupation (pk_occupation, description, fk_place, fk_organization) VALUES (8, 'Professor f�r r�toromanische Literatur und Kultur', 3, 1);
INSERT INTO Occupation (pk_occupation, description, fk_place, fk_organization) VALUES (9, 'Professor for r�toromanische Literatur', 3, 7);

-- Table: Organization
CREATE TABLE IF NOT EXISTS Organization (pk_organization PRIMARY KEY NOT NULL, name, description, fk_place REFERENCES Place (pk_place));
INSERT INTO Organization (pk_organization, name, description, fk_place) VALUES (1, 'ETH Z�rich', 'technische Universit�t', 3);
INSERT INTO Organization (pk_organization, name, description, fk_place) VALUES (2, 'Universit�t Rom III', 'Universit�t', 4);
INSERT INTO Organization (pk_organization, name, description, fk_place) VALUES (3, 'Scola Normale Superiore', 'Universit�t', 5);
INSERT INTO Organization (pk_organization, name, description, fk_place) VALUES (4, 'IAP (Institut f�r Angewandte Psychologie)', 'Weiterbildungs und Beratungsinstitut', 3);
INSERT INTO Organization (pk_organization, name, description, fk_place) VALUES (5, 'Universit�t K�ln', 'Universit�t', 6);
INSERT INTO Organization (pk_organization, name, description, fk_place) VALUES (6, 'Center for European Studies, Harvard University', 'Forschungsinstitut', 7);
INSERT INTO Organization (pk_organization, name, description, fk_place) VALUES (7, 'Universit�t Z�rich', 'Universit�t', 3);
INSERT INTO Organization (pk_organization, name, description, fk_place) VALUES (8, 'Univeris�t Wien', 'Universit�t', 8);
INSERT INTO Organization (pk_organization, name, description, fk_place) VALUES (9, 'Fundamental Fyssiks Group', 'gegenkulturelle Gruppierung', NULL);

-- Table: Participation
CREATE TABLE IF NOT EXISTS Participation (pk_participation PRIMARY KEY, description, fk_event REFERENCES Event (pk_event) NOT NULL, fk_person REFERENCES Person (pk_person));
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (1, 'Organisation', 11, 1);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (2, 'Workshop-Leiter', 11, 1);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (6, 'Workshop-Leiter', 11, 5);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (7, 'Workshop-Leiter', 11, 6);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (5, 'Workshop-Leiter', 11, 4);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (4, 'Workshop-Leiter', 11, 3);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (3, 'Workshop-Leiter', 11, 2);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (8, 'Workshop-Leiter', 11, 7);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (9, 'Workshop-Leiter', 11, 8);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (10, 'Teilnehmer', 31, 1);
INSERT INTO Participation (pk_participation, description, fk_event, fk_person) VALUES (11, 'Vortrag', 31, 6);

-- Table: Person
CREATE TABLE IF NOT EXISTS Person (pk_person INTEGER PRIMARY KEY NOT NULL, name, gender, birth_date, death_date);
INSERT INTO Person (pk_person, name, gender, birth_date, death_date) VALUES (1, 'Pier Luigi Luisi', 'm', 1938, NULL);
INSERT INTO Person (pk_person, name, gender, birth_date, death_date) VALUES (2, 'J�rg Altherr-Flury', 'm', 1944, 2018);
INSERT INTO Person (pk_person, name, gender, birth_date, death_date) VALUES (3, 'Thea Altherr-Flury', 'w', 1941, NULL);
INSERT INTO Person (pk_person, name, gender, birth_date, death_date) VALUES (4, 'Shams Anwari-Alhossenyni', 'm', 1937, NULL);
INSERT INTO Person (pk_person, name, gender, birth_date, death_date) VALUES (5, 'Iso Camartin', 'm', 1944, NULL);
INSERT INTO Person (pk_person, name, gender, birth_date, death_date) VALUES (6, 'Fritjof Capra', 'm', 1939, NULL);
INSERT INTO Person (pk_person, name, gender, birth_date, death_date) VALUES (7, 'Thornton Chamberlin', 'm', 1949, NULL);
INSERT INTO Person (pk_person, name, gender, birth_date, death_date) VALUES (8, 'Richard R. Ernst', 'm', 1933, 2021);

-- Table: Place
CREATE TABLE IF NOT EXISTS Place (pk_place PRIMARY KEY, name);
INSERT INTO Place (pk_place, name) VALUES (1, 'Cortona, Italien');
INSERT INTO Place (pk_place, name) VALUES (2, 'Perugia, Italien');
INSERT INTO Place (pk_place, name) VALUES (3, 'Z�rich, Schweiz');
INSERT INTO Place (pk_place, name) VALUES (4, 'Rom, Italien');
INSERT INTO Place (pk_place, name) VALUES (5, 'Pisa, Italien');
INSERT INTO Place (pk_place, name) VALUES (6, 'K�ln, Deutschland');
INSERT INTO Place (pk_place, name) VALUES (7, 'Boston, Massachussets');
INSERT INTO Place (pk_place, name) VALUES (8, 'Wien, �sterreich');
INSERT INTO Place (pk_place, name) VALUES (9, 'Alpbach, �sterreich');

-- Table: Presentation
CREATE TABLE IF NOT EXISTS Presentation (pk_presentation PRIMARY KEY, description, fk_person REFERENCES Person (pk_person), fk_workshop REFERENCES Workshop (pk_workshop));
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (1, 'Luigi gives "Making Cortona"', 1, 1);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (2, NULL, 3, 2);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (11, NULL, 8, 10);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (10, NULL, 7, 3);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (9, NULL, 7, 4);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (8, NULL, 6, 5);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (7, NULL, 6, 6);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (6, NULL, 5, 9);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (5, NULL, 4, 7);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (4, NULL, 4, 8);
INSERT INTO Presentation (pk_presentation, description, fk_person, fk_workshop) VALUES (3, NULL, 2, 2);

-- Table: Publication
CREATE TABLE IF NOT EXISTS Publication (pk_publication PRIMARY KEY NOT NULL, date, name, publishing_house);
INSERT INTO Publication (pk_publication, date, name, publishing_house) VALUES (1, 2014, 'The Systems View of Life: A Unifying Vision', 'Cambridge University Press');

-- Table: Publishing
CREATE TABLE IF NOT EXISTS Publishing (pk_publishing PRIMARY KEY, description, fk_person REFERENCES Person (pk_person), fk_publication REFERENCES Publication (pk_publication));
INSERT INTO Publishing (pk_publishing, description, fk_person, fk_publication) VALUES (1, 'Co-Author', 1, 1);
INSERT INTO Publishing (pk_publishing, description, fk_person, fk_publication) VALUES (2, 'Co-Author', 6, 1);

-- Table: Pursuit
CREATE TABLE IF NOT EXISTS Pursuit (pk_pursuit PRIMARY KEY UNIQUE, start_date, end_date, fk_organization REFERENCES Organization (pk_organization), fk_person REFERENCES Person (pk_person), fk_occupation REFERENCES Occupation (pk_occupation));
INSERT INTO Pursuit (pk_pursuit, start_date, end_date, fk_organization, fk_person, fk_occupation) VALUES (1, 1984, 2003, 1, 1, 1);
INSERT INTO Pursuit (pk_pursuit, start_date, end_date, fk_organization, fk_person, fk_occupation) VALUES (2, 1970, 1984, 1, 1, 3);
INSERT INTO Pursuit (pk_pursuit, start_date, end_date, fk_organization, fk_person, fk_occupation) VALUES (3, 2003, 2015, 2, 1, 2);
INSERT INTO Pursuit (pk_pursuit, start_date, end_date, fk_organization, fk_person, fk_occupation) VALUES (4, 1964, NULL, NULL, 2, 4);
INSERT INTO Pursuit (pk_pursuit, start_date, end_date, fk_organization, fk_person, fk_occupation) VALUES (5, 1981, NULL, NULL, 3, 5);
INSERT INTO Pursuit (pk_pursuit, start_date, end_date, fk_organization, fk_person, fk_occupation) VALUES (6, 1974, NULL, 5, 4, 6);
INSERT INTO Pursuit (pk_pursuit, start_date, end_date, fk_organization, fk_person, fk_occupation) VALUES (7, 1985, NULL, 1, 5, 8);
INSERT INTO Pursuit (pk_pursuit, start_date, end_date, fk_organization, fk_person, fk_occupation) VALUES (8, 1985, NULL, 7, 5, 9);

-- Table: Study
CREATE TABLE IF NOT EXISTS Study (pk_study PRIMARY KEY NOT NULL, description, begin_date, end_date, fk_subject REFERENCES Subject (pk_subject), fk_person REFERENCES Person (pk_person));
INSERT INTO Study (pk_study, description, begin_date, end_date, fk_subject, fk_person) VALUES (1, 'Promotion', NULL, 1963, 1, 1);
INSERT INTO Study (pk_study, description, begin_date, end_date, fk_subject, fk_person) VALUES (2, 'Diplom', NULL, NULL, 2, 3);
INSERT INTO Study (pk_study, description, begin_date, end_date, fk_subject, fk_person) VALUES (3, 'Promotion', NULL, 1985, 3, NULL);
INSERT INTO Study (pk_study, description, begin_date, end_date, fk_subject, fk_person) VALUES (4, 'Promotion', NULL, 1966, 4, 6);

-- Table: Subject
CREATE TABLE IF NOT EXISTS Subject (pk_subject PRIMARY KEY NOT NULL, name, fk_place REFERENCES Place (pk_place) NOT NULL, fk_organization REFERENCES Organization (pk_organization));
INSERT INTO Subject (pk_subject, name, fk_place, fk_organization) VALUES (1, 'Chemie', 5, 3);
INSERT INTO Subject (pk_subject, name, fk_place, fk_organization) VALUES (2, 'Angewandte Psychologie', 3, 4);
INSERT INTO Subject (pk_subject, name, fk_place, fk_organization) VALUES (3, 'Orientalische Philologie/Islamwisenschaft, V�lkerkunde, Physiologie', 6, 5);
INSERT INTO Subject (pk_subject, name, fk_place, fk_organization) VALUES (4, 'Theoretische Physik', 8, 8);

-- Table: Workshop
CREATE TABLE IF NOT EXISTS Workshop (pk_workshop PRIMARY KEY NOT NULL, name, description, abstract, date, fk_event REFERENCES Event (pk_event) NOT NULL);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (1, 'Making Cortona', 'Creative Workshop', 'In the last Cortona week it became apparent that we needed', '20.9; 24.9', 11);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (2, 'Gips Masks', 'Experimental Ateliers', NULL, '20.9; 21.9; 22.9;24.9;25.9;26.9', 11);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (4, 'Meditation', 'Morning Workshop', NULL, '20.9; 21.9; 22.9;23.9;24.9;25.9;26.9', 11);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (3, 'Tai-chi', 'Morning Workshop', NULL, '20.9; 21.9; 22.9;23.9;24.9;25.9;26.9', 11);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (6, 'What is life? A dialogue', 'Block 1 Workshop', NULL, '21.9; 24.9', 11);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (5, 'The Web of Life', 'Lecture', NULL, 21.9, 11);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (8, 'Introductory to the Art and Islamic Calligraphy', 'Lecture', NULL, 21.9, 11);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (7, 'Islamic Calligarphy', 'Creative Workshop', NULL, '22.9; 24.9', 11);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (9, 'Non-sense poetry', 'Creative Workshop', NULL, '24.9; 25.9', 11);
INSERT INTO Workshop (pk_workshop, name, description, abstract, date, fk_event) VALUES (10, 'On the Tibetan Visual Art', 'Lecture', NULL, 22.9, 11);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
