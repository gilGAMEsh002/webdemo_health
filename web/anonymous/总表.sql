create table collect_table
(
    USERNAME  varchar(20) null,
    ARTICLEID varchar(20) null,
    FAVORITE  varchar(20) null
)
    charset = utf8;

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

create table message
(
    time     datetime                      null,
    name     varchar(20)                   null,
    title    varchar(20) collate utf8_bin  null,
    contacts varchar(200) collate utf8_bin null
);

create table table_article
(
    article_id   int auto_increment
        primary key,
    title        varchar(20) not null,
    author       varchar(20) not null,
    article_time datetime    null,
    content      text        null,
    collections  int         null,
    tags         varchar(50) null
)
    comment '所有文章' collate = utf8_bin;

create table table_comments
(
    comment_id           int auto_increment
        primary key,
    article_id           int          not null,
    user_id              varchar(20)  not null,
    content              varchar(200) null,
    comment_publish_date datetime     null,
    username             varchar(40)  null
)
    collate = utf8_bin;

create table table_discuss
(
    user_id              int         not null,
    topic_id             int         not null,
    discuss_content      char(200)   null,
    content_id           int auto_increment
        primary key,
    discuss_publish_date char(20)    null,
    username             varchar(40) not null
);

create table tags
(
    id             int auto_increment
        primary key,
    name           varchar(40) collate utf8_bin not null,
    article_number int default 0                not null
);

create table article_tag
(
    number        int auto_increment
        primary key,
    article_id    int         not null,
    tag_id        int         not null,
    article_title varchar(20) null,
    tag_name      varchar(20) null,
    constraint article_tagUN
        unique (article_id, tag_id),
    constraint article_id
        foreign key (article_id) references table_article (article_id),
    constraint tag_id
        foreign key (tag_id) references tags (id)
)
    collate = utf8_bin;

create table user
(
    id                int auto_increment
        primary key,
    username          varchar(40)   not null comment '用户名,唯一,限定二十个字内',
    password          varchar(32)   not null comment '存储md5加密后的32位密码',
    collection_number int default 0 not null comment '收藏的文章数',
    comment_number    int default 0 not null,
    mail              varchar(20)   not null,
    avatar_path       varchar(50)   null,
    constraint avatar_path
        unique (avatar_path),
    constraint user_pk
        unique (mail),
    constraint user_pk2
        unique (username)
)
    comment '存储所用用户的信息' collate = utf8mb4_bin;


