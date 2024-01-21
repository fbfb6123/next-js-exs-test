create type "public"."PublicationStatus" as enum ('RELEASE', 'PRIVATE', 'ARCHIVE');

create type "public"."Status" as enum ('RELEASE', 'PRIVATE');

create sequence "public"."affiliate_stores_id_seq";

create sequence "public"."affiliate_top_banners_id_seq";

create sequence "public"."affiliates_id_seq";

create sequence "public"."chain_stores_id_seq";

create sequence "public"."cities_id_seq";

create sequence "public"."courses_id_seq";

create sequence "public"."genders_id_seq";

create sequence "public"."images_id_seq";

create sequence "public"."introduction_texts_id_seq";

create sequence "public"."lines_id_seq";

create sequence "public"."point_texts_id_seq";

create sequence "public"."prefectures_id_seq";

create sequence "public"."station_stores_id_seq";

create sequence "public"."stations_id_seq";

create sequence "public"."stores_id_seq";

create table "public"."_prisma_migrations" (
    "id" character varying(36) not null,
    "checksum" character varying(64) not null,
    "finished_at" timestamp with time zone,
    "migration_name" character varying(255) not null,
    "logs" text,
    "rolled_back_at" timestamp with time zone,
    "started_at" timestamp with time zone not null default now(),
    "applied_steps_count" integer not null default 0
);


create table "public"."affiliate_stores" (
    "id" integer not null default nextval('affiliate_stores_id_seq'::regclass),
    "affiliate_id" integer not null,
    "store_id" integer not null,
    "position_type" integer not null,
    "is_force_flag" boolean not null default false,
    "status" "PublicationStatus" not null default 'PRIVATE'::"PublicationStatus",
    "start_date" timestamp(3) without time zone not null,
    "end_date" timestamp(3) without time zone not null,
    "created_at" timestamp(3) without time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp(3) without time zone
);


create table "public"."affiliate_top_banners" (
    "id" integer not null default nextval('affiliate_top_banners_id_seq'::regclass),
    "affiliate_id" integer not null,
    "order" integer not null,
    "status" "PublicationStatus" not null default 'PRIVATE'::"PublicationStatus",
    "start_date" timestamp(3) without time zone not null,
    "end_date" timestamp(3) without time zone not null,
    "created_at" timestamp(3) without time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp(3) without time zone
);


create table "public"."affiliates" (
    "id" integer not null default nextval('affiliates_id_seq'::regclass),
    "name" character varying(255) not null,
    "description" text,
    "price" integer not null,
    "url" text not null,
    "image_url" text,
    "status" "PublicationStatus" not null default 'PRIVATE'::"PublicationStatus",
    "created_at" timestamp(3) without time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp(3) without time zone
);


create table "public"."chain_stores" (
    "id" integer not null default nextval('chain_stores_id_seq'::regclass),
    "name" character varying(255) not null,
    "gender_id" integer not null,
    "status" "PublicationStatus" not null default 'PRIVATE'::"PublicationStatus",
    "created_at" timestamp(3) without time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp(3) without time zone
);


create table "public"."cities" (
    "id" integer not null default nextval('cities_id_seq'::regclass),
    "name" character varying(255) not null,
    "prefecture_id" integer not null
);


create table "public"."courses" (
    "id" integer not null default nextval('courses_id_seq'::regclass),
    "name" text,
    "description" text,
    "price" integer,
    "order" integer not null,
    "store_id" integer not null,
    "start_date" timestamp(3) without time zone not null,
    "end_date" timestamp(3) without time zone not null,
    "status" "PublicationStatus" not null default 'PRIVATE'::"PublicationStatus",
    "created_at" timestamp(3) without time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp(3) without time zone
);


create table "public"."genders" (
    "id" integer not null default nextval('genders_id_seq'::regclass),
    "name" character varying(255) not null
);


create table "public"."images" (
    "id" integer not null default nextval('images_id_seq'::regclass),
    "url" text not null,
    "order" integer not null,
    "store_id" integer not null,
    "created_at" timestamp(3) without time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp(3) without time zone
);


create table "public"."introduction_texts" (
    "id" integer not null default nextval('introduction_texts_id_seq'::regclass),
    "title" text not null,
    "content" text not null,
    "order" integer not null,
    "store_id" integer not null,
    "start_date" timestamp(3) without time zone not null,
    "end_date" timestamp(3) without time zone not null,
    "status" "PublicationStatus" not null default 'PRIVATE'::"PublicationStatus",
    "created_at" timestamp(3) without time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp(3) without time zone
);


create table "public"."lines" (
    "id" integer not null default nextval('lines_id_seq'::regclass),
    "name" character varying(255) not null
);


create table "public"."point_texts" (
    "id" integer not null default nextval('point_texts_id_seq'::regclass),
    "content" character varying(255) not null,
    "order" integer not null,
    "store_id" integer not null,
    "start_date" timestamp(3) without time zone not null,
    "end_date" timestamp(3) without time zone not null,
    "status" "PublicationStatus" not null default 'PRIVATE'::"PublicationStatus",
    "created_at" timestamp(3) without time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp(3) without time zone
);


create table "public"."prefectures" (
    "id" integer not null default nextval('prefectures_id_seq'::regclass),
    "name" character varying(255) not null
);


create table "public"."station_stores" (
    "id" integer not null default nextval('station_stores_id_seq'::regclass),
    "station_id" integer not null,
    "store_id" integer not null,
    "walk_time" integer,
    "walk_distance" integer
);


create table "public"."stations" (
    "id" integer not null default nextval('stations_id_seq'::regclass),
    "name" character varying(255) not null,
    "line_id" integer not null,
    "redirect_id" integer not null,
    "city_id" integer not null,
    "longitude" double precision not null,
    "latitude" double precision not null,
    "status" "Status" not null default 'RELEASE'::"Status"
);


create table "public"."stores" (
    "id" integer not null default nextval('stores_id_seq'::regclass),
    "name" character varying(255) not null,
    "address" character varying(255),
    "acsess" text,
    "business_time" text,
    "payment" text,
    "parking" text,
    "reservation" text,
    "official_link" text,
    "longitude" double precision,
    "latitude" double precision,
    "chain_store_id" integer not null default 0,
    "gender_id" integer not null,
    "prefecture_id" integer not null,
    "city_id" integer not null,
    "station_id" integer not null,
    "status" "PublicationStatus" not null default 'PRIVATE'::"PublicationStatus",
    "created_at" timestamp(3) without time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp(3) without time zone
);


alter sequence "public"."affiliate_stores_id_seq" owned by "public"."affiliate_stores"."id";

alter sequence "public"."affiliate_top_banners_id_seq" owned by "public"."affiliate_top_banners"."id";

alter sequence "public"."affiliates_id_seq" owned by "public"."affiliates"."id";

alter sequence "public"."chain_stores_id_seq" owned by "public"."chain_stores"."id";

alter sequence "public"."cities_id_seq" owned by "public"."cities"."id";

alter sequence "public"."courses_id_seq" owned by "public"."courses"."id";

alter sequence "public"."genders_id_seq" owned by "public"."genders"."id";

alter sequence "public"."images_id_seq" owned by "public"."images"."id";

alter sequence "public"."introduction_texts_id_seq" owned by "public"."introduction_texts"."id";

alter sequence "public"."lines_id_seq" owned by "public"."lines"."id";

alter sequence "public"."point_texts_id_seq" owned by "public"."point_texts"."id";

alter sequence "public"."prefectures_id_seq" owned by "public"."prefectures"."id";

alter sequence "public"."station_stores_id_seq" owned by "public"."station_stores"."id";

alter sequence "public"."stations_id_seq" owned by "public"."stations"."id";

alter sequence "public"."stores_id_seq" owned by "public"."stores"."id";

CREATE UNIQUE INDEX _prisma_migrations_pkey ON public._prisma_migrations USING btree (id);

CREATE INDEX affiliate_stores_affiliate_id_idx ON public.affiliate_stores USING btree (affiliate_id);

CREATE UNIQUE INDEX affiliate_stores_pkey ON public.affiliate_stores USING btree (id);

CREATE INDEX affiliate_stores_store_id_idx ON public.affiliate_stores USING btree (store_id);

CREATE INDEX affiliate_top_banners_affiliate_id_idx ON public.affiliate_top_banners USING btree (affiliate_id);

CREATE UNIQUE INDEX affiliate_top_banners_pkey ON public.affiliate_top_banners USING btree (id);

CREATE UNIQUE INDEX affiliates_pkey ON public.affiliates USING btree (id);

CREATE UNIQUE INDEX chain_stores_pkey ON public.chain_stores USING btree (id);

CREATE UNIQUE INDEX cities_pkey ON public.cities USING btree (id);

CREATE INDEX cities_prefecture_id_idx ON public.cities USING btree (prefecture_id);

CREATE UNIQUE INDEX courses_pkey ON public.courses USING btree (id);

CREATE INDEX courses_store_id_idx ON public.courses USING btree (store_id);

CREATE UNIQUE INDEX genders_pkey ON public.genders USING btree (id);

CREATE UNIQUE INDEX images_pkey ON public.images USING btree (id);

CREATE INDEX images_store_id_idx ON public.images USING btree (store_id);

CREATE UNIQUE INDEX introduction_texts_pkey ON public.introduction_texts USING btree (id);

CREATE INDEX introduction_texts_store_id_idx ON public.introduction_texts USING btree (store_id);

CREATE UNIQUE INDEX lines_pkey ON public.lines USING btree (id);

CREATE UNIQUE INDEX point_texts_pkey ON public.point_texts USING btree (id);

CREATE INDEX point_texts_store_id_idx ON public.point_texts USING btree (store_id);

CREATE UNIQUE INDEX prefectures_pkey ON public.prefectures USING btree (id);

CREATE UNIQUE INDEX station_stores_pkey ON public.station_stores USING btree (id);

CREATE INDEX station_stores_station_id_idx ON public.station_stores USING btree (station_id);

CREATE INDEX station_stores_store_id_idx ON public.station_stores USING btree (store_id);

CREATE INDEX stations_city_id_idx ON public.stations USING btree (city_id);

CREATE INDEX stations_line_id_idx ON public.stations USING btree (line_id);

CREATE UNIQUE INDEX stations_pkey ON public.stations USING btree (id);

CREATE INDEX stores_chain_store_id_idx ON public.stores USING btree (chain_store_id);

CREATE INDEX stores_city_id_idx ON public.stores USING btree (city_id);

CREATE UNIQUE INDEX stores_pkey ON public.stores USING btree (id);

CREATE INDEX stores_prefecture_id_idx ON public.stores USING btree (prefecture_id);

CREATE INDEX stores_station_id_idx ON public.stores USING btree (station_id);

alter table "public"."_prisma_migrations" add constraint "_prisma_migrations_pkey" PRIMARY KEY using index "_prisma_migrations_pkey";

alter table "public"."affiliate_stores" add constraint "affiliate_stores_pkey" PRIMARY KEY using index "affiliate_stores_pkey";

alter table "public"."affiliate_top_banners" add constraint "affiliate_top_banners_pkey" PRIMARY KEY using index "affiliate_top_banners_pkey";

alter table "public"."affiliates" add constraint "affiliates_pkey" PRIMARY KEY using index "affiliates_pkey";

alter table "public"."chain_stores" add constraint "chain_stores_pkey" PRIMARY KEY using index "chain_stores_pkey";

alter table "public"."cities" add constraint "cities_pkey" PRIMARY KEY using index "cities_pkey";

alter table "public"."courses" add constraint "courses_pkey" PRIMARY KEY using index "courses_pkey";

alter table "public"."genders" add constraint "genders_pkey" PRIMARY KEY using index "genders_pkey";

alter table "public"."images" add constraint "images_pkey" PRIMARY KEY using index "images_pkey";

alter table "public"."introduction_texts" add constraint "introduction_texts_pkey" PRIMARY KEY using index "introduction_texts_pkey";

alter table "public"."lines" add constraint "lines_pkey" PRIMARY KEY using index "lines_pkey";

alter table "public"."point_texts" add constraint "point_texts_pkey" PRIMARY KEY using index "point_texts_pkey";

alter table "public"."prefectures" add constraint "prefectures_pkey" PRIMARY KEY using index "prefectures_pkey";

alter table "public"."station_stores" add constraint "station_stores_pkey" PRIMARY KEY using index "station_stores_pkey";

alter table "public"."stations" add constraint "stations_pkey" PRIMARY KEY using index "stations_pkey";

alter table "public"."stores" add constraint "stores_pkey" PRIMARY KEY using index "stores_pkey";


