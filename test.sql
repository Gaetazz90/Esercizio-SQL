
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| cakebook           |
| information_schema |
| livewire           |
| mysql              |
| performance_schema |
| progetto4          |
| progetto5          |
| progetto6          |
| progetto_finale    |
| progetto_recap     |
| sys                |
+--------------------+
11 rows in set (0.00 sec)

mysql> create database sql_exercise;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| cakebook           |
| information_schema |
| livewire           |
| mysql              |
| performance_schema |
| progetto4          |
| progetto5          |
| progetto6          |
| progetto_finale    |
| progetto_recap     |
| sql_exercise       |
| sys                |
+--------------------+
12 rows in set (0.00 sec)

mysql> use sql_exercise;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> create table games(
    -> ID bigint unsigned auto_increment PRIMARY KEY,
    -> TITLE varchar(100) NOT NULL,
    -> YEAR integer CHECK (year>=1980),
    -> CREATED_AT timestamp default CURRENT_TIMESTAMP,
    -> UPDATED_AT timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+------------------------+
| Tables_in_sql_exercise |
+------------------------+
| games                  |
+------------------------+
1 row in set (0.00 sec)

mysql> describe games;
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type            | Null | Key | Default           | Extra                                         |
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| ID         | bigint unsigned | NO   | PRI | NULL              | auto_increment                                |
| TITLE      | varchar(100)    | NO   |     | NULL              |                                               |
| YEAR       | int             | YES  |     | NULL              |                                               |
| CREATED_AT | timestamp       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| UPDATED_AT | timestamp       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
5 rows in set (0.01 sec)

mysql> select * from games;
Empty set (0.01 sec)

mysql> INSERT INTO games (title, year) VALUES
    -> ("GTA Vice City", 1985),
    -> ("Fifa", 2000),
    -> ("Mortal Kombat", 2005)
    -> ;
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM games;
+----+---------------+------+---------------------+---------------------+
| ID | TITLE         | YEAR | CREATED_AT          | UPDATED_AT          |
+----+---------------+------+---------------------+---------------------+
|  1 | GTA Vice City | 1985 | 2024-04-19 17:38:03 | 2024-04-19 17:38:03 |
|  2 | Fifa          | 2000 | 2024-04-19 17:38:03 | 2024-04-19 17:38:03 |
|  3 | Mortal Kombat | 2005 | 2024-04-19 17:38:03 | 2024-04-19 17:38:03 |
+----+---------------+------+---------------------+---------------------+
3 rows in set (0.00 sec)

mysql> SELECT title,year FROM games;
+---------------+------+
| title         | year |
+---------------+------+
| GTA Vice City | 1985 |
| Fifa          | 2000 |
| Mortal Kombat | 2005 |
+---------------+------+
3 rows in set (0.00 sec)

mysql> select title, year from games WHERE year>=2000;
+---------------+------+
| title         | year |
+---------------+------+
| Fifa          | 2000 |
| Mortal Kombat | 2005 |
+---------------+------+
2 rows in set (0.00 sec)

mysql> select title, year from games WHERE year<2000;
+---------------+------+
| title         | year |
+---------------+------+
| GTA Vice City | 1985 |
+---------------+------+
1 row in set (0.00 sec)

mysql> INSERT INTO games (title, year) VALUES
    -> ("Tekken", 1974);
ERROR 3819 (HY000): Check constraint 'games_chk_1' is violated.

mysql> INSERT INTO games (title, year) VALUES
    -> ("Need for Speed", 2004),
    -> ("Call of Duty", 2010);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT title,year FROM games;
+----------------+------+
| title          | year |
+----------------+------+
| GTA Vice City  | 1985 |
| Fifa           | 2000 |
| Mortal Kombat  | 2005 |
| Need for Speed | 2004 |
| Call of Duty   | 2010 |
+----------------+------+
5 rows in set (0.00 sec)

mysql> DELETE FROM games WHERE title="Fifa";
Query OK, 1 row affected (0.01 sec)

mysql> describe games;
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type            | Null | Key | Default           | Extra                                         |
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| ID         | bigint unsigned | NO   | PRI | NULL              | auto_increment                                |
| TITLE      | varchar(100)    | NO   |     | NULL              |                                               |
| YEAR       | int             | YES  |     | NULL              |                                               |
| CREATED_AT | timestamp       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| UPDATED_AT | timestamp       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
5 rows in set (0.00 sec)

mysql> ALTER TABLE games
    -> ADD CONSOLE_BRAND varchar(50);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe games;
+---------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type            | Null | Key | Default           | Extra                                         |
+---------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| ID            | bigint unsigned | NO   | PRI | NULL              | auto_increment                                |
| TITLE         | varchar(100)    | NO   |     | NULL              |                                               |
| YEAR          | int             | YES  |     | NULL              |                                               |
| CREATED_AT    | timestamp       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| UPDATED_AT    | timestamp       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
| CONSOLE_BRAND | varchar(50)     | YES  |     | NULL              |                                               |
+---------------+-----------------+------+-----+-------------------+-----------------------------------------------+
6 rows in set (0.00 sec)

mysql> select * from games;
+----+----------------+------+---------------------+---------------------+---------------+
| ID | TITLE          | YEAR | CREATED_AT          | UPDATED_AT          | CONSOLE_BRAND |
+----+----------------+------+---------------------+---------------------+---------------+
|  1 | GTA Vice City  | 1985 | 2024-04-19 17:38:03 | 2024-04-19 17:38:03 | NULL          |
|  3 | Mortal Kombat  | 2005 | 2024-04-19 17:38:03 | 2024-04-19 17:38:03 | NULL          |
|  4 | Need for Speed | 2004 | 2024-04-19 17:46:54 | 2024-04-19 17:46:54 | NULL          |
|  5 | Call of Duty   | 2010 | 2024-04-19 17:46:54 | 2024-04-19 17:46:54 | NULL          |
+----+----------------+------+---------------------+---------------------+---------------+
4 rows in set (0.00 sec)

mysql> UPDATE games
    -> SET console_brand="PlayStation"
    -> WHERE ID=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from games;
+----+----------------+------+---------------------+---------------------+---------------+
| ID | TITLE          | YEAR | CREATED_AT          | UPDATED_AT          | CONSOLE_BRAND |
+----+----------------+------+---------------------+---------------------+---------------+
|  1 | GTA Vice City  | 1985 | 2024-04-19 17:38:03 | 2024-04-19 18:07:23 | PlayStation   |
|  3 | Mortal Kombat  | 2005 | 2024-04-19 17:38:03 | 2024-04-19 17:38:03 | NULL          |
|  4 | Need for Speed | 2004 | 2024-04-19 17:46:54 | 2024-04-19 17:46:54 | NULL          |
|  5 | Call of Duty   | 2010 | 2024-04-19 17:46:54 | 2024-04-19 17:46:54 | NULL          |
+----+----------------+------+---------------------+---------------------+---------------+
4 rows in set (0.00 sec)

mysql> UPDATE games
    -> SET console_brand="XBOX"
    -> WHERE ID=1 and ID=4;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from games;
+----+----------------+------+---------------------+---------------------+---------------+
| ID | TITLE          | YEAR | CREATED_AT          | UPDATED_AT          | CONSOLE_BRAND |
+----+----------------+------+---------------------+---------------------+---------------+
|  1 | GTA Vice City  | 1985 | 2024-04-19 17:38:03 | 2024-04-19 18:07:23 | PlayStation   |
|  3 | Mortal Kombat  | 2005 | 2024-04-19 17:38:03 | 2024-04-19 17:38:03 | NULL          |
|  4 | Need for Speed | 2004 | 2024-04-19 17:46:54 | 2024-04-19 17:46:54 | NULL          |
|  5 | Call of Duty   | 2010 | 2024-04-19 17:46:54 | 2024-04-19 17:46:54 | NULL          |
+----+----------------+------+---------------------+---------------------+---------------+
4 rows in set (0.00 sec)

mysql> UPDATE games
    -> SET console_brand="XBOX"
    -> WHERE ID=4;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from games;
+----+----------------+------+---------------------+---------------------+---------------+
| ID | TITLE          | YEAR | CREATED_AT          | UPDATED_AT          | CONSOLE_BRAND |
+----+----------------+------+---------------------+---------------------+---------------+
|  1 | GTA Vice City  | 1985 | 2024-04-19 17:38:03 | 2024-04-19 18:07:23 | PlayStation   |
|  3 | Mortal Kombat  | 2005 | 2024-04-19 17:38:03 | 2024-04-19 17:38:03 | NULL          |
|  4 | Need for Speed | 2004 | 2024-04-19 17:46:54 | 2024-04-19 18:12:30 | XBOX          |
|  5 | Call of Duty   | 2010 | 2024-04-19 17:46:54 | 2024-04-19 17:46:54 | NULL          |
+----+----------------+------+---------------------+---------------------+---------------+
4 rows in set (0.00 sec)


mysql> CREATE TABLE users(
    -> ID bigint unsigned auto_increment PRIMARY KEY,
    -> NAME varchar(100) NOT NULL,
    -> AGE integer CHECK(age>=18),
    -> CREATED_AT timestamp DEFAULT current_timestamp,
    -> UPDATED_AT timestamp DEFAULT current_timestamp ON UPDATE current_timestamp
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> ALTER TABLE games
    -> ADD USER_NAME varchar(100) UNIQUE NOT NULL AFTER NAME;
ERROR 1054 (42S22): Unknown column 'NAME' in 'games'
mysql> ALTER TABLE users
    -> ADD USER_NAME varchar(100) UNIQUE NOT NULL AFTER NAME;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe users;
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type            | Null | Key | Default           | Extra                                         |
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| ID         | bigint unsigned | NO   | PRI | NULL              | auto_increment                                |
| NAME       | varchar(100)    | NO   |     | NULL              |                                               |
| USER_NAME  | varchar(100)    | NO   | UNI | NULL              |                                               |
| AGE        | int             | YES  |     | NULL              |                                               |
| CREATED_AT | timestamp       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| UPDATED_AT | timestamp       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
6 rows in set (0.00 sec)

mysql> INSERT into USERS (name, user_name, age) VALUES
    -> ("Gaetano", "Tazzone", 33),
    -> ("Francesco", "Perla", 32),
    -> ("Andrea", "Secchiell", 30),
    -> ("Sabrina", "Ranma", 28)
    -> ;
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT into USERS (name, user_name, age) VALUES
    -> ("Riccardo", "Wanna", 16);
ERROR 3819 (HY000): Check constraint 'users_chk_1' is violated.


mysql> CREATE TABLE game_user(
    -> id BIGINT unsigned auto_increment PRIMARY KEY,
    -> USER_ID bigint unsigned,
    -> GAME_ID bigint unsigned,
    -> FOREIGN KEY (user_id) REFERENCES users(id),
    -> FOREIGN KEY (game_id) REFERENCES games(id)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> show tables;
+------------------------+
| Tables_in_sql_exercise |
+------------------------+
| game_user              |
| games                  |
| users                  |
+------------------------+
3 rows in set (0.00 sec)

mysql> describe game_user;
+---------+-----------------+------+-----+---------+----------------+
| Field   | Type            | Null | Key | Default | Extra          |
+---------+-----------------+------+-----+---------+----------------+
| id      | bigint unsigned | NO   | PRI | NULL    | auto_increment |
| USER_ID | bigint unsigned | YES  | MUL | NULL    |                |
| GAME_ID | bigint unsigned | YES  | MUL | NULL    |                |
+---------+-----------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> INSERT into game_user (user_id, game_id) VALUES
    -> (1,1),
    -> (1,3),
    -> (1,5),
    -> (2,4),
    -> (3,1),
    -> (3,3),
    -> (4,4),
    -> (4,5);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from game_user;
+----+---------+---------+
| id | USER_ID | GAME_ID |
+----+---------+---------+
| 12 |       1 |       1 |
| 13 |       1 |       3 |
| 14 |       1 |       5 |
| 15 |       2 |       4 |
| 16 |       3 |       1 |
| 17 |       3 |       3 |
| 18 |       4 |       4 |
| 19 |       4 |       5 |
+----+---------+---------+
8 rows in set (0.00 sec)

mysql> DELETE from GAME_USER WHERE user_id=2;
Query OK, 1 row affected (0.01 sec)

mysql> select * from game_user;
+----+---------+---------+
| id | USER_ID | GAME_ID |
+----+---------+---------+
| 12 |       1 |       1 |
| 13 |       1 |       3 |
| 14 |       1 |       5 |
| 16 |       3 |       1 |
| 17 |       3 |       3 |
| 18 |       4 |       4 |
| 19 |       4 |       5 |
+----+---------+---------+
7 rows in set (0.00 sec)

mysql> DELETE from GAME_USER WHERE user_id=4 and game_id=5;
Query OK, 1 row affected (0.01 sec)

mysql> select * from game_user;
+----+---------+---------+
| id | USER_ID | GAME_ID |
+----+---------+---------+
| 12 |       1 |       1 |
| 13 |       1 |       3 |
| 14 |       1 |       5 |
| 16 |       3 |       1 |
| 17 |       3 |       3 |
| 18 |       4 |       4 |
+----+---------+---------+
6 rows in set (0.00 sec)

mysql> DELETE from GAME_USER WHERE user_id=3;
Query OK, 2 rows affected (0.01 sec)

mysql> select * from game_user;
+----+---------+---------+
| id | USER_ID | GAME_ID |
+----+---------+---------+
| 12 |       1 |       1 |
| 13 |       1 |       3 |
| 14 |       1 |       5 |
| 18 |       4 |       4 |
+----+---------+---------+
4 rows in set (0.00 sec)

mysql> SELECT * from USERS INNER JOIN GAME_USER on users.id = game_user.user_id;
+----+---------+-----------+------+---------------------+---------------------+----+---------+---------+
| ID | NAME    | USER_NAME | AGE  | CREATED_AT          | UPDATED_AT          | id | USER_ID | GAME_ID |
+----+---------+-----------+------+---------------------+---------------------+----+---------+---------+
|  1 | Gaetano | Tazzone   |   33 | 2024-04-19 18:42:34 | 2024-04-19 18:42:34 | 12 |       1 |       1 |
|  1 | Gaetano | Tazzone   |   33 | 2024-04-19 18:42:34 | 2024-04-19 18:42:34 | 13 |       1 |       3 |
|  1 | Gaetano | Tazzone   |   33 | 2024-04-19 18:42:34 | 2024-04-19 18:42:34 | 14 |       1 |       5 |
|  4 | Sabrina | Ranma     |   28 | 2024-04-19 18:42:34 | 2024-04-19 18:42:34 | 18 |       4 |       4 |
+----+---------+-----------+------+---------------------+---------------------+----+---------+---------+
4 rows in set (0.00 sec)

mysql> SELECT name from USERS INNER JOIN GAME_USER on users.id = game_user.user_id;
+---------+
| name    |
+---------+
| Gaetano |
| Gaetano |
| Gaetano |
| Sabrina |
+---------+
4 rows in set (0.00 sec)

mysql> SELECT name, game_id from USERS INNER JOIN GAME_USER on users.id = game_user.user_id;
+---------+---------+
| name    | game_id |
+---------+---------+
| Gaetano |       1 |
| Gaetano |       3 |
| Gaetano |       5 |
| Sabrina |       4 |
+---------+---------+
4 rows in set (0.00 sec)

mysql> SELECT name, game_id from USERS LEFT JOIN GAME_USER on users.id = game_user.user_id;
+-----------+---------+
| name      | game_id |
+-----------+---------+
| Gaetano   |       1 |
| Gaetano   |       3 |
| Gaetano   |       5 |
| Francesco |    NULL |
| Andrea    |    NULL |
| Sabrina   |       4 |
+-----------+---------+
6 rows in set (0.00 sec)

mysql> SELECT name,title from USERS LEFT JOIN GAME_USER on users.id = game_user.user_id;
ERROR 1054 (42S22): Unknown column 'title' in 'field list'
mysql> SELECT name,title from USERS LEFT JOIN GAME_USER on users.id = game_user.user_id INNER JOIN GAMES on game_user.game_id = games.id;
+---------+----------------+
| name    | title          |
+---------+----------------+
| Gaetano | GTA Vice City  |
| Gaetano | Mortal Kombat  |
| Gaetano | Call of Duty   |
| Sabrina | Need for Speed |
+---------+----------------+
4 rows in set (0.00 sec)

mysql> SELECT name,title from USERS INNER JOIN GAME_USER on users.id = game_user.user_id INNER JOIN GAMES on game_user.game_id = games.id;
+---------+----------------+
| name    | title          |
+---------+----------------+
| Gaetano | GTA Vice City  |
| Gaetano | Mortal Kombat  |
| Gaetano | Call of Duty   |
| Sabrina | Need for Speed |
+---------+----------------+
4 rows in set (0.00 sec)

mysql> SELECT username, age, title from USERS INNER JOIN GAME_USER on users.id = game_user.user_id INNER JOIN GAMES on game_user.game_id = games.id;
ERROR 1054 (42S22): Unknown column 'username' in 'field list'
mysql> SELECT user_name, age, title from USERS INNER JOIN GAME_USER on users.id = game_user.user_id INNER JOIN GAMES on game_user.game_id = games.id;
+-----------+------+----------------+
| user_name | age  | title          |
+-----------+------+----------------+
| Tazzone   |   33 | GTA Vice City  |
| Tazzone   |   33 | Mortal Kombat  |
| Tazzone   |   33 | Call of Duty   |
| Ranma     |   28 | Need for Speed |
+-----------+------+----------------+
4 rows in set (0.00 sec)

mysql> SELECT * from USERS FULL OUTER JOIN GAME_USER on users.id = game_user.user_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'OUTER JOIN GAME_USER on users.id = game_user.user_id' at line 1
mysql> SELECT * from USERS FULL OUTER JOIN GAME_USER;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'OUTER JOIN GAME_USER' at line 1
mysql>
mysql> SELECT * from USERS INNER JOIN GAME_USER on users.id = game_user.user_id INNER JOIN GAMES on game_user.game_id = games.id;
+----+---------+-----------+------+---------------------+---------------------+----+---------+---------+----+----------------+------+---------------------+---------------------+---------------+
| ID | NAME    | USER_NAME | AGE  | CREATED_AT          | UPDATED_AT          | id | USER_ID | GAME_ID | ID | TITLE          | YEAR | CREATED_AT          | UPDATED_AT          | CONSOLE_BRAND |
+----+---------+-----------+------+---------------------+---------------------+----+---------+---------+----+----------------+------+---------------------+---------------------+---------------+
|  1 | Gaetano | Tazzone   |   33 | 2024-04-19 18:42:34 | 2024-04-19 18:42:34 | 12 |       1 |       1 |  1 | GTA Vice City  | 1985 | 2024-04-19 17:38:03 | 2024-04-19 18:07:23 | PlayStation   |
|  1 | Gaetano | Tazzone   |   33 | 2024-04-19 18:42:34 | 2024-04-19 18:42:34 | 13 |       1 |       3 |  3 | Mortal Kombat  | 2005 | 2024-04-19 17:38:03 | 2024-04-19 17:38:03 | NULL          |
|  1 | Gaetano | Tazzone   |   33 | 2024-04-19 18:42:34 | 2024-04-19 18:42:34 | 14 |       1 |       5 |  5 | Call of Duty   | 2010 | 2024-04-19 17:46:54 | 2024-04-19 17:46:54 | NULL          |
|  4 | Sabrina | Ranma     |   28 | 2024-04-19 18:42:34 | 2024-04-19 18:42:34 | 18 |       4 |       4 |  4 | Need for Speed | 2004 | 2024-04-19 17:46:54 | 2024-04-19 18:12:30 | XBOX          |
+----+---------+-----------+------+---------------------+---------------------+----+---------+---------+----+----------------+------+---------------------+---------------------+---------------+
4 rows in set (0.00 sec)

mysql> SELECT name, user_name, age, title, year from USERS INNER JOIN GAME_USER on users.id = game_user.user_id INNER JOIN GAMES on game_user.game_id = game
s.id;
+---------+-----------+------+----------------+------+
| name    | user_name | age  | title          | year |
+---------+-----------+------+----------------+------+
| Gaetano | Tazzone   |   33 | GTA Vice City  | 1985 |
| Gaetano | Tazzone   |   33 | Mortal Kombat  | 2005 |
| Gaetano | Tazzone   |   33 | Call of Duty   | 2010 |
| Sabrina | Ranma     |   28 | Need for Speed | 2004 |
+---------+-----------+------+----------------+------+
4 rows in set (0.00 sec)

mysql> SELECT name, user_name, age, title, console_brand from USERS INNER JOIN GAME_USER on users.id = game_user.user_id INNER JOIN GAMES on game_user.game_id = games.id;
+---------+-----------+------+----------------+---------------+
| name    | user_name | age  | title          | console_brand |
+---------+-----------+------+----------------+---------------+
| Gaetano | Tazzone   |   33 | GTA Vice City  | PlayStation   |
| Gaetano | Tazzone   |   33 | Mortal Kombat  | NULL          |
| Gaetano | Tazzone   |   33 | Call of Duty   | NULL          |
| Sabrina | Ranma     |   28 | Need for Speed | XBOX          |
+---------+-----------+------+----------------+---------------+
4 rows in set (0.00 sec)

mysql> CREATE VIEW players AS
    -> SELECT user_name, age, title from USERS INNER JOIN GAME_USER on users.id = game_user.user_id INNER JOIN GAMES on game_user.game_id = games.id;
Query OK, 0 rows affected (0.01 sec)

mysql> show tables;
+------------------------+
| Tables_in_sql_exercise |
+------------------------+
| game_user              |
| games                  |
| players                |
| users                  |
+------------------------+
4 rows in set (0.00 sec)

mysql> select * from players;
+-----------+------+----------------+
| user_name | age  | title          |
+-----------+------+----------------+
| Tazzone   |   33 | GTA Vice City  |
| Tazzone   |   33 | Mortal Kombat  |
| Tazzone   |   33 | Call of Duty   |
| Ranma     |   28 | Need for Speed |
+-----------+------+----------------+
4 rows in set (0.01 sec)

mysql> INSERT into GAME_USER (user_id, game_id) VALUES
    -> (2,1),
    -> (2,3),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> INSERT into GAME_USER (user_id, game_id) VALUES
    -> (2,1),
    -> (2,1)
    -> ;
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from players;
+-----------+------+----------------+
| user_name | age  | title          |
+-----------+------+----------------+
| Tazzone   |   33 | GTA Vice City  |
| Perla     |   32 | GTA Vice City  |
| Perla     |   32 | GTA Vice City  |
| Tazzone   |   33 | Mortal Kombat  |
| Ranma     |   28 | Need for Speed |
| Tazzone   |   33 | Call of Duty   |
+-----------+------+----------------+
6 rows in set (0.01 sec)

mysql> DELETE from GAME_USER WHERE user_name="Perla";
ERROR 1054 (42S22): Unknown column 'user_name' in 'where clause'
mysql> DELETE from GAME_USER WHERE user_id=2;
Query OK, 2 rows affected (0.01 sec)

mysql> select * from players;
+-----------+------+----------------+
| user_name | age  | title          |
+-----------+------+----------------+
| Tazzone   |   33 | GTA Vice City  |
| Tazzone   |   33 | Mortal Kombat  |
| Tazzone   |   33 | Call of Duty   |
| Ranma     |   28 | Need for Speed |
+-----------+------+----------------+
4 rows in set (0.00 sec)

mysql> INSERT into GAME_USER (user_id, game_id) VALUES
    -> (2,1),
    -> (2,3)
    -> ;
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from players;
+-----------+------+----------------+
| user_name | age  | title          |
+-----------+------+----------------+
| Tazzone   |   33 | GTA Vice City  |
| Perla     |   32 | GTA Vice City  |
| Tazzone   |   33 | Mortal Kombat  |
| Perla     |   32 | Mortal Kombat  |
| Ranma     |   28 | Need for Speed |
| Tazzone   |   33 | Call of Duty   |
+-----------+------+----------------+
6 rows in set (0.00 sec)

