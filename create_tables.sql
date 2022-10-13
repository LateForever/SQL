CREATE TABLE Clients(
id serial primary key,
name varchar(60) not null,
surname varchar(60) not null,
age int not null,
birthdate date not null,
living_address varchar(100) not null,
living_city varchar(60) not  null,
living_postcode  varchar(5) not  null,
email varchar(70) not  null
)

CREATE TABLE BANKS(
id serial not null primary key,
name varchar(100) not null,
address  varchar(100)  not  null,
city varchar(100) not null,
postcode varchar(5) not null
)

CREATE TABLE USERS(
id serial not null primary key unique,
login varchar(64) not null unique,
password varchar(64) not null unique,
balance float not null,
client_id int not null unique,
account_number int not null unique,
constraint fk_users_client_id_clients_id foreign key (client_id) references CLIENTS(id)
)

CREATE TABLE SESSION_ID (
user_id int not null,
ip_address varchar(15) not null unique,
user_agent varchar(200) not null,
expires date not null,
session_id varchar(64),
constraint fk_user_id_session_id_session_id_users_id foreign  key(user_id) references USERS(id),
constraint fk_user_id_session_id_session_id_admin_id foreign  key(user_id) references ADMIN(id)
)

CREATE  TABLE ADMIN(
id  serial  primary  key,
login varchar(64) not null unique,
password  varchar(64) not null unique,
bank_id int not null,
constraint fk_bank_id_admin_banks_id foreign key (bank_id) references BANKS(id)
)

CREATE TABLE TRANSFERS(
id serial primary key,
ammount float not null,
currency varchar(10) not null,
national smallint not null,
from_id int not null,
to_account int not null,
bank_id int not null,
transfer_date date not null,
constraint fk_from_id_transfers_users_id foreign key (from_id) references USERS(id),
constraint fk_to_account_transfers_users_account_number foreign key (to_account) references USERS (account_number),
constraint fk_bank_id_transfers_banks_id foreign key (bank_id) references BANKS (id)
)