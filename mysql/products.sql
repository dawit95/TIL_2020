use ssafyhw;

drop table products;

create table products(
	productno INT NOT NULL AUTO_INCREMENT,
    productcode varchar(20) UNIQUE,
    productname varchar(30) NOT NULL,
    price int NOT NULL,
    manufacturer varchar(20) NULL,
    producttype varchar(20) NULL,
    primary key(productno)
);

insert into products(productcode, productname, price, manufacturer, producttype)
values( "ABCD-EFG", "삼성 Smart TV", 120, "SAMSUNG", "TV");

insert into products(productcode, productname, price, manufacturer, producttype)
values( "RE-PRIZM", "LG Smart TV", 118, "LG", "TV");

insert into products(productcode, productname, price, manufacturer, producttype)
values( "HH-HW", "필립스 Smart TV", 92, "PHILIPS", "TV");

insert into products(productcode, productname, price, manufacturer, producttype)
values( "1009-NUM", "NOTE9 노트북", 115, "SAMSUNG", "PC");

insert into products(productcode, productname, price, manufacturer, producttype)
values( "REVOKKKE-17", "grame 17 노트북", 148, "LG", "PC");

insert into products(productcode, productname, price, manufacturer, producttype)
values( "1234-897", "hp 노트북", 200, "HP", "PC");

insert into products(productcode, productname, price, manufacturer, producttype)
values( "psps-5", "PS5", 62, "소니", "consol");

insert into products(productcode, productname, price, manufacturer, producttype)
values( "RTXs3000", "RTX3080", 156, "RTX", "GPU");

-- 상품 가격 15%인하 된 가격을 보여주는 select
select productno, productname, price, round(price*0.85)as할인가격, manufacturer
from products;

-- TV 상품 가격을 20인하하여 저장하는 update
update products
set price = price * 0.8
where LCASE(productname) like "%tv%";

-- tv상품 가격 인하후 출력
select *
from products; 

select sum(price) as "단위:만원"
from products;