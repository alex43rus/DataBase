BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "People" (
	"id"	INTEGER,
	"Фамилия"	TEXT NOT NULL,
	"Имя"	TEXT NOT NULL,
	"Отчество"	TEXT,
	"Год рождения"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Work" (
	"id"	INTEGER,
	"Должность"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "people_work" (
	"id_peop"	INTEGER,
	"id_work"	INTEGER,
	FOREIGN KEY("id_peop") REFERENCES "People"("id"),
	FOREIGN KEY("id_work") REFERENCES "Work"("id")
);
CREATE TABLE IF NOT EXISTS "Coment_tel" (
	"id"	INTEGER,
	"Комментарий"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Telephone" (
	"id"	INTEGER,
	"id_peop"	INTEGER,
	"Номер телефона"	INTEGER,
	"id_coment"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("id_coment") REFERENCES "Coment_tel"("id"),
	FOREIGN KEY("id_peop") REFERENCES "People"("id")
);
CREATE TABLE IF NOT EXISTS "Comment_adress" (
	"id"	INTEGER,
	"Комментарий"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Adress" (
	"id"	INTEGER,
	"Улица"	TEXT NOT NULL,
	"Дом"	TEXT NOT NULL,
	"Квартира"	TEXT,
	"id_comment"	INTEGER,
	"id_peop"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("id_comment") REFERENCES "Comment_adress"("id"),
	FOREIGN KEY("id_peop") REFERENCES "People"("id")
);
CREATE TABLE IF NOT EXISTS "Invalid" (
	"id_peop"	INTEGER UNIQUE,
	"Статус"	TEXT,
	FOREIGN KEY("id_peop") REFERENCES "People"("id")
);
INSERT INTO "People" VALUES (1,'Иван','Иванов','Иванович',2010);
INSERT INTO "People" VALUES (2,'Петр','Петров','Петрович',2011);
INSERT INTO "People" VALUES (3,'Федор','Федоров','Федорович',2012);
INSERT INTO "People" VALUES (4,'Афанасий','Афанасьев','Афанасьевич',2011);
INSERT INTO "People" VALUES (5,'Григорий','Григорьев','Григорьевич',2000);
INSERT INTO "People" VALUES (6,'Валерий','Валерьев','Валерьевич',1995);
INSERT INTO "Work" VALUES (1,'Директор');
INSERT INTO "Work" VALUES (2,'Менеджер');
INSERT INTO "Work" VALUES (3,'Бухгалтер');
INSERT INTO "Work" VALUES (4,'Исполнитель');
INSERT INTO "people_work" VALUES (1,1);
INSERT INTO "people_work" VALUES (2,4);
INSERT INTO "people_work" VALUES (3,4);
INSERT INTO "people_work" VALUES (5,2);
INSERT INTO "people_work" VALUES (4,2);
INSERT INTO "people_work" VALUES (6,3);
INSERT INTO "people_work" VALUES (1,3);
INSERT INTO "Coment_tel" VALUES (1,'Личный 1');
INSERT INTO "Coment_tel" VALUES (2,'Личный 2');
INSERT INTO "Coment_tel" VALUES (3,'Рабочий');
INSERT INTO "Telephone" VALUES (1,1,123,1);
INSERT INTO "Telephone" VALUES (2,2,234,1);
INSERT INTO "Telephone" VALUES (3,3,345,2);
INSERT INTO "Telephone" VALUES (4,4,567,1);
INSERT INTO "Telephone" VALUES (5,5,678,2);
INSERT INTO "Telephone" VALUES (6,6,321,1);
INSERT INTO "Telephone" VALUES (7,1,654,2);
INSERT INTO "Telephone" VALUES (8,1,876,3);
INSERT INTO "Comment_adress" VALUES (1,'прописан');
INSERT INTO "Comment_adress" VALUES (2,'проживает');
INSERT INTO "Adress" VALUES (1,'Ленина','15','1',1,1);
INSERT INTO "Adress" VALUES (2,'Большевиков','23','6',1,6);
INSERT INTO "Adress" VALUES (3,'Воровского','35','4',2,5);
INSERT INTO "Adress" VALUES (4,'Московская','41','7',2,4);
INSERT INTO "Adress" VALUES (5,'Ульяновская','21','11',2,3);
INSERT INTO "Adress" VALUES (6,'Казанская','34','Null',2,2);
INSERT INTO "Adress" VALUES (7,'Спасская','18','78',2,1);
INSERT INTO "Invalid" VALUES (1,'Инвалид');
INSERT INTO "Invalid" VALUES (6,'Инвалид');
COMMIT;
