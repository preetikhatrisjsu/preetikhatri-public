create database CarSale;
use CarSale;


create table times (
time_id Int not null,
years Int not null,
months varchar(5) not null,
Constraint Pk_time Primary Key (time_id));

create table Auto (
auto_id Int Not null,
brand varchar(30),
model varchar(30),
color varchar(30),
Constraint Pk_auto Primary Key (auto_id));

create table StoreLocation (
location_id Int not null,
street varchar(5),
city varchar(15),
State varchar(2),
Constraint Pk_StoreLocation Primary Key (location_id));

create table Sales (
time_id Int not null,
auto_id Int Not null,
location_id Int not null,
qty_sold int,
dollar_sold int,
CONSTRAINT FK_time FOREIGN KEY (time_id) REFERENCES times(time_id),
CONSTRAINT FK_auto FOREIGN KEY (auto_id) REFERENCES Auto(auto_id),
CONSTRAINT FK_StoreLocation FOREIGN KEY (location_id) REFERENCES StoreLocation(location_id));

# only May Jun Jul 2018,2019,2020

Insert Into times (time_id,years,months) Values ('1','2020','May');
Insert Into times (time_id,years,months) Values ('2','2020','Jun');

#only BMW,Toyota,Honda,328i,428i,Camry,Corolla,Civic
Insert Into Auto (auto_id,brand,model,color) Values ('1','BMW','328i','red');
Insert Into Auto (auto_id,brand,model,color) Values ('2','BMW','328i','blue');
Insert Into Auto (auto_id,brand,model,color) Values ('3','Toyota','Camry','blue');
Insert Into Auto (auto_id,brand,model,color) Values ('4','Toyota','Corolla','red');

#
Insert Into StoreLocation (location_id,street,city,State) Values ('1','Ast','SanJose','CA');
Insert Into StoreLocation (location_id,street,city,State) Values ('2','Bst','SanFrancisco','CA');
Insert Into StoreLocation (location_id,street,city,State) Values ('3','Cst','New York','NY');
Insert Into StoreLocation (location_id,street,city,State) Values ('4','Est','LongBeach','NY');
#
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('1','1','1','10','400000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('1','2','1','15','600000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('1','1','2','10','400000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('1','3','2','10','200000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('1','4','3','20','300000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('1','3','3','5','100000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('1','1','4','5','200000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('1','4','4','5','100000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('2','1','1','10','400000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('2','1','2','10','400000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('2','3','2','5','100000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('2','4','3','5','100000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('2','3','4','5','100000');
Insert Into Sales (time_id,auto_id,location_id,qty_sold,dollar_sold) Values ('2','2','1','5','200000');

select * from times;
# group by brand
select brand, count(*),SUM(qty_sold) 
from   Auto, Sales
group  by brand;

select brand,color, count(*),SUM(qty_sold) 
from   Auto, Sales
group  by brand, color Order by brand,color