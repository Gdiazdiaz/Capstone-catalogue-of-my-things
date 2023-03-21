CREATE TABLE Book(
   publisher text,
   cover_state text
);

CREATE TABLE Label(
   id SERIAL PRIMARY KEY,
   title text,
   color text,
   item_id int REFERENCES item (id)
);