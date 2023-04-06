if OBJECT_ID('dbo.SKU', 'U') is not null drop table dbo.SKU;
create table dbo.SKU 
( ID int primary key identity,
Code int unique,
Name NVARCHAR(20) not null);
update dbo.SKU
set Code = '000000' +ID
go
if OBJECT_ID('dbo.Family', 'U') is not null drop table dbo.Family;
create table dbo.Family (
ID int primary key identity,
SurName NVARCHAR(20) ,
BudgetValue int);
go
if OBJECT_ID('dbo.Basket', 'U') is not null drop table dbo.Basket;
create table dbo.Basket (
ID int primary key identity,
ID_SKU int ,
constraint FK_ID_SKU foreign key(ID_SKU) references dbo.SKU(ID),
ID_Family int 
constraint FK_ID_Family foreign key(ID_Family) references dbo.Family(ID),
Quantity int check(Quantity >=0),
Value int check(Value >=0),
PurchaseDate date default sysdatetime(),
DiscountValue int );
