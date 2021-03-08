CREATE TABLE users (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    name varchar(30) UNIQUE NOT NULL,
    password varchar(30) NOT NULL,
    email varchar(30) NOT NULL,
    first_name varchar(20),
    last_name varchar(20),
    phone_number varchar(20)
);   

GO

CREATE TABLE roles (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(20) NOT NULL
);

GO

CREATE TABLE users_roles (
    user_id bigint NOT NULL REFERENCES users (id),
    role_id bigint NOT NULL REFERENCES roles (id)
);

GO

CREATE TABLE products (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title varchar(50) UNIQUE NOT NULL,
    price decimal(19,2) NOT NULL,
    description text 
);

GO

CREATE TABLE categories (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(20) UNIQUE NOT NULL
);

GO

CREATE TABLE products_categories (
    product_id bigint REFERENCES products (id),
    category_id bigint REFERENCES categories (id)
);

GO

CREATE TABLE pictures (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    content_type varchar(25),
    name varchar(255),
    product_id bigint REFERENCES products (id),
    pic_link TEXT 
);

GO

CREATE TABLE small_pictures_data (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    data bytea NOT NULL,
    picture_id bigint NOT NULL REFERENCES pictures (id)
);
