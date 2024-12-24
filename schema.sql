-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS authors_id_seq;

-- Table Definition
CREATE TABLE IF NOT EXISTS "public"."users" (
    "id" int4 NOT NULL DEFAULT nextval('authors_id_seq'::regclass),
    "name" text
);


-- Indices
CREATE UNIQUE INDEX id ON public.users USING btree (id);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS scripts_id_seq;

-- Table Definition
CREATE TABLE IF NOT EXISTS "public"."scripts" (
    "id" int4 NOT NULL DEFAULT nextval('scripts_id_seq'::regclass),
    "name" varchar,
    "desc" text,
    "author" int4,
    CONSTRAINT "scripts_author_fkey" FOREIGN KEY ("author") REFERENCES "public"."users"("id")
);

