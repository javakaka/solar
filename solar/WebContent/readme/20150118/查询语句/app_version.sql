drop table if exists RENT_APP_VERSION;

/*==============================================================*/
/* Table: RENT_APP_VERSION                                      */
/*==============================================================*/
create table RENT_APP_VERSION
(
   id                   int not null,
   app_id               int comment '1房租宝房东租客版2中介版',
   device               int comment '1 ios 2 android 3 wp',
   version              varchar(32),
   version_name         varchar(32),
   url                  varchar(128),
   remark               varchar(256),
   size                 int,
   upload_id            varchar(32),
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);