drop table if exists RENT_RENTER_MONTHLY_MONEY;

/*==============================================================*/
/* Table: RENT_RENTER_MONTHLY_MONEY                             */
/*==============================================================*/
create table RENT_RENTER_MONTHLY_MONEY
(
   id                   int not null,
   renter_id            int,
   room_id              int not null,
   month_num            int,
   year                 varchar(4),
   month                varchar(4),
   day                  varchar(4),
   week                 varchar(8),
   start_time           varchar(32),
   end_time             varchar(32),
   money                decimal(10,2),
   real_money           decimal(10,2),
   money_type           int comment '1租金2押金',
   pay_status           int comment '0未收1已收',
   from_account         varchar(32),
   from_account_type    int,
   to_account           varchar(32),
   to_account_type      int,
   pay_type             int,
   create_time          varchar(32),
   modify_time          varchar(32),
   primary key (id)
);

alter table RENT_RENTER_MONTHLY_MONEY add constraint FK_MONTHLY_MONEY_ROOM foreign key (room_id)
      references RENT_ROOM (id);