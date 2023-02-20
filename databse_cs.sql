create database case_study;
use case_study;

create table users (
  user_id int primary key auto_increment , 
  user_name varchar (45),
  user_login_name varchar (45),
  user_login_password varchar (45) unique,
  user_role varchar(45),
  date_of_birth date,
  gender bit(1),
  email varchar (45),
  address varchar (45)
);

create table food_category (
  food_category_id int primary key auto_increment,
  food_category_name varchar (45)
);

create table food (
  food_id int primary key auto_increment ,
  food_name varchar (45),
  food_description varchar (45),
  price bigint,
  img_url text,
  food_category_id int,
  constraint fk_food_category_id foreign key (food_category_id) references food_category (food_category_id)
);

create table `order` (
  order_id int primary key auto_increment,
  user_id int,
  food_id int,
  quantity int,
  constraint fk_user_id foreign key (user_id) references users (user_id),
  constraint fk_food_id foreign key (food_id) references food (food_id)
);


