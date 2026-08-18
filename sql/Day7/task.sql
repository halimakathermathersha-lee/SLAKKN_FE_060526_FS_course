CREATE DATABASE ElectionDb;
use ElectionDb;

CREATE Table voters(
voterid int primary key auto_increment,
voterName varchar(20),
constituencyid int,
boothid int,
candidatesid int,
foreign key (constituencyid) references constituency(constituencyid),
foreign key (boothid) references pollingbooths(boothid),
foreign key (candidatesid) references candidates(candidatesid)
);

create table candidates(
candidatesid int primary key auto_increment,
candidatesName varchar(20),
constituencyid int,
foreign key (constituencyid) references constituency(constituencyid)
);

create table pollingbooths(
boothid int primary key auto_increment,
constituencyid int,
candidatesid int,
foreign key (candidatesid) references candidates(candidatesid)
);

create table constituency(
constituencyid int primary key auto_increment,
constituencyName varchar(20)
);