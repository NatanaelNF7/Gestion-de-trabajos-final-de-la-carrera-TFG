-- USUARIO DE BASE DE DATOS

Create user 'Natanael'@'localhost'
identified by '1234';

select * from mysql.user;
select user();

grant all privileges on informacionferrotodo.producto to 'Natanael';


revoke all privileges on informacionferrotodo.producto from 'Natanael';


flush privileges;


