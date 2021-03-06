/*
 * Copyright 2019-2029 geekidea(https://github.com/geekidea)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

create database if not exists blog character set utf8mb4 COLLATE utf8mb4_general_ci;

use blog;

create table if not exists m_user (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  username varchar(64) DEFAULT NULL,
  avatar varchar(255) DEFAULT NULL,
  email varchar(64) DEFAULT NULL,
  password varchar(64) DEFAULT NULL,
  status int(5) NOT NULL,
  created datetime DEFAULT NULL,
  last_login datetime DEFAULT NULL,
  PRIMARY KEY (id),
  KEY UK_USERNAME (username) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists m_blog (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  user_id bigint(20) NOT NULL,
  title varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  content longtext,
  created datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  status tinyint(4) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
INSERT INTO blog.m_user (id, username, avatar, email, password, status, created, last_login) VALUES ('1', 'markerhub', 'https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg', NULL, '96e79218965eb72c92a549dd5a330112', '0', '2020-04-20 10:44:01', NULL);

-- create table if not exists foo_bar
-- (
--     id bigint auto_increment comment 'ID'
--         primary key,
--     name varchar(20) not null comment 'Name',
--     foo varchar(20) null comment 'Foo',
--     bar varchar(20) not null comment 'Bar',
--     remark varchar(200) null comment 'Remark',
--     state int default 1 not null comment 'State???0???Disable???1???Enable',
--     version int default 0 not null comment 'Version',
--     create_time timestamp default CURRENT_TIMESTAMP null comment 'Create Time',
--     update_time timestamp null comment 'Update Time'
-- )
--     comment 'FooBar';

-- create table if not exists example_order
-- (
--     id bigint auto_increment comment '??????'
--         primary key,
--     name varchar(20) not null comment '????????????',
--     order_no varchar(100) null comment '????????????',
--     remark varchar(200) null comment '??????',
--     state int default 1 not null comment '?????????0????????????1?????????',
--     version int default 0 not null comment '??????',
--     create_time timestamp default CURRENT_TIMESTAMP null comment '????????????',
--     update_time timestamp null comment '????????????'
-- )
--     comment '????????????';

-- create table if not exists ip_address
-- (
--     id bigint auto_increment
--         primary key,
--     ip_start varchar(15) not null,
--     ip_end varchar(15) not null,
--     area varchar(45) null comment '??????',
--     operator varchar(6) null comment '?????????',
--     ip_start_num bigint(10) not null,
--     ip_end_num bigint(10) not null
-- )
--     comment 'IP??????';

-- create index ip_address_ip_end_num_index
--     on ip_address (ip_end_num);

-- create index ip_address_ip_start_num_index
--     on ip_address (ip_start_num);

-- create table if not exists sys_department
-- (
--     id bigint auto_increment comment '??????'
--         primary key,
--     name varchar(32) not null comment '????????????',
--     parent_id bigint null comment '???id',
--     level int null comment '????????????',
--     state int default 1 not null comment '?????????0????????????1?????????',
--     sort int default 0 not null comment '??????',
--     remark varchar(200) null comment '??????',
--     version int default 0 not null comment '??????',
--     create_time timestamp default CURRENT_TIMESTAMP null comment '????????????',
--     update_time timestamp null comment '????????????',
--     constraint sys_department_name_uindex
--         unique (name)
-- )
--     comment '??????';

-- create table if not exists sys_permission
-- (
--     id bigint auto_increment comment '??????'
--         primary key,
--     name varchar(32) null comment '????????????',
--     parent_id bigint null comment '???id',
--     url varchar(200) null comment '??????',
--     code varchar(100) not null comment '????????????',
--     icon varchar(100) null comment '??????',
--     type int not null comment '?????????1????????????2?????????',
--     level int not null comment '?????????1???????????????2???????????????N??????N???',
--     state int default 1 not null comment '?????????0????????????1?????????',
--     sort int default 0 not null comment '??????',
--     remark varchar(200) null comment '??????',
--     version int default 0 not null comment '??????',
--     create_time timestamp default CURRENT_TIMESTAMP not null comment '????????????',
--     update_time timestamp null comment '????????????',
--     constraint sys_permission_code_uindex
--         unique (code)
-- )
--     comment '????????????';

-- create table if not exists sys_role
-- (
--     id bigint auto_increment comment '??????'
--         primary key,
--     name varchar(32) not null comment '????????????',
--     code varchar(100) null comment '??????????????????',
--     type int null comment '????????????',
--     state int default 1 not null comment '???????????????0????????????1?????????',
--     remark varchar(200) null comment '??????',
--     version int default 0 not null comment '??????',
--     create_time timestamp default CURRENT_TIMESTAMP not null comment '????????????',
--     update_time timestamp null comment '????????????',
--     constraint sys_role_name_uindex
--         unique (name)
-- )
--     comment '????????????';

-- create table if not exists sys_role_permission
-- (
--     id bigint auto_increment comment '??????'
--         primary key,
--     role_id bigint not null comment '??????id',
--     permission_id bigint not null comment '??????id',
--     state int default 1 not null comment '?????????0????????????1?????????',
--     remark varchar(200) null comment '??????',
--     version int default 0 not null comment '??????',
--     create_time timestamp default CURRENT_TIMESTAMP not null comment '????????????',
--     update_time timestamp null comment '????????????'
-- )
--     comment '??????????????????';

-- create index permission_id
--     on sys_role_permission (permission_id);

-- create index role_id
--     on sys_role_permission (role_id);

-- create table if not exists sys_user
-- (
--     id bigint auto_increment comment '??????'
--         primary key,
--     username varchar(20) not null comment '?????????',
--     nickname varchar(20) null comment '??????',
--     password varchar(64) not null comment '??????',
--     salt varchar(32) null comment '??????',
--     phone varchar(20) not null comment '????????????',
--     gender int default 1 not null comment '?????????0?????????1???????????????1',
--     head varchar(200) null comment '??????',
--     remark varchar(200) null comment '??????',
--     state int default 1 not null comment '?????????0????????????1????????????2?????????',
--     department_id bigint not null comment '??????id',
--     role_id bigint not null comment '??????id',
--     deleted int default 0 not null comment '???????????????0???????????????1????????????',
--     version int default 0 not null comment '??????',
--     create_time timestamp default CURRENT_TIMESTAMP null comment '????????????',
--     update_time timestamp null comment '????????????',
--     constraint sys_user_username_uindex
--         unique (username)
-- )
--     comment '????????????';

-- create index department_id
--     on sys_user (department_id);

-- create index role_id
--     on sys_user (role_id);

-- create table if not exists sys_login_log
-- (
--     id bigint(18) auto_increment comment '??????'
--         primary key,
--     request_id varchar(32) null comment '??????ID',
--     username varchar(32) null comment '????????????',
--     ip varchar(15) null comment 'IP',
--     area varchar(45) null comment '??????',
--     operator varchar(6) null comment '?????????',
--     token varchar(32) null comment 'tokenMd5???',
--     type int null comment '1:?????????2?????????',
--     success tinyint(1) default 0 not null comment '???????????? true:??????/false:??????',
--     code int null comment '?????????',
--     exception_message varchar(300) null comment '??????????????????',
--     user_agent varchar(300) null comment '???????????????',
--     browser_name varchar(100) null comment '???????????????',
--     browser_version varchar(100) null comment '???????????????',
--     engine_name varchar(100) null comment '?????????????????????',
--     engine_version varchar(100) null comment '?????????????????????',
--     os_name varchar(100) null comment '????????????',
--     platform_name varchar(100) null comment '????????????',
--     mobile tinyint(1) null comment '???????????????,0:???,1:???',
--     device_name varchar(100) null comment '?????????????????????',
--     device_model varchar(100) null comment '?????????????????????',
--     remark varchar(200) null comment '??????',
--     create_time datetime default CURRENT_TIMESTAMP null comment '????????????',
--     update_time datetime null comment '????????????'
-- )
--     comment '??????????????????';

-- create table if not exists sys_operation_log
-- (
--     id bigint(18) auto_increment comment '??????'
--         primary key,
--     request_id varchar(32) null comment '??????ID',
--     user_id bigint(18) null comment '??????ID',
--     user_name varchar(32) null comment '????????????',
--     name varchar(200) null comment '????????????',
--     ip varchar(15) null comment 'IP',
--     area varchar(45) null comment '??????',
--     operator varchar(6) null comment '?????????',
--     path varchar(500) null comment '?????????',
--     module varchar(100) null comment '????????????',
--     class_name varchar(100) null comment '??????',
--     method_name varchar(100) null comment '????????????',
--     request_method varchar(10) null comment '???????????????GET/POST',
--     content_type varchar(100) null comment '????????????',
--     request_body tinyint(1) null comment '?????????JSON??????????????????',
--     param text null comment '????????????',
--     token varchar(32) null comment 'tokenMd5???',
--     type int null comment '0:??????,1:??????,2:??????,3:??????,4:????????????,5:????????????,6:????????????,7:????????????,8:????????????',
--     success tinyint(1) null comment '0:??????,1:??????',
--     code int null comment '?????????????????????',
--     message varchar(100) null comment '??????????????????',
--     exception_name varchar(200) null comment '???????????????',
--     exception_message varchar(300) null comment '????????????',
--     browser_name varchar(100) null comment '???????????????',
--     browser_version varchar(100) null comment '???????????????',
--     engine_name varchar(100) null comment '?????????????????????',
--     engine_version varchar(100) null comment '?????????????????????',
--     os_name varchar(100) null comment '????????????',
--     platform_name varchar(100) null comment '????????????',
--     mobile tinyint(1) null comment '???????????????,0:???,1:???',
--     device_name varchar(100) null comment '?????????????????????',
--     device_model varchar(100) null comment '?????????????????????',
--     remark varchar(200) null comment '??????',
--     create_time datetime default CURRENT_TIMESTAMP null comment '????????????',
--     update_time datetime null comment '????????????'
-- )
--     comment '??????????????????';



-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (1, 'admin', '?????????', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889900', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 00:00:00', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (2, 'test', '????????????1', '34783fb724b259beb71a1279f7cd93bdcfd92a273d566f926419a37825c500df', '087c2e9857f35f1e243367f3b89b81c1', '15888889901', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Tester Account', 1, 1, 2, 0, 1, '2020-02-26 00:00:01', '2020-02-15 19:31:50');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (3, 'admin1', '?????????1', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889902', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 00:09:09', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (4, 'admin2', '?????????2', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889903', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 16:10:06', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (5, 'admin3', '?????????3', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889904', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 16:10:06', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (6, 'admin4', '?????????4', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889905', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 16:10:06', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (7, 'admin5', '?????????5', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889906', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 23:59:59', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (8, 'admin6', '?????????6', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 23:59:59', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (9, 'admin7', '?????????7', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-20 23:59:59', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (10, 'admin8', '?????????8', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-01-30 22:56:55', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (11, 'admin9', '?????????9', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2019-12-30 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (12, 'admin10', '?????????10', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (13, 'admin11', '?????????11', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (14, 'admin12', '?????????12', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 2, '2019-08-26 00:52:01', '2020-02-27 14:05:40');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (15, 'admin13', '?????????13uuu', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 3, '2019-08-26 00:52:01', '2020-02-27 14:05:18');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (16, 'admin14', '?????????14', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (17, 'admin15', '?????????15', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (18, 'admin16', '?????????16', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (19, 'admin17', '?????????17', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (20, 'admin18', '?????????18', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (21, 'admin19', '?????????19', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (22, 'admin20', '?????????20', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (23, 'admin21', '?????????21', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (24, 'admin22', '?????????22', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (25, 'admin23', '?????????23', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 3, '2019-08-26 00:52:01', '2020-02-27 14:42:28');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (100, 'dddd', 'ddddd', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', 'aa98a65fa53d198f38d8e3a63f3f5a65', 'ddddddddddd', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'dddddddd', 1, 1, 1, 0, 1, '2020-02-26 14:06:53', '2020-02-27 14:06:52');
-- INSERT INTO sys_user (id, username, nickname, password, salt, phone, gender, head, remark, state, department_id, role_id, deleted, version, create_time, update_time) VALUES (101, 'adminx', '111111', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '1faf81180b4a4a78c48d7c31479a0622', '11111111111', 1, 'http://localhost:8888/api/resource/201908201013068.png', '1111111111', 1, 1, 1, 1, 6, '2020-02-26 14:19:57', '2020-03-02 17:33:48');

-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (1, '?????????', null, 1, 1, 359544077, 'fe8c9cbac0c54395ac411335a31f4888', 15, '2019-10-25 09:46:49', '2019-11-13 19:56:07');
-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (2, '?????????', null, 1, 1, 0, null, 0, '2019-11-01 20:45:43', null);
-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (20, '???????????????', 2, 2, 1, 0, null, 0, '2019-11-01 20:48:38', null);
-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (21, '???????????????', 2, 2, 1, 0, null, 0, '2019-11-01 20:48:38', null);
-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (22, '?????????', 2, 2, 1, 0, null, 0, '2019-11-01 20:48:38', null);
-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (201, '????????????', 20, 3, 1, 0, null, 0, '2019-11-01 20:48:38', null);
-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (202, '????????????', 20, 3, 1, 0, null, 0, '2019-11-01 20:48:38', null);
-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (203, '????????????', 21, 3, 1, 0, null, 0, '2019-11-01 20:48:38', null);
-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (204, '????????????', 21, 3, 1, 0, null, 0, '2019-11-01 20:48:38', null);
-- INSERT INTO sys_department (id, name, parent_id, level, state, sort, remark, version, create_time, update_time) VALUES (205, '????????????', 22, 3, 1, 0, null, 0, '2019-11-01 20:48:38', null);

-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (1, '?????????', 'admin', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (2, 'test', 'test', null, 1, '??????????????????????????????', 0, '2019-10-25 09:48:02', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (3, '?????????1', 'admin1', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (4, '?????????2', 'admin2', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (5, '?????????3', 'admin3', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (6, '?????????4', 'admin4', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (7, '?????????5', 'admin5', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (8, '?????????6', 'admin6', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (9, '?????????7', 'admin7', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (10, '?????????8', 'admin8', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (11, '?????????9', 'admin9', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (12, '?????????10', 'admin10', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (13, '?????????11', 'admin11', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (14, '?????????12', 'admin12', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (15, '?????????13', 'admin13', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (16, '?????????14', 'admin14', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (17, '?????????15', 'admin15', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (18, '?????????16', 'admin16', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (19, '?????????17', 'admin17', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (20, '?????????18', 'admin18', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (21, '?????????19', 'admin19', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (22, '?????????20', 'admin20', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);
-- INSERT INTO sys_role (id, name, code, type, state, remark, version, create_time, update_time) VALUES (23, '?????????21', 'admin21', null, 1, '???????????????????????????', 0, '2019-10-25 09:47:21', null);

-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (1, '????????????', null, null, 'system:management', 'el-icon-s-unfold', 1, 1, 1, 0, '1????????????', 0, '2019-10-26 11:12:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (100, '????????????', 1, null, 'sys:user:management', 'el-icon-s-unfold', 1, 2, 1, 0, '100????????????', 0, '2019-10-26 11:15:48', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (200, '????????????', 1, null, 'sys:role:management', 'el-icon-s-unfold', 1, 2, 1, 0, '200????????????', 0, '2019-10-26 11:15:48', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (300, '????????????', 1, null, 'sys:permission:management', 'el-icon-s-unfold', 1, 2, 1, 0, '300????????????', 0, '2019-10-26 11:15:48', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (400, '????????????', 1, null, 'sys:department:management', 'el-icon-s-unfold', 1, 2, 1, 0, '400????????????', 0, '2019-10-26 11:15:48', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (500, '????????????', 1, null, 'sys:log:manager', 'el-icon-s-custom', 1, 2, 1, 0, '500????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (1000, '????????????', 100, null, 'sys:user:add', 'el-icon-s-custom', 2, 3, 1, 0, '1000????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (1001, '????????????', 100, null, 'sys:user:update', 'el-icon-s-custom', 2, 3, 1, 0, '1001????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (1002, '????????????', 100, null, 'sys:user:delete', 'el-icon-s-custom', 2, 3, 1, 0, '1002????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (1003, '????????????', 100, null, 'sys:user:info', 'el-icon-s-custom', 2, 3, 1, 0, '1003????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (1004, '??????????????????', 100, null, 'sys:user:page', 'el-icon-s-custom', 2, 3, 1, 0, '1004????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (1005, '??????????????????', 100, null, 'sys:user:update:password', 'el-icon-s-custom', 2, 3, 1, 0, '1005????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (1006, '??????????????????', 100, null, 'sys:user:update:head', 'el-icon-s-custom', 2, 3, 1, 0, '1006????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (1007, '??????????????????', 100, null, 'sys:user:reset:password', 'el-icon-s-custom', 2, 3, 1, 0, '1007????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (2000, '????????????', 200, null, 'sys:role:add', 'el-icon-s-custom', 2, 3, 1, 0, '2000????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (2001, '????????????', 200, null, 'sys:role:update', 'el-icon-s-custom', 2, 3, 1, 0, '2001????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (2002, '????????????', 200, null, 'sys:role:delete', 'el-icon-s-custom', 2, 3, 1, 0, '2002????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (2003, '????????????', 200, null, 'sys:role:info', 'el-icon-s-custom', 2, 3, 1, 0, '2003????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (2004, '??????????????????', 200, null, 'sys:role:page', 'el-icon-s-custom', 2, 3, 1, 0, '2004????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (2005, '????????????', 200, null, 'sys:role:list', 'el-icon-s-custom', 2, 3, 1, 0, '2005????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (2006, '????????????ID??????', 200, null, 'sys:permission:three-ids-by-role-id', 'el-icon-s-custom', 2, 3, 1, 0, '2006????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3000, '????????????', 300, null, 'sys:permission:add', 'el-icon-s-custom', 2, 3, 1, 0, '3000????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3001, '????????????', 300, null, 'sys:permission:update', 'el-icon-s-custom', 2, 3, 1, 0, '3001????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3002, '????????????', 300, null, 'sys:permission:delete', 'el-icon-s-custom', 2, 3, 1, 0, '3002????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3003, '????????????', 300, null, 'sys:permission:info', 'el-icon-s-custom', 2, 3, 1, 0, '3003????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3004, '??????????????????', 300, null, 'sys:permission:page', 'el-icon-s-custom', 2, 3, 1, 0, '3004????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3005, '??????????????????', 300, null, 'sys:permission:all:menu:list', 'el-icon-s-custom', 2, 3, 1, 0, '3005????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3006, '????????????????????????', 300, null, 'sys:permission:all:menu:tree', 'el-icon-s-custom', 2, 3, 1, 0, '3006????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3007, '??????????????????', 300, null, 'sys:permission:menu:list', 'el-icon-s-custom', 2, 3, 1, 0, '3007????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3008, '????????????????????????', 300, null, 'sys:permission:menu:tree', 'el-icon-s-custom', 2, 3, 1, 0, '3008????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3009, '????????????????????????', 300, null, 'sys:permission:codes', 'el-icon-s-custom', 2, 3, 1, 0, '3009????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3010, '????????????', 300, null, 'sys:permission:nav-menu', 'el-icon-s-custom', 2, 3, 1, 0, '3010????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (3011, '??????????????????', 300, null, 'sys:role-permission:update', 'el-icon-s-custom', 2, 3, 1, 0, '3011????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (4000, '????????????', 400, null, 'sys:department:add', 'el-icon-s-custom', 2, 3, 1, 0, '4000????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (4001, '????????????', 400, null, 'sys:department:update', 'el-icon-s-custom', 2, 3, 1, 0, '4001????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (4002, '????????????', 400, null, 'sys:department:delete', 'el-icon-s-custom', 2, 3, 1, 0, '4002????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (4003, '????????????', 400, null, 'sys:department:info', 'el-icon-s-custom', 2, 3, 1, 0, '4003????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (4004, '??????????????????', 400, null, 'sys:department:page', 'el-icon-s-custom', 2, 3, 1, 0, '4004????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (4005, '????????????', 400, null, 'sys:department:list', 'el-icon-s-custom', 2, 3, 1, 0, '4005????????????', 1, '2019-10-26 11:18:40', '2020-03-09 00:50:13');
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (4006, '??????????????????', 400, null, 'sys:department:all:tree', 'el-icon-s-custom', 2, 3, 1, 0, '4006????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (5001, '??????????????????', 500, null, 'sys:operation:log:page', 'el-icon-s-custom', 2, 3, 1, 0, '5001????????????', 0, '2019-10-26 11:18:40', null);
-- INSERT INTO sys_permission (id, name, parent_id, url, code, icon, type, level, state, sort, remark, version, create_time, update_time) VALUES (5002, '??????????????????', 500, null, 'sys:login:log:page', 'el-icon-s-custom', 2, 3, 1, 0, '5002????????????', 0, '2019-10-26 11:18:40', null);

-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (303, 1, 3008, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (304, 1, 1, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (305, 1, 3009, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (306, 1, 3010, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (307, 1, 3011, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (308, 1, 200, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (309, 1, 5001, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (310, 1, 5002, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (311, 1, 2000, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (312, 1, 400, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (313, 1, 2001, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (314, 1, 2002, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (315, 1, 2003, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (316, 1, 2004, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (317, 1, 2005, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (318, 1, 2006, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (319, 1, 4000, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (320, 1, 4001, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (321, 1, 4002, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (322, 1, 4003, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (323, 1, 100, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (324, 1, 4004, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (325, 1, 4005, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (326, 1, 4006, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (327, 1, 1000, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (328, 1, 1001, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (329, 1, 1002, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (330, 1, 1003, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (331, 1, 1004, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (332, 1, 300, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (333, 1, 1005, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (334, 1, 1006, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (335, 1, 1007, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (336, 1, 500, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (337, 1, 3000, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (338, 1, 3001, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (339, 1, 3002, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (340, 1, 3003, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (341, 1, 3004, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (342, 1, 3005, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (343, 1, 3006, 1, null, 0, '2020-04-01 00:14:36', null);
-- INSERT INTO sys_role_permission (id, role_id, permission_id, state, remark, version, create_time, update_time) VALUES (344, 1, 3007, 1, null, 0, '2020-04-01 00:14:36', null);

-- INSERT INTO foo_bar (id, name, foo, bar, remark, state, version, create_time, update_time) VALUES (1, 'test add', 'hello', 'world', '??????', 1, 0, '2020-03-20 11:22:35', null);

-- INSERT INTO example_order (id, name, order_no, remark, state, version, create_time, update_time) VALUES (1, 'AAA', null, null, 1, 0, '2020-03-12 22:25:35', null);
-- INSERT INTO example_order (id, name, order_no, remark, state, version, create_time, update_time) VALUES (2, 'BBB', null, null, 1, 0, '2020-03-12 22:25:35', null);
-- INSERT INTO example_order (id, name, order_no, remark, state, version, create_time, update_time) VALUES (3, 'CCC', null, null, 1, 0, '2020-03-12 22:25:35', null);

-- INSERT INTO sys_login_log (id, request_id, username, ip, area, operator, token, type, success, code, exception_message, user_agent, browser_name, browser_version, engine_name, engine_version, os_name, platform_name, mobile, device_name, device_model, remark, create_time, update_time) VALUES (1, '1242813712335691777', 'admin', '127.0.0.1', '????????????', null, 'c87aaffa35dadafb066cf18679eab36e', 1, 1, 200, null, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, null, null, null, '2020-03-25 22:01:11', null);
-- INSERT INTO sys_login_log (id, request_id, username, ip, area, operator, token, type, success, code, exception_message, user_agent, browser_name, browser_version, engine_name, engine_version, os_name, platform_name, mobile, device_name, device_model, remark, create_time, update_time) VALUES (2, '1242813887884091393', 'admin', '127.0.0.1', '????????????', null, 'c87aaffa35dadafb066cf18679eab36e', 2, 1, 200, null, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, null, null, null, '2020-03-25 22:01:48', null);
-- INSERT INTO sys_login_log (id, request_id, username, ip, area, operator, token, type, success, code, exception_message, user_agent, browser_name, browser_version, engine_name, engine_version, os_name, platform_name, mobile, device_name, device_model, remark, create_time, update_time) VALUES (3, '1242814069371625474', 'admin', '127.0.0.1', '????????????', null, null, 1, 0, null, '????????????????????????', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, null, null, null, '2020-03-25 22:02:25', null);
-- INSERT INTO sys_login_log (id, request_id, username, ip, area, operator, token, type, success, code, exception_message, user_agent, browser_name, browser_version, engine_name, engine_version, os_name, platform_name, mobile, device_name, device_model, remark, create_time, update_time) VALUES (4, '1242814192096960513', null, '127.0.0.1', '????????????', null, null, 2, 0, null, 'token????????????', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, null, null, null, '2020-03-25 22:02:54', null);

-- INSERT INTO sys_operation_log (id, request_id, user_id, user_name, name, ip, area, operator, path, module, class_name, method_name, request_method, content_type, request_body, param, token, type, success, code, message, exception_name, exception_message, browser_name, browser_version, engine_name, engine_version, os_name, platform_name, mobile, device_name, device_model, remark, create_time, update_time) VALUES (1, '1242805276474634241', null, null, 'helloWorld', '127.0.0.1', '????????????', null, '/api/hello/world', null, 'io.geekidea.springbootplus.system.controller.HelloWorldController', 'helloWorld', 'GET', null, 0, null, null, 0, 1, 200, '????????????', null, null, 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, null, null, '', '2020-03-25 21:27:22', null);
-- INSERT INTO sys_operation_log (id, request_id, user_id, user_name, name, ip, area, operator, path, module, class_name, method_name, request_method, content_type, request_body, param, token, type, success, code, message, exception_name, exception_message, browser_name, browser_version, engine_name, engine_version, os_name, platform_name, mobile, device_name, device_model, remark, create_time, update_time) VALUES (2, '1242820418688049153', null, null, 'FooBar????????????', '127.0.0.1', '????????????', null, '/api/fooBar/getPageList', 'foobar', 'com.example.foobar.controller.FooBarController', 'getFooBarPageList', 'POST', 'application/json', 1, '{"pageIndex":1,"pageSize":10}', null, 7, 1, 200, '????????????', null, null, 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, null, null, '', '2020-03-25 22:27:33', null);
