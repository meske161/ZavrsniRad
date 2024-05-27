use master;
go
drop database if exists rehearsals;
go
create database rehearsals;
go

use rehearsals;

create table Users (
ID int not null primary key identity (1,1),
FirstName varchar(20) not null,
LastName varchar(30) not null,
Email varchar(50) not null,
Band int not null
);

create table Bands (
ID int not null primary key identity (1,1),
BandName varchar(100) not null,
Genre varchar(100)
);

create table Rooms (
ID int not null primary key identity (1,1),
RoomName varchar(50) not null, 
Adress varchar(100) not null
);

create table Reservations (
BandID int not null,
RoomID int not null, 
StartTime datetime not null, 
EndTime datetime not null, 
Reserved bit
);

alter table Users add foreign key (Band) references Bands (ID);
alter table Reservations add foreign key (BandID) references Bands (ID);
alter table Reservations add foreign key (RoomID) references Rooms (ID);