create table user
(
    id                int auto_increment
        primary key,
    username          varchar(40)   not null comment '用户名,唯一,限定二十个字内',
    password          varchar(32)   not null comment '存储md5加密后的32位密码',
    collection_number int default 0 not null comment '收藏的文章数',
    comment_number    int default 0 not null,
    mail              varchar(20)   not null,
    constraint user_pk
        unique (mail),
    constraint user_pk2
        unique (username)
)
    comment '存储所用用户的信息' collate = utf8mb4_bin;

