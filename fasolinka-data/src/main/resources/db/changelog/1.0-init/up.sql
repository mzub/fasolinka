CREATE TABLE users (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    name varchar(255) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    phone_number varchar(255)
);   
GO
CREATE TABLE addresses (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    post_code varchar(20),
    address_line varchar(255),
    user_id bigint REFERENCES users (id)
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
    description text,
    quantity bigint,
    discount decimal(19,2),
    creation_time timestamp with time zone,
    update_time timestamp with time zone,
    brand_id bigint REFERENCES brands (id)
);
GO
CREATE TABLE brands (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    brand_name varchar(255) UNIQUE NOT NULL
);
GO
CREATE TABLE categories (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(20) UNIQUE NOT NULL,
    description text
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
GO
CREATE TABLE orders (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id bigint REFERENCES users (id),
    total decimal(19,2),
    creation_timestamp timestamp with time zone,
    update_timestamp timestamp with time zone
);
GO
CREATE TABLE order_item (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    product_id bigint REFERENCES products (id),
    quantity integer,
    creation_time timestamp with time zone,
    order_id bigint REFERENCES orders (id)
);
GO
CREATE TYPE delivery_status AS ENUM ('none', 'prepearing', 'ongoing', 'delivered');
GO
CREATE TABLE deliveries (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    status delivery_status,
    delivery_date date,
    order_id bigint REFERENCES orders (id)
);
GO
CREATE TYPE transaction_status AS ENUM (
    'ordered',
    'canceled',
    'pending',
    'declined',
    'rejected',
    'success'
);
GO
CREATE TABLE transactions (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    status transaction_status,
    total decimal(19,2),
    creation_time timestamp with time zone,
    update_time timestamp with time zone,
    order_id bigint REFERENCES orders (id)
); 
