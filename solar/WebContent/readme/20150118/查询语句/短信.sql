drop table if exists RENT_SMS;

/*==============================================================*/
/* Table: RENT_SMS                                              */
/*==============================================================*/
create table RENT_SMS
(
   id                   int not null,
   user_id              int,
   from_account         varchar(32),
   to_account           varchar(32),
   sms_code             varchar(6),
   sms_content          varchar(128),
   send_time            varchar(32),
   status               int comment '1发送成功 0发送失败',
   primary key (id)
);