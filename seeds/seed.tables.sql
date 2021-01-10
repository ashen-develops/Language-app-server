BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'admin',
    'Dunder Mifflin Admin',
    -- password = "pass"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'Finnish', 1);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES
  (1, 1, 'Tervetuloa', 'Welcome', 2),
  (2, 1, 'Kyllä', 'Yes', 3),
  (3, 1, 'Yksi', 'One', 4),
  (4, 1, 'Paljon kiitoksia', 'Thank you very much', 5),
  (5, 1, 'Kiitos', 'Thank you', 6),
  (6, 1, 'Hyvää päivää', 'Good day', 7),
  (7, 1, 'Hei', 'Hello', 8),
  (8, 1, 'Näkemiin', 'Goodbye', 9),
  (9, 1, 'Ei', 'No', 10),
  (10, 1, 'Hauska tavata', 'Nice to meet you', 10);


UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
