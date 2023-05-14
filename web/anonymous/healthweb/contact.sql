create table contact
(
    username varchar(20)  not null,
    content  varchar(600) not null,
    id       int auto_increment
        primary key,
    constraint username
        unique (username)
)
    comment '用户向开发者发的消息';

