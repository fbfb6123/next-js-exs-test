-- CreateEnum
CREATE TYPE "Status" AS ENUM ('RELEASE', 'PRIVATE');

-- CreateEnum
CREATE TYPE "PublicationStatus" AS ENUM ('RELEASE', 'PRIVATE', 'ARCHIVE');

-- CreateTable
CREATE TABLE "stores" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255),
    "acsess" TEXT,
    "business_time" TEXT,
    "payment" TEXT,
    "parking" TEXT,
    "reservation" TEXT,
    "official_link" TEXT,
    "longitude" DOUBLE PRECISION,
    "latitude" DOUBLE PRECISION,
    "chain_store_id" INTEGER NOT NULL DEFAULT 0,
    "gender_id" INTEGER NOT NULL,
    "prefecture_id" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL,
    "station_id" INTEGER NOT NULL,
    "status" "PublicationStatus" NOT NULL DEFAULT 'PRIVATE',
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "stores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "genders" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,

    CONSTRAINT "genders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "point_texts" (
    "id" SERIAL NOT NULL,
    "content" VARCHAR(255) NOT NULL,
    "order" INTEGER NOT NULL,
    "store_id" INTEGER NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "status" "PublicationStatus" NOT NULL DEFAULT 'PRIVATE',
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "point_texts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "introduction_texts" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "store_id" INTEGER NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "status" "PublicationStatus" NOT NULL DEFAULT 'PRIVATE',
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "introduction_texts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "courses" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "description" TEXT,
    "price" INTEGER,
    "order" INTEGER NOT NULL,
    "store_id" INTEGER NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "status" "PublicationStatus" NOT NULL DEFAULT 'PRIVATE',
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "courses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "images" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "store_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "images_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chain_stores" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "gender_id" INTEGER NOT NULL,
    "status" "PublicationStatus" NOT NULL DEFAULT 'PRIVATE',
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "chain_stores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "prefectures" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,

    CONSTRAINT "prefectures_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cities" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "prefecture_id" INTEGER NOT NULL,

    CONSTRAINT "cities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stations" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "line_id" INTEGER NOT NULL,
    "redirect_id" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "status" "Status" NOT NULL DEFAULT 'RELEASE',

    CONSTRAINT "stations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "station_stores" (
    "id" SERIAL NOT NULL,
    "station_id" INTEGER NOT NULL,
    "store_id" INTEGER NOT NULL,
    "walk_time" INTEGER,
    "walk_distance" INTEGER,

    CONSTRAINT "station_stores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lines" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,

    CONSTRAINT "lines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "affiliates" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "price" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "image_url" TEXT,
    "status" "PublicationStatus" NOT NULL DEFAULT 'PRIVATE',
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "affiliates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "affiliate_stores" (
    "id" SERIAL NOT NULL,
    "affiliate_id" INTEGER NOT NULL,
    "store_id" INTEGER NOT NULL,
    "position_type" INTEGER NOT NULL,
    "is_force_flag" BOOLEAN NOT NULL DEFAULT false,
    "status" "PublicationStatus" NOT NULL DEFAULT 'PRIVATE',
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "affiliate_stores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "affiliate_top_banners" (
    "id" SERIAL NOT NULL,
    "affiliate_id" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,
    "status" "PublicationStatus" NOT NULL DEFAULT 'PRIVATE',
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "affiliate_top_banners_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "stores_prefecture_id_idx" ON "stores"("prefecture_id");

-- CreateIndex
CREATE INDEX "stores_city_id_idx" ON "stores"("city_id");

-- CreateIndex
CREATE INDEX "stores_station_id_idx" ON "stores"("station_id");

-- CreateIndex
CREATE INDEX "stores_chain_store_id_idx" ON "stores"("chain_store_id");

-- CreateIndex
CREATE INDEX "point_texts_store_id_idx" ON "point_texts"("store_id");

-- CreateIndex
CREATE INDEX "introduction_texts_store_id_idx" ON "introduction_texts"("store_id");

-- CreateIndex
CREATE INDEX "courses_store_id_idx" ON "courses"("store_id");

-- CreateIndex
CREATE INDEX "images_store_id_idx" ON "images"("store_id");

-- CreateIndex
CREATE INDEX "cities_prefecture_id_idx" ON "cities"("prefecture_id");

-- CreateIndex
CREATE INDEX "stations_city_id_idx" ON "stations"("city_id");

-- CreateIndex
CREATE INDEX "stations_line_id_idx" ON "stations"("line_id");

-- CreateIndex
CREATE INDEX "station_stores_station_id_idx" ON "station_stores"("station_id");

-- CreateIndex
CREATE INDEX "station_stores_store_id_idx" ON "station_stores"("store_id");

-- CreateIndex
CREATE INDEX "affiliate_stores_affiliate_id_idx" ON "affiliate_stores"("affiliate_id");

-- CreateIndex
CREATE INDEX "affiliate_stores_store_id_idx" ON "affiliate_stores"("store_id");

-- CreateIndex
CREATE INDEX "affiliate_top_banners_affiliate_id_idx" ON "affiliate_top_banners"("affiliate_id");
