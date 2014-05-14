PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "event_type" (
    "id" INTEGER PRIMARY KEY NOT NULL,
    "title" TEXT NOT NULL
);
INSERT INTO "event_type" VALUES(1,'Важная встреча');
INSERT INTO "event_type" VALUES(2,'Неформальная обстановка');
INSERT INTO "event_type" VALUES(3,'Работа с документами');
INSERT INTO "event_type" VALUES(4,'Переговоры с клиентом');
INSERT INTO "event_type" VALUES(5,'Показ квартиры');
CREATE TABLE "role" (
    "id" INTEGER PRIMARY KEY NOT NULL,
    "title" TEXT NOT NULL
);
INSERT INTO "role" VALUES(1,'Покупатель');
INSERT INTO "role" VALUES(2,'Свидетель');
INSERT INTO "role" VALUES(3,'Клиент');
CREATE TABLE "deal_state" (
    "id" INTEGER PRIMARY KEY NOT NULL,
    "title" TEXT NOT NULL
);
INSERT INTO "deal_state" VALUES(1,'В процессе');
INSERT INTO "deal_state" VALUES(2,'Отложена');
INSERT INTO "deal_state" VALUES(3,'Неудача');
INSERT INTO "deal_state" VALUES(4,'Удача');
CREATE TABLE "deal_contact_mult" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
    "id_contact" INTEGER NOT NULL,
    "id_role" INTEGER NOT NULL,
    "id_deal" INTEGER NOT NULL
);
INSERT INTO "deal_contact_mult" VALUES(1,1,1,1);
CREATE TABLE [deal] ([id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, [min_price] INTEGER NOT NULL, [price] INTEGER NOT NULL, [max_price] INTEGER NOT NULL, [state_key] INTEGER NOT NULL, [flatAdress] VARCHAR (200), [dateTrade] DATETIME);
INSERT INTO "deal" VALUES(1,100,-1,200,1,'"Комсомольский"','28.04.2013 01:30');
INSERT INTO "deal" VALUES(2,100,123,500,1,'Адрес2','04.04.2013 13:10');
INSERT INTO "deal" VALUES(3,1,2,3,1,'Хороший','23.03.2001 09:09');
CREATE TABLE [contact_type] ([id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, [title] TEXT NOT NULL);
INSERT INTO "contact_type" VALUES(1,'Важный');
INSERT INTO "contact_type" VALUES(2,'Неважный');
CREATE TABLE [contact] ([id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, [name] TEXT NOT NULL, [surname] TEXT NOT NULL, [additional_info] TEXT NOT NULL, [phone_number] VARCHAR (20), [type_id] INTEGER NOT NULL);
INSERT INTO "contact" VALUES(1,'Иван','Иванов','Казел. Нормальный парнеь.','90132',1);
INSERT INTO "contact" VALUES(2,'Анатолий','Смолянинов','Php, С - программист. Emacs Lisp. ','8923392111',1);
INSERT INTO "contact" VALUES(3,'Иван','Иванов','фывафыафыва','909999',2);
CREATE TABLE "event_contact_mult" ("id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE , "id_contact" INTEGER, "id_role" INTEGER, "id_event" INTEGER);
INSERT INTO "event_contact_mult" VALUES(1,1,1,1);
INSERT INTO "event_contact_mult" VALUES(2,2,2,1);
CREATE TABLE "event" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,"title" TEXT NOT NULL ,"date" DATETIME NOT NULL  DEFAULT (null) ,"place" TEXT NOT NULL ,"deal_id" INTEGER NOT NULL ,"type_id" INTEGER NOT NULL );
INSERT INTO "event" VALUES(1,'Шоколад не в чем не виноват.','21.01.2013 03:30','Улица Сталеваров',1,3);
INSERT INTO "event" VALUES(2,'Не получилось','03.05.2014 18:54','На берегу травы.',1,4);
INSERT INTO "event" VALUES(2,'Не фортануло','04.05.2014 18:54','На поляне реки.',1,2);
INSERT INTO "event" VALUES(2,'оуоуоуоу','05.05.2014 18:54','На поляне травы.',1,1);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('event_contact_mult',2);
COMMIT;
