create table collect_table
(
    USERNAME       varchar(20)            null,
    VARIABLE_NAME  varchar(64) default '' not null,
    ARTICLENAME    varchar(20)            null,
    VARIABLE_VALUE varchar(1024)          null,
    FAVORITE       varchar(20)            null
);

