CREATE DATABASE FinalProject;
USE FinalProject;

CREATE TABLE Customer(
	Customer_Number SMALLINT IDENTITY(01, 1) PRIMARY KEY NOT NULL,
	Name VARCHAR(30),
	Email VARCHAR(30),
	Phone_Number VARCHAR(15),
	Address VARCHAR(30));

CREATE TABLE Category(
	Category_Number SMALLINT IDENTITY (0001, 1) PRIMARY KEY NOT NULL,
	Category_Name VARCHAR(30));
CREATE TABLE Sellers (
    Seller_Number SMALLINT IDENTITY(01, 1) PRIMARY KEY,
    Name VARCHAR(50),
    Phone_number VARCHAR(10),
    Address VARCHAR(50),
    FollowerS INT,
	Number_of_Products INT,
);

CREATE TABLE Product (
	Product_Number SMALLINT IDENTITY(01, 1) PRIMARY KEY NOT NULL,
	Product_Name VARCHAR(50),
	Category_Number SMALLINT FOREIGN KEY REFERENCES Category(Category_Number),
	Seller_Number SMALLINT FOREIGN KEY REFERENCES Sellers(Seller_Number),
	Price REAL,
	Stock_Quantities SMALLINT,
);

CREATE TABLE Orders(
	Order_Number SMALLINT IDENTITY (001, 1) PRIMARY KEY not null,
	Customer_Number SMALLINT not null FOREIGN KEY REFERENCES Customer(Customer_Number),
	Product_Number SMALLINT not null FOREIGN KEY REFERENCES Product(Product_Number),
	Quantity INT not null,
	Order_Date date);

CREATE TABLE Cart (
    Cart_Number SMALLINT IDENTITY(000001, 1) PRIMARY KEY NOT NULL,
    Customer_Number SMALLINT FOREIGN KEY REFERENCES Customer(Customer_Number),
	Order_Number SMALLINT FOREIGN KEY REFERENCES Orders(Order_Number)
    Total_Items SMALLINT,
    Total_Price REAL,
);

CREATE TABLE Shipment(
    Shipment_ID VARCHAR(30) PRIMARY KEY NOT NULL,
    Order_Number SMALLINT FOREIGN KEY REFERENCES Orders(Order_Number),
    Delivery_date DATE,
	Address VARCHAR(50),
    Shipment_Method VARCHAR(10));

CREATE TABLE  Payment(
    Payment_Number SMALLINT IDENTITY(001,1) PRIMARY KEY not null,  
    Order_Number SMALLINT not null FOREIGN KEY REFERENCES Orders(Order_Number),
    Pay_date DATE,
    Method VARCHAR(10));

CREATE TABLE  Discount(
    DiscountNumber SMALLINT IDENTITY(1001,1) PRIMARY KEY not null,
    ProductNumber SMALLINT not null FOREIGN KEY REFERENCES Product(Product_Number),
    Discount_Code VARCHAR(10) not null,
    Discount_Rate REAL not null,
    Start_Date DATE,
    Expire_Date DATE);

CREATE TABLE Review (
    Review_Number SMALLINT IDENTITY (2001, 1)PRIMARY KEY,
	Product_Number SMALLINT FOREIGN KEY REFERENCES Product(Product_Number),
    Username VARCHAR(50),
    Rating SMALLINT,
    Date_of_Review DATE,
);

INSERT INTO Customer
VALUES
('Thien Long', 'longmac321@gmail.com', '0868605627', 'Hai Duong'),
('Dinh Duy', 'duykhoadd1@gmail.com', '0327903702', 'Ha Noi'),
('Mai Lan', 'mailan66@gmail.com', '0977742358', 'Hai Phong'),
('Ngoc Anh', 'nguyentna2811@gmail.com', '0377601737', 'Ha Noi'),
('Thanh Trang', 'nguyentranghq60@gmail.com', '037707885', 'Ha Noi'),
('Thai Minh', 'viweb25248@gmail.com', '0968940762', 'Ha Noi'),
('Duc Nguyen', 'ducknguyen@gmail.com', '0835117980', 'Ha Noi'),
('Chi Linh', 'linhajc.lmc@gmail.com', '0369739136', 'Hai Duong'),
('Cao Hung', 'hungneu@gmail.com', '0988682452', 'Ha Noi'),
('Pham Khanh', 'phamthikhanh123@gmail.com', '0944433012', 'Hai Duong');

INSERT INTO Product
VALUES
('Giao trinh triet hoc Mac Lenin', 83000, 20),
('Keo tan nhiet CPU', 60500, 568),
('Kinh vien thi Nhat Ban', 143450, 684),
('Thuoc nhuom toc mau nau', 65000, 1823),
('Chao chong dinh SUNHOUSE', 99500, 257),
('Dieu hoa khong khi', 185000, 46),
('Sach Minecraft Book 4: The end', 193000,72),
('Chan vay ngan', 109000, 16655),
('Ao thun cotton', 29000, 9),
('Son duong gao co mem', 90000, 107597);

INSERT INTO Category
VALUES
('Sach giao duc'),
('Phu kien Laptop'),
('Kinh vien thi'),
('Thuoc nhuom toc'),
('Chao chong dinh'),
('Do gia dung'),
('Van hoc gia tuong'),
('Thoi trang nu'),
('Ao phong'),
('Duong moi');

INSERT INTO Sellers
VALUES
('Nha sach Thanh An HCM', '0908810704', 'Tan Phu, Ho Chi Minh', 5600, 8200),
('Phu kien Pico', '0366532054', 'Nam Tu Lien, Ha Noi', 48600, 2100),
('Kinh mat Thien An cao cap', '0377761431', 'Dong Da, Ha Noi', 4200, 2300),
('Thuoc nhuom toc Tone Do', '0973107355', 'Dong Da, Ha Noi', 542700, 112),
('SUNHOUSE JSC', '1800 6680', 'Cau Giay, Ha Noi', 20500, 57),
('Gulife Official Asia', ' 0966763323', 'Ha Dong, Ha Noi', 1700, 60),
('FAHASHA', '1900636467', 'Hai Ba Trung, TP.HCM', 375900, 77200),
('viole669', '0865235093', 'Thach That, Ha Noi', 103700, 157),
('Midori chans', '0879999667', 'Cau Giay, Ha Noi', 3600, 21),
('Co Mem Official Store', '1800.646.890', 'Dich Vong Hau, Cau Giay, Ha Noi', 608200, 215);

INSERT INTO Orders







