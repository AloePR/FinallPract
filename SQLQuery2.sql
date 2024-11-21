create database shopelec;

-- Таблица пользователей
CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    login VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('ADMIN', 'USER', 'WAREHOUSE')) NOT NULL
);
SELECT * FROM Users;

-- Таблица категорий товаров
CREATE TABLE Categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Таблица товаров
CREATE TABLE Products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,	
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE SET NULL
);

-- Таблица заказов
CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    delivery_address VARCHAR(255) NOT NULL,
    amount VARCHAR(50) NOT NULL
);
INSERT INTO Orders (customer_name, product_name, delivery_address, amount) VALUES
('John Doe', 'Laptop', '1234 Elm Street, Springfield, IL', '1200.50'),
('Jane Smith', 'Smartphone', '5678 Oak Avenue, Metropolis, NY', '899.99'),
('Alice Johnson', 'Headphones', '9101 Pine Road, Rivertown, CA', '150.00'),
('Bob Brown', 'Smartwatch', '2345 Maple Lane, Lakeside, TX', '199.99'),
('Charlie Davis', 'Tablet', '6789 Cedar Blvd, Hilltop, FL', '350.00');


Drop table Orders;

	Select *from Orders;

Drop table Orders;
-- Таблица элементов заказов
CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    patronymic VARCHAR(50), -- Отчество
    work_address VARCHAR(255) NOT NULL
);
INSERT INTO Employees (first_name, last_name, patronymic, work_address) VALUES
('Иван', 'Иванов', 'Иванович', 'Москва, ул. Ленина, 1'),
('Петр', 'Петров', 'Петрович', 'Санкт-Петербург, ул. Невский, 2'),
('Сергей', 'Сергеев', 'Сергеевич', 'Новосибирск, ул. Красный проспект, 3'),
('Анна', 'Аннаева', 'Александровна', 'Екатеринбург, ул. Победы, 4'),
('Мария', 'Мариева', 'Владимировна', 'Казань, ул. Баумана, 5'),
('Олег', 'Олегов', 'Олегович', 'Ростов-на-Дону, пр. Стачки, 6'),
('Юлия', 'Юлиева', 'Сергеевна', 'Владивосток, ул. Русская, 7'),
('Дмитрий', 'Дмитриев', 'Дмитриевич', 'Красноярск, ул. Мира, 8'),
('Татьяна', 'Татеева', 'Дмитриевна', 'Уфа, ул. Ленина, 9'),
('Александр', 'Александров', 'Александрович', 'Сочи, ул. Черноморская, 10');

-- Таблица поставщиков
CREATE TABLE Suppliers (
    supplier_id INT IDENTITY(1,1) PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255),
    address VARCHAR(255)
);
INSERT INTO Suppliers (supplier_name, contact_info, address)
VALUES
('ABC Supplies', '123-456-7890, abc@example.com', '123 Supplier St, Cityville, State, 12345'),
('XYZ Distributors', '987-654-3210, xyz@example.com', '456 Distribution Rd, Townville, State, 67890'),
('Global Trading Co.', '555-123-9876, contact@globaltrading.com', '789 Global Blvd, Metropolis, State, 54321'),
('Fast Goods Ltd.', '333-444-5555, support@fastgoods.com', '101 Fast Ln, Quicktown, State, 11223'),
('Techno Supplier', '222-333-4444, info@technosupplier.com', '202 Tech St, Innovate City, State, 33445');


CREATE TABLE Warehouse (
    warehouse_id INT IDENTITY(1,1) PRIMARY KEY,    -- Уникальный идентификатор склада
    warehouse_name VARCHAR(100) NOT NULL,           -- Название склада
    warehouse_location VARCHAR(255) NOT NULL        -- Расположение склада
);
CREATE TABLE warehouse_inventory (
    inventory_id INT IDENTITY(1,1) PRIMARY KEY,    -- Уникальный идентификатор инвентаря
    available_space INT NOT NULL,                   -- Доступное пространство на складе
    total_space INT NOT NULL,                       -- Общий объем склада
    warehouse_id INT NOT NULL,                      -- Внешний ключ на склад
    CONSTRAINT fk_warehouse FOREIGN KEY (warehouse_id) 
        REFERENCES Warehouse (warehouse_id) 
        ON DELETE CASCADE                          -- Связь с таблицей Warehouse
);
drop table WarehouseInventory;

INSERT INTO Warehouse (warehouse_name, warehouse_location)
VALUES
    ('Склад 4', 'Москва, ул. Технопарк, 12'),
    ('Склад 5', 'Санкт-Петербург, ул. Индустриальная, 34'),
    ('Склад 6', 'Екатеринбург, ул. Ленина, 56');

	INSERT INTO warehouse_inventory (available_space, total_space, warehouse_id)
VALUES
    (500, 1000, 1),  -- Для склада 1
    (300, 800, 2),   -- Для склада 2
    (200, 500, 3);   -- Для склада 3

Select *from Products;
Drop table Products;

INSERT INTO Users (login, password, role) VALUES
('admin', 'admin', 'ADMIN'),
('User', 'user', 'USER'),
('warehouse', 'warehouse', 'WAREHOUSE')

INSERT INTO Categories (category_name)
VALUES
    ('Электроника'),
    ('Одежда'),
    ('Продукты'),
    ('Книги'),
    ('Товары для дома'),
    ('Игрушки'),
    ('Спортивные товары'),
    ('Красота и здоровье'),
    ('Автотовары'),
    ('Мебель');

-- Заполнение таблицы Products
	INSERT INTO Products (name, description, price, stock_quantity, category_id) VALUES
	('Смартфон', 'Современный смартфон с AMOLED экраном и поддержкой 5G', 49999.99, 20, 1),
	('Ноутбук', 'Мощный ноутбук с процессором Intel i7 и SSD на 1 ТБ', 84999.99, 15, 2),
	('Беспроводные наушники', 'Наушники с активным шумоподавлением', 12999.99, 50, 3),
	('Умные часы', 'Часы с мониторингом здоровья и GPS', 19999.99, 4, 1),
	('Кофемашина', 'Автоматическая кофемашина с функцией капучино', 34999.99, 10, 5),
	('Игровая консоль', 'Новая игровая консоль с поддержкой 4K HDR', 59999.99, 8, 2),
	('Телевизор', 'Смарт-ТВ с диагональю 55 дюймов и разрешением 4K', 69999.99, 12, 6),
	('Пылесос', 'Робот-пылесос с управлением через приложение', 15999.99, 20, 5),
	('Холодильник', 'Двухкамерный холодильник с системой No Frost', 42999.99, 5, 7),
	('Микроволновка', 'Микроволновая печь с грилем', 9999.99, 25, 7);


