CREATE TABLE IF NOT EXISTS "public"."Users" (
    "Id" serial primary key,
    "Name" text,
    "Email" varchar,
    "Password" bytea
);

CREATE TABLE IF NOT EXISTS "public"."Scripts" (
    "Id" serial primary key,
    "Name" varchar,
    "Desc" text,
    "Author" int4,
    CONSTRAINT "scripts_author_fkey" FOREIGN KEY ("Author") REFERENCES "public"."Users"("Id")
);

