/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     2017/04/05 11:29:07                          */
/*==============================================================*/



-- Type package declaration
create or replace package PDTypes  
as
    TYPE ref_cursor IS REF CURSOR;
end;

-- Integrity package declaration
create or replace package IntegrityPackage AS
 procedure InitNestLevel;
 function GetNestLevel return number;
 procedure NextNestLevel;
 procedure PreviousNestLevel;
 end IntegrityPackage;
/

-- Integrity package definition
create or replace package body IntegrityPackage AS
 NestLevel number;

-- Procedure to initialize the trigger nest level
 procedure InitNestLevel is
 begin
 NestLevel := 0;
 end;


-- Function to return the trigger nest level
 function GetNestLevel return number is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 return(NestLevel);
 end;

-- Procedure to increase the trigger nest level
 procedure NextNestLevel is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 NestLevel := NestLevel + 1;
 end;

-- Procedure to decrease the trigger nest level
 procedure PreviousNestLevel is
 begin
 NestLevel := NestLevel - 1;
 end;

 end IntegrityPackage;
/


drop trigger "tib_organization"
/

drop trigger "tib_resource"
/

drop trigger "tib_role"
/

drop trigger "tib_role_resource"
/

drop trigger "tib_sys_log"
/

drop trigger "tib_user"
/

drop trigger "tib_user_role"
/

drop table "organization" cascade constraints
/

drop table "resource" cascade constraints
/

drop table "role" cascade constraints
/

drop table "role_resource" cascade constraints
/

drop table "sys_log" cascade constraints
/

drop table "user" cascade constraints
/

drop table "user_role" cascade constraints
/

drop sequence "S_organization"
/

drop sequence "S_resource"
/

drop sequence "S_role"
/

drop sequence "S_role_resource"
/

drop sequence "S_sys_log"
/

drop sequence "S_user"
/

drop sequence "S_user_role"
/

create sequence "S_organization"
/

create sequence "S_resource"
/

create sequence "S_role"
/

create sequence "S_role_resource"
/

create sequence "S_sys_log"
/

create sequence "S_user"
/

create sequence "S_user_role"
/

/*==============================================================*/
/* Table: "organization"                                        */
/*==============================================================*/
create table "organization"  (
   "id"                 NUMBER(6)                       not null,
   "name"               VARCHAR2(64)                    not null,
   "address"            VARCHAR2(100)                  default NULL,
   "code"               VARCHAR2(64)                    not null,
   "icon"               VARCHAR2(32)                   default NULL,
   "pid"                INTEGER                        default NULL,
   "seq"                SMALLINT                       default 0 not null,
   "create_time"        DATE                            not null,
   constraint PK_ORGANIZATION primary key ("id")
)
/

comment on column "organization"."id" is
'??????id'
/

comment on column "organization"."name" is
'?????????'
/

comment on column "organization"."address" is
'??????'
/

comment on column "organization"."code" is
'??????'
/

comment on column "organization"."icon" is
'??????'
/

comment on column "organization"."pid" is
'????????????'
/

comment on column "organization"."seq" is
'??????'
/

comment on column "organization"."create_time" is
'????????????'
/

/*==============================================================*/
/* Table: "resource"                                            */
/*==============================================================*/
create table "resource"  (
   "id"                 NUMBER(6)                       not null,
   "name"               VARCHAR2(64)                    not null,
   "url"                VARCHAR2(100)                  default NULL,
   "open_mode"          VARCHAR2(32)                   default NULL,
   "description"        VARCHAR2(255)                  default NULL,
   "icon"               VARCHAR2(32)                   default NULL,
   "pid"                INTEGER                        default NULL,
   "seq"                SMALLINT                       default 0 not null,
   "status"             SMALLINT                       default 0 not null,
   "opened"             SMALLINT                       default 1 not null,
   "resource_type"      SMALLINT                       default 0 not null,
   "create_time"        DATE                            not null,
   constraint PK_RESOURCE primary key ("id")
)
/

comment on column "resource"."id" is
'??????'
/

comment on column "resource"."name" is
'????????????'
/

comment on column "resource"."url" is
'????????????'
/

comment on column "resource"."open_mode" is
'???????????? ajax,iframe'
/

comment on column "resource"."description" is
'????????????'
/

comment on column "resource"."icon" is
'????????????'
/

comment on column "resource"."pid" is
'????????????id'
/

comment on column "resource"."seq" is
'??????'
/

comment on column "resource"."status" is
'??????'
/

comment on column "resource"."opened" is
'????????????'
/

comment on column "resource"."resource_type" is
'????????????'
/

comment on column "resource"."create_time" is
'????????????'
/

/*==============================================================*/
/* Table: "role"                                                */
/*==============================================================*/
create table "role"  (
   "id"                 NUMBER(6)                       not null,
   "name"               VARCHAR2(64)                    not null,
   "seq"                SMALLINT                       default 0 not null,
   "description"        VARCHAR2(255)                  default NULL,
   "status"             SMALLINT                       default 0 not null,
   constraint PK_ROLE primary key ("id")
)
/

comment on column "role"."id" is
'??????id'
/

comment on column "role"."name" is
'?????????'
/

comment on column "role"."seq" is
'?????????'
/

comment on column "role"."description" is
'??????'
/

comment on column "role"."status" is
'??????'
/

/*==============================================================*/
/* Table: "role_resource"                                       */
/*==============================================================*/
create table "role_resource"  (
   "id"                 NUMBER(6)                       not null,
   "role_id"            INTEGER                         not null,
   "resource_id"        INTEGER                         not null,
   constraint PK_ROLE_RESOURCE primary key ("id")
)
/

comment on column "role_resource"."id" is
'??????id'
/

comment on column "role_resource"."role_id" is
'??????id'
/

comment on column "role_resource"."resource_id" is
'??????id'
/

/*==============================================================*/
/* Table: "sys_log"                                             */
/*==============================================================*/
create table "sys_log"  (
   "id"                 NUMBER(6)                       not null,
   "login_name"         VARCHAR2(255)                  default NULL,
   "role_name"          VARCHAR2(255)                  default NULL,
   "opt_content"        VARCHAR2(1024)                 default NULL,
   "client_ip"          VARCHAR2(255)                  default NULL,
   "create_time"        DATE                            not null,
   constraint PK_SYS_LOG primary key ("id")
)
/

comment on column "sys_log"."id" is
'??????id'
/

comment on column "sys_log"."login_name" is
'?????????'
/

comment on column "sys_log"."role_name" is
'?????????'
/

comment on column "sys_log"."opt_content" is
'??????'
/

comment on column "sys_log"."client_ip" is
'?????????ip'
/

comment on column "sys_log"."create_time" is
'????????????'
/

/*==============================================================*/
/* Table: "user"                                                */
/*==============================================================*/
create table "user"  (
   "id"                 NUMBER(6)                       not null,
   "login_name"         VARCHAR2(64)                    not null,
   "name"               VARCHAR2(64)                    not null,
   "password"           VARCHAR2(64)                    not null,
   "salt"               VARCHAR2(36)                   default NULL,
   "sex"                SMALLINT                       default 0 not null,
   "age"                SMALLINT                       default 0,
   "phone"              VARCHAR2(20)                   default NULL,
   "user_type"          SMALLINT                       default 0 not null,
   "status"             SMALLINT                       default 0 not null,
   "organization_id"    INTEGER                        default 0 not null,
   "create_time"        DATE                            not null,
   constraint PK_USER primary key ("id")
)
/

comment on column "user"."id" is
'??????id'
/

comment on column "user"."login_name" is
'?????????'
/

comment on column "user"."name" is
'?????????'
/

comment on column "user"."password" is
'??????'
/

comment on column "user"."salt" is
'???????????????'
/

comment on column "user"."sex" is
'??????'
/

comment on column "user"."age" is
'??????'
/

comment on column "user"."phone" is
'?????????'
/

comment on column "user"."user_type" is
'????????????'
/

comment on column "user"."status" is
'????????????'
/

comment on column "user"."organization_id" is
'????????????'
/

comment on column "user"."create_time" is
'????????????'
/

/*==============================================================*/
/* Table: "user_role"                                           */
/*==============================================================*/
create table "user_role"  (
   "id"                 NUMBER(6)                       not null,
   "user_id"            INTEGER                         not null,
   "role_id"            INTEGER                         not null,
   constraint PK_USER_ROLE primary key ("id")
)
/

comment on column "user_role"."id" is
'??????id'
/

comment on column "user_role"."user_id" is
'??????id'
/

comment on column "user_role"."role_id" is
'??????id'
/


create trigger "tib_organization" before insert
on "organization" for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column ""id"" uses sequence S_organization
    select S_organization.NEXTVAL INTO :new."id" from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger "tib_resource" before insert
on "resource" for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column ""id"" uses sequence S_resource
    select S_resource.NEXTVAL INTO :new."id" from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger "tib_role" before insert
on "role" for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column ""id"" uses sequence S_role
    select S_role.NEXTVAL INTO :new."id" from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger "tib_role_resource" before insert
on "role_resource" for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column ""id"" uses sequence S_role_resource
    select S_role_resource.NEXTVAL INTO :new."id" from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger "tib_sys_log" before insert
on "sys_log" for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column ""id"" uses sequence S_sys_log
    select S_sys_log.NEXTVAL INTO :new."id" from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger "tib_user" before insert
on "user" for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column ""id"" uses sequence S_user
    select S_user.NEXTVAL INTO :new."id" from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger "tib_user_role" before insert
on "user_role" for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column ""id"" uses sequence S_user_role
    select S_user_role.NEXTVAL INTO :new."id" from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/

