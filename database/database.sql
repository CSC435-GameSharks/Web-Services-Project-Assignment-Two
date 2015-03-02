create database if not exists csc435;

use csc435;

drop table if exists wowClass;

/*create wow class table*/
create table wowClass(
       classID int,
       className varchar(50),
       classBio varchar(512),
       primary key (classID));


drop table if exists wowRoles;

create table 
