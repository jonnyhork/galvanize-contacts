SELECT first_name, last_name FROM "User" WHERE date_of_birth >= '2000-01-01' ORDER BY first_name ASC;

SELECT biography FROM "User" WHERE biography LIKE '% man %';

SELECT "User".first_name,"User".last_name, contact.type, contact.value FROM "User" JOIN contact ON "User".id = contact.user_id WHERE "User".id=3;

SELECT first_name FROM "User" WHERE id IN (1,3);

SELECT u.first_name, COUNT(user_id) FROM "User" u JOIN contact c ON u.id = c.user_id GROUP BY first_name;

ALTER TABLE "User"
ADD is_human boolean;

UPDATE "User" SET is_human = true WHERE id IN (1,2,4);

DELETE FROM "User" WHERE is_human = true;

DROP TABLE contact;
