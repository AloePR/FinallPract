create database shopelec;

-- ������� �������������
CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    login VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('ADMIN', 'USER', 'WAREHOUSE')) NOT NULL
);
SELECT * FROM Users;

-- ������� ��������� �������
CREATE TABLE Categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- ������� �������
CREATE TABLE Products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,	
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE SET NULL
);

-- ������� �������
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
-- ������� ��������� �������
CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    patronymic VARCHAR(50), -- ��������
    work_address VARCHAR(255) NOT NULL
);
INSERT INTO Employees (first_name, last_name, patronymic, work_address) VALUES
('����', '������', '��������', '������, ��. ������, 1'),
('����', '������', '��������', '�����-���������, ��. �������, 2'),
('������', '�������', '���������', '�����������, ��. ������� ��������, 3'),
('����', '�������', '�������������', '������������, ��. ������, 4'),
('�����', '�������', '������������', '������, ��. �������, 5'),
('����', '������', '��������', '������-��-����, ��. ������, 6'),
('����', '������', '���������', '�����������, ��. �������, 7'),
('�������', '��������', '����������', '����������, ��. ����, 8'),
('�������', '�������', '����������', '���, ��. ������, 9'),
('���������', '�����������', '�������������', '����, ��. ������������, 10');

-- ������� �����������
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
    warehouse_id INT IDENTITY(1,1) PRIMARY KEY,    -- ���������� ������������� ������
    warehouse_name VARCHAR(100) NOT NULL,           -- �������� ������
    warehouse_location VARCHAR(255) NOT NULL        -- ������������ ������
);
CREATE TABLE warehouse_inventory (
    inventory_id INT IDENTITY(1,1) PRIMARY KEY,    -- ���������� ������������� ���������
    available_space INT NOT NULL,                   -- ��������� ������������ �� ������
    total_space INT NOT NULL,                       -- ����� ����� ������
    warehouse_id INT NOT NULL,                      -- ������� ���� �� �����
    CONSTRAINT fk_warehouse FOREIGN KEY (warehouse_id) 
        REFERENCES Warehouse (warehouse_id) 
        ON DELETE CASCADE                          -- ����� � �������� Warehouse
);
drop table WarehouseInventory;

INSERT INTO Warehouse (warehouse_name, warehouse_location)
VALUES
    ('����� 4', '������, ��. ���������, 12'),
    ('����� 5', '�����-���������, ��. ��������������, 34'),
    ('����� 6', '������������, ��. ������, 56');

	INSERT INTO warehouse_inventory (available_space, total_space, warehouse_id)
VALUES
    (500, 1000, 1),  -- ��� ������ 1
    (300, 800, 2),   -- ��� ������ 2
    (200, 500, 3);   -- ��� ������ 3

Select *from Products;
Drop table Products;

INSERT INTO Users (login, password, role) VALUES
('admin', 'admin', 'ADMIN'),
('User', 'user', 'USER'),
('warehouse', 'warehouse', 'WAREHOUSE')

INSERT INTO Categories (category_name)
VALUES
    ('�����������'),
    ('������'),
    ('��������'),
    ('�����'),
    ('������ ��� ����'),
    ('�������'),
    ('���������� ������'),
    ('������� � ��������'),
    ('����������'),
    ('������');

-- ���������� ������� Products
	INSERT INTO Products (name, description, price, stock_quantity, category_id) VALUES
	('��������', '����������� �������� � AMOLED ������� � ���������� 5G', 49999.99, 20, 1),
	('�������', '������ ������� � ����������� Intel i7 � SSD �� 1 ��', 84999.99, 15, 2),
	('������������ ��������', '�������� � �������� ���������������', 12999.99, 50, 3),
	('����� ����', '���� � ������������ �������� � GPS', 19999.99, 4, 1),
	('����������', '�������������� ���������� � �������� ��������', 34999.99, 10, 5),
	('������� �������', '����� ������� ������� � ���������� 4K HDR', 59999.99, 8, 2),
	('���������', '�����-�� � ���������� 55 ������ � ����������� 4K', 69999.99, 12, 6),
	('�������', '�����-������� � ����������� ����� ����������', 15999.99, 20, 5),
	('�����������', '������������ ����������� � �������� No Frost', 42999.99, 5, 7),
	('�������������', '������������� ���� � ������', 9999.99, 25, 7);


