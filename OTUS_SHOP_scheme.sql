CREATE SCHEMA "otus_shop";

CREATE TYPE "otus_shop"."order_status" AS ENUM (
  'created',
  'processing',
  'completed',
  'removed'
);

CREATE TABLE "otus_shop"."posts" (
  "id" SERIAL PRIMARY KEY,
  "user_id" numeric NOT NULL,
  "tag" text,
  "content" text NOT NULL,
  "created_at" datetime,
  "likes_count" numeric
);

CREATE TABLE "otus_shop"."users" (
  "id" SERIAL PRIMARY KEY,
  "login" varchar2 UNIQUE NOT NULL,
  "password" varchar2 NOT NULL,
  "email" varchar2 UNIQUE NOT NULL,
  "fullname" varchar2,
  "phone" varchar2
);

CREATE TABLE "otus_shop"."roles" (
  "id" SERIAL PRIMARY KEY,
  "role_name" varchar2 UNIQUE NOT NULL
);

CREATE TABLE "otus_shop"."likes" (
  "id" SERIAL PRIMARY KEY,
  "user_id" numeric NOT NULL,
  "post_id" numeric,
  "comment_id" numeric
);

CREATE TABLE "otus_shop"."comments" (
  "id" SERIAL PRIMARY KEY,
  "user_id" numeric,
  "post_id" numeric,
  "content" text NOT NULL,
  "created_at" datetime,
  "likes_count" numeric
);

CREATE TABLE "otus_shop"."products" (
  "id" SERIAL PRIMARY KEY,
  "product_category" numeric,
  "name" varchar2 NOT NULL,
  "description" varchar2,
  "price" decimal
);

CREATE TABLE "otus_shop"."product_category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar2 UNIQUE NOT NULL
);

CREATE TABLE "otus_shop"."orders" (
  "id" SERIAL PRIMARY KEY,
  "user_id" numeric,
  "created_at" datetime,
  "status" order_status,
  "price" decimal
);

CREATE TABLE "otus_shop"."orders_products" (
  "order_id" numeric,
  "product_id" numeric,
  PRIMARY KEY ("order_id", "product_id")
);

CREATE TABLE "otus_shop"."users_roles" (
  "user_id" numeric,
  "role_id" numeric,
  PRIMARY KEY ("user_id", "role_id")
);

CREATE INDEX "POST_LIKES_IDX" ON "otus_shop"."likes" ("post_id");

CREATE INDEX "COMMENT_LIKES_IDX" ON "otus_shop"."likes" ("comment_id");

CREATE INDEX "PRODUCT_CATEGORY_IDX" ON "otus_shop"."products" ("product_category");

COMMENT ON TABLE "otus_shop"."posts" IS 'Таблица "Публикация"';

COMMENT ON COLUMN "otus_shop"."posts"."id" IS 'Уникальный идентификатор публикации';

COMMENT ON COLUMN "otus_shop"."posts"."user_id" IS 'Уникальный идентификатор пользователя';

COMMENT ON COLUMN "otus_shop"."posts"."tag" IS 'Тег публикации';

COMMENT ON COLUMN "otus_shop"."posts"."content" IS 'Текст публикации';

COMMENT ON COLUMN "otus_shop"."posts"."created_at" IS 'Дата создания публикации';

COMMENT ON COLUMN "otus_shop"."posts"."likes_count" IS 'Количество отметок "Нравится" публикации';

COMMENT ON TABLE "otus_shop"."users" IS 'Таблица "Пользователи"';

COMMENT ON COLUMN "otus_shop"."users"."id" IS 'Уникальный идентифатор пользователя';

COMMENT ON COLUMN "otus_shop"."users"."login" IS 'Уникальный логин пользователя';

COMMENT ON COLUMN "otus_shop"."users"."password" IS 'Зашифрованный пароль пользователя';

COMMENT ON COLUMN "otus_shop"."users"."email" IS 'Уникальная электронная почта пользователя';

COMMENT ON COLUMN "otus_shop"."users"."fullname" IS 'ФИО пользователя';

COMMENT ON COLUMN "otus_shop"."users"."phone" IS 'Номер телефона пользователя';

COMMENT ON TABLE "otus_shop"."roles" IS 'Связующая таблица "Роли"';

COMMENT ON COLUMN "otus_shop"."roles"."id" IS 'Уникальный идентифатор роли';

COMMENT ON COLUMN "otus_shop"."roles"."role_name" IS 'Уникальное наименование роли';

COMMENT ON TABLE "otus_shop"."likes" IS 'Таблица "Отметки "Нравится""';

COMMENT ON COLUMN "otus_shop"."likes"."id" IS 'Уникальный идентификатор отметки "Нравится"';

COMMENT ON COLUMN "otus_shop"."likes"."user_id" IS 'Идентификатор пользователя';

COMMENT ON COLUMN "otus_shop"."likes"."post_id" IS 'Идентификатор публикации';

COMMENT ON COLUMN "otus_shop"."likes"."comment_id" IS 'Идентификатор комментария';

COMMENT ON TABLE "otus_shop"."comments" IS 'Таблица "Комментарии"';

COMMENT ON COLUMN "otus_shop"."comments"."id" IS 'Уникальный идентифатор коментария';

COMMENT ON COLUMN "otus_shop"."comments"."user_id" IS 'Идентификатор пользователя';

COMMENT ON COLUMN "otus_shop"."comments"."post_id" IS 'Идентификатор публикации';

COMMENT ON COLUMN "otus_shop"."comments"."content" IS 'Текст комментария';

COMMENT ON COLUMN "otus_shop"."comments"."created_at" IS 'Дата и время создания комментария';

COMMENT ON COLUMN "otus_shop"."comments"."likes_count" IS 'Количество отметок "Нравится" комментария';

COMMENT ON TABLE "otus_shop"."products" IS 'Таблица "Продукты"';

COMMENT ON COLUMN "otus_shop"."products"."id" IS 'Уникальный идентифатор продукта';

COMMENT ON COLUMN "otus_shop"."products"."product_category" IS 'Категория продукта';

COMMENT ON COLUMN "otus_shop"."products"."name" IS 'Уникальное наименование продукта';

COMMENT ON COLUMN "otus_shop"."products"."description" IS 'Описание товара';

COMMENT ON COLUMN "otus_shop"."products"."price" IS 'Цена продукта';

COMMENT ON TABLE "otus_shop"."product_category" IS 'Таблица "Категории продуктов"';

COMMENT ON COLUMN "otus_shop"."product_category"."id" IS 'Уникальный идентифатор категории продуктов';

COMMENT ON COLUMN "otus_shop"."product_category"."name" IS 'Уникальное наименование категории продуктов';

COMMENT ON TABLE "otus_shop"."orders" IS 'Таблица "Заказы"';

COMMENT ON COLUMN "otus_shop"."orders"."id" IS 'Уникальный идентифатор заказа';

COMMENT ON COLUMN "otus_shop"."orders"."user_id" IS 'Идентификатор пользователя';

COMMENT ON COLUMN "otus_shop"."orders"."created_at" IS 'Дата создания заказа';

COMMENT ON COLUMN "otus_shop"."orders"."status" IS 'Статус заказа';

COMMENT ON COLUMN "otus_shop"."orders"."price" IS 'Сумма заказа';

COMMENT ON TABLE "otus_shop"."orders_products" IS 'Связующая таблица "Заказы-Продукты"';

COMMENT ON COLUMN "otus_shop"."orders_products"."order_id" IS 'Идентификатор заказа';

COMMENT ON COLUMN "otus_shop"."orders_products"."product_id" IS 'Идентификатор продукта';

COMMENT ON TABLE "otus_shop"."users_roles" IS 'Связующая таблица "Пользователи-Роли"';

COMMENT ON COLUMN "otus_shop"."users_roles"."user_id" IS 'Идентификатор пользователя';

COMMENT ON COLUMN "otus_shop"."users_roles"."role_id" IS 'Идентификатор роли';

ALTER TABLE "otus_shop"."orders" ADD FOREIGN KEY ("user_id") REFERENCES "otus_shop"."users" ("id");

ALTER TABLE "otus_shop"."comments" ADD FOREIGN KEY ("id") REFERENCES "otus_shop"."users" ("id");

ALTER TABLE "otus_shop"."posts" ADD FOREIGN KEY ("user_id") REFERENCES "otus_shop"."users" ("id");

ALTER TABLE "otus_shop"."comments" ADD FOREIGN KEY ("post_id") REFERENCES "otus_shop"."posts" ("id");

ALTER TABLE "otus_shop"."orders_products" ADD FOREIGN KEY ("product_id") REFERENCES "otus_shop"."products" ("id");

ALTER TABLE "otus_shop"."orders_products" ADD FOREIGN KEY ("order_id") REFERENCES "otus_shop"."orders" ("id");

ALTER TABLE "otus_shop"."users_roles" ADD FOREIGN KEY ("role_id") REFERENCES "otus_shop"."roles" ("id");

ALTER TABLE "otus_shop"."users_roles" ADD FOREIGN KEY ("user_id") REFERENCES "otus_shop"."users" ("id");

ALTER TABLE "otus_shop"."products" ADD FOREIGN KEY ("product_category") REFERENCES "otus_shop"."product_category" ("id");

ALTER TABLE "otus_shop"."likes" ADD FOREIGN KEY ("user_id") REFERENCES "otus_shop"."users" ("id");

ALTER TABLE "otus_shop"."likes" ADD FOREIGN KEY ("post_id") REFERENCES "otus_shop"."posts" ("id");

ALTER TABLE "otus_shop"."likes" ADD FOREIGN KEY ("comment_id") REFERENCES "otus_shop"."comments" ("id");
