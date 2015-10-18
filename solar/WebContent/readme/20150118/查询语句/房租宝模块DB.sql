/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/12/25 13:02:03                          */
/*==============================================================*/


drop table if exists RENT_AD;

drop table if exists RENT_AD_TYPE;

drop table if exists RENT_AGENT;

drop table if exists RENT_AGENT_CUSTOMER;

drop table if exists RENT_AGENT_REWARD;

drop table if exists RENT_LANDLORD_CHARGE;

drop table if exists RENT_MAIL_RECORD;

drop table if exists RENT_RENT;

drop table if exists RENT_RENTER_PAYMENT;

drop table if exists RENT_REQUEST_STOP_ENTRUST;

drop table if exists RENT_ROOM;

drop table if exists RENT_SMS;

drop table if exists RENT_USERS;

drop table if exists common_city;

drop table if exists common_city_zone;

drop table if exists common_province;

drop table if exists common_zone;

/*==============================================================*/
/* Table: RENT_AD                                               */
/*==============================================================*/
create table RENT_AD
(
   id                   int not null,
   name                 varchar(32),
   type_id              int,
   picture              varchar(256),
   width                int,
   height               int,
   content              varchar(1024),
   start_time           varchar(32),
   end_time             varchar(32),
   view_num             int,
   status               int comment '1启用2停用',
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_AD_TYPE                                          */
/*==============================================================*/
create table RENT_AD_TYPE
(
   id                   int not null,
   name                 varchar(32),
   remark               varchar(128),
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

alter table RENT_AD_TYPE comment '第一期系统默认只有一个广告分类，后续可以扩展分类';

/*==============================================================*/
/* Table: RENT_AGENT                                            */
/*==============================================================*/
create table RENT_AGENT
(
   id                   int not null,
   name                 varchar(32),
   telephone            varchar(32),
   email                varchar(32),
   username             varchar(32),
   password             varchar(64),
   bank_card_no         varchar(32) comment '房东用户银行账号',
   bank_card_type       varchar(8) comment '区分不同的银行',
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_AGENT_CUSTOMER                                   */
/*==============================================================*/
create table RENT_AGENT_CUSTOMER
(
   id                   int not null,
   agent_id             int,
   user_id              int,
   username             varchar(32),
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_AGENT_REWARD                                     */
/*==============================================================*/
create table RENT_AGENT_REWARD
(
   id                   int not null,
   user_id              int not null,
   year                 varchar(4),
   month                varchar(2),
   day                  varchar(2),
   date                 varchar(32),
   name                 varchar(32),
   num                  int,
   price                decimal(10,2),
   status               int not null comment '1已转账2已到账',
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_LANDLORD_CHARGE                                  */
/*==============================================================*/
create table RENT_LANDLORD_CHARGE
(
   id                   int not null,
   landlord_id          int not null,
   room_id              int not null,
   charge_time          varchar(32) not null,
   year                 varchar(4),
   month                varchar(2),
   day                  varchar(2),
   money                decimal(10,2),
   money_type           int comment '1租金2押金',
   renter_pay_id        int comment '对应租客缴费的记录编号，如果当月租客没有缴费，系统转押金给房东，则此字段为租客针对这个房源的缴押金记录的编号（租客缴租记录表中这个房源的金额类型为押金的记录的编号）',
   status               int,
   from_account         varchar(32),
   from_account_type    varchar(32),
   to_account           varchar(32),
   to_account_type      varchar(32),
   pay_type             int,
   admin_id             int,
   remark               varchar(64),
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_MAIL_RECORD                                      */
/*==============================================================*/
create table RENT_MAIL_RECORD
(
   id                   int not null,
   from_account         varchar(32),
   to_account           varchar(32),
   send_time            varchar(32),
   mail_content         varchar(512),
   send_id              int,
   send_name            varchar(32),
   receiver_name        varchar(32),
   create_time          varchar(32),
   primary key (id)
);

alter table RENT_MAIL_RECORD comment '包含用户找回密码邮件，系统给用户发送的提醒邮件等..';

/*==============================================================*/
/* Table: RENT_RENT                                             */
/*==============================================================*/
create table RENT_RENT
(
   id                   int not null,
   room_id              int,
   code                 int,
   present              int,
   rent_id              int,
   status               int comment '0未确认1确认3终止4续租',
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_RENTER_PAYMENT                                   */
/*==============================================================*/
create table RENT_RENTER_PAYMENT
(
   id                   int not null,
   renter_id            int,
   room_id              int,
   month_num            int,
   money                decimal(10,2),
   money_type           int comment '1租金2押金',
   from_account         varchar(32),
   from_account_type    int,
   to_account           varchar(32),
   to_account_type      int,
   pay_type             int,
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_REQUEST_STOP_ENTRUST                             */
/*==============================================================*/
create table RENT_REQUEST_STOP_ENTRUST
(
   id                   int not null,
   user_id              int,
   room_code            int,
   req_end_date         varchar(32),
   status               int comment '0待审核1审核通过2审核不通过',
   audit_id             int,
   audit_name           varchar(32),
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_ROOM                                             */
/*==============================================================*/
create table RENT_ROOM
(
   id                   int not null,
   code                 int not null comment '房源的唯一编码，初始为6位数字，每次增加1',
   landlord_id          int not null,
   province             int not null,
   city                 int not null,
   region               int not null,
   address              varchar(128),
   area                 decimal(4,2) not null comment '单位/平方米',
   start_date           varchar(32) not null comment '格式yyyy-mm-dd',
   end_date             varchar(32) not null,
   request_end_date     varchar(32),
   pay_day              varchar(2) not null comment '01-31',
   monthly_rent         decimal(12,2) not null,
   deposit              decimal(12,2) not null,
   invite_code          varchar(32) comment '中介手机号码',
   status               int comment '0未出租，房东未确认 1未租出，房东已确认出租 2已租出，双方已签署协议 3托管正常结束 4续租 5申请终止委托成功',
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_SMS                                              */
/*==============================================================*/
create table RENT_SMS
(
   id                   int not null,
   from_account         varchar(32),
   to_account           varchar(32),
   sms_content          varchar(128),
   send_time            varchar(32),
   status               int,
   primary key (id)
);

/*==============================================================*/
/* Table: RENT_USERS                                            */
/*==============================================================*/
create table RENT_USERS
(
   id                   int not null,
   name                 varchar(32),
   telephone            varchar(32),
   email                varchar(32),
   username             varchar(32),
   password             varchar(64) comment '32位md5加密密码',
   bank_card_no         varchar(32) comment '房东用户银行账号',
   bank_card_type       varchar(8) comment '区分不同的银行',
   credit_card_no       varchar(32) comment '租客用户信用卡卡号',
   credit_card_type     varchar(32) comment '区分信用卡所属银行',
   address              varchar(64),
   type                 int comment '1房东2租客3既是房东又是租客',
   register_time        varchar(32),
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: common_city                                           */
/*==============================================================*/
create table common_city
(
   id                   int not null,
   code                 varchar(6),
   name                 varchar(32),
   provinceId           int,
   primary key (id)
)
engine  = InnoDB;

/*==============================================================*/
/* Table: common_city_zone                                      */
/*==============================================================*/
create table common_city_zone
(
   code                 varchar(6),
   name                 varchar(32),
   cityId               int
)
engine  = InnoDB ;

/*==============================================================*/
/* Table: common_province                                       */
/*==============================================================*/
create table common_province
(
   id                   int not null,
   code                 varchar(6),
   name                 varchar(32),
   zone_id              int,
   primary key (id)
)
engine  = InnoDB ;

/*==============================================================*/
/* Table: common_zone                                           */
/*==============================================================*/
create table common_zone
(
   id                   int not null,
   code                 varchar(32),
   name                 varchar(32),
   primary key (id)
)
engine  = InnoDB ;

alter table common_zone comment '中国个区域划分表';

alter table RENT_AD add constraint FK_AD_AD_TYPE foreign key (type_id)
      references RENT_AD_TYPE (id);

alter table RENT_AGENT_CUSTOMER add constraint FK_CUSTOMER_AGENT foreign key (agent_id)
      references RENT_AGENT (id);

alter table RENT_AGENT_REWARD add constraint FK_REWARD_AGENT foreign key (user_id)
      references RENT_AGENT (id);

alter table RENT_LANDLORD_CHARGE add constraint FK_LANDLORD_CHARGE_ROOM foreign key (room_id)
      references RENT_ROOM (id);

alter table RENT_LANDLORD_CHARGE add constraint FK_LANDLORD_CHARGE_USER foreign key (landlord_id)
      references RENT_USERS (id);

alter table RENT_RENT add constraint FK_RENT_RECORD_ROOM foreign key (room_id)
      references RENT_ROOM (id);

alter table RENT_RENTER_PAYMENT add constraint FK_RENTER_PAYMENT_ROOM foreign key (room_id)
      references RENT_ROOM (id) on delete restrict on update restrict;

alter table RENT_RENTER_PAYMENT add constraint FK_RENTER_PAYMENT_USER foreign key (renter_id)
      references RENT_USERS (id);

alter table RENT_REQUEST_STOP_ENTRUST add constraint FK_STOP_ENTRUST_USER foreign key (user_id)
      references RENT_USERS (id);

alter table RENT_ROOM add constraint FK_USER_ROOM foreign key (landlord_id)
      references RENT_USERS (id);

alter table common_city add constraint FK_CITY_PROVINCE foreign key (provinceId)
      references common_province (id);

alter table common_city_zone add constraint FK_AREA_CITY foreign key (cityId)
      references common_city (id);

alter table common_province add constraint FK_ZONE_PROVINCE foreign key (zone_id)
      references common_zone (id);

