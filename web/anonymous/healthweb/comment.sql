create table comment
(
    userId    int           not null,
    articleId int           not null,
    content   varchar(4000) not null,
    time      date          null
)
    charset = utf8;

create index userId
    on comment (userId);

