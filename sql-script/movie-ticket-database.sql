create table user_table (
user_id int auto_increment primary key,
firstName varchar(255),
lastName varchar(255) ,
email varchar(255) unique,
pass varchar(255)
);

create table movie_table(
movie_id int auto_increment primary key,
movie_name varchar(255),
image_path varchar(255)

);

create table seat_table(
seat_id int auto_increment primary key,
seat_number varchar(255) unique
);

create table movie_seat_table(
movie_seat_id int auto_increment primary key,
movie_id int,
seat_id int,
user_id int,
is_available boolean default true,
foreign key(movie_id)references movie_table(movie_id),
foreign key(seat_id)references seat_table(seat_id),
foreign key(user_id)references user_table(user_id)
);

create table food_table(
food_id int auto_increment primary key,
food_name varchar(255),
image_source varchar(255),
price varchar(255)
);

insert into user_table(firstName, lastName, email, pass)values("Billy", "Bob", "BillyBob@farmersUnion.org", "corn");

insert into food_table(food_name, image_source, price)values("Lay's Potato Chips","https://static.wikia.nocookie.net/the-snack-encyclopedia/images/9/95/Lay%27s.jpg/revision/latest?cb=20200706030018", "199.00");
insert into food_table(food_name, image_source, price)values("Hotdog", "https://upload.wikimedia.org/wikipedia/commons/f/fb/Hotdog_-_Evan_Swigart.jpg", "99.00");
insert into food_table(food_name, image_source, price)values("Icecream Sandwich", "https://www.chatelaine.com/wp-content/uploads/2019/07/Chapmans-Vanilla-Super-Sandwich-Box.jpg", "55.20");
insert into food_table(food_name, image_source, price)values("Nachoes Fully Loaded", "https://thebusybaker.ca/wp-content/uploads/2017/12/rainbow-vegetable-skillet-nachos-fbig1.jpg", "190.99");
insert into food_table(food_name, image_source, price)values("Pizza Slice", "https://wallpaperaccess.com/full/3667701.jpg", "39.99");
insert into food_table(food_name, image_source, price)values("Gummy Bears", "https://i5.walmartimages.com/asr/f9cb6a41-3045-4dbf-b603-ff9189266e5f_1.8ffbc8a801b32246e50926abb38d7697.jpeg", "69.50");
insert into food_table(food_name, image_source, price)values("Soft Pretzel", "https://thumbor.thedailymeal.com/IXdZFF4UQuN17_9-PWGMFp9Tz8c=/870x565/https://www.thedailymeal.com/sites/default/files/2015/11/04/soft%20pretzle-shutterstock-Brent%20Hofacker_181113260.jpg", "39.99");
insert into food_table(food_name, image_source, price)values("Popcorn", "https://i2.wp.com/www.spainonafork.com/wp-content/uploads/2019/04/popcornHOR-11.png?fit=750%2C750&ssl=1", "40.00");
insert into food_table(food_name, image_source, price)values("M&M's", "https://images-na.ssl-images-amazon.com/images/I/71RNc7ru%2BnL._SL1500_.jpg", "100.00");
insert into food_table(food_name, image_source, price)values("Ice Tea", "https://horsedrop.com/wp-content/uploads/2020/05/snapshotimagehandler_1132800572.jpeg", "39.00");
insert into food_table(food_name, image_source, price)values("Soft Drink", "https://i.insider.com/564a12aa2491f9c12e8b5488?width=1036&format=jpeg", "45.50");
insert into food_table(food_name, image_source, price)values("Beer", "https://cf.shopee.ph/file/b228755f95453ff05c88f7cc5c117f6c", "60.00");

insert into movie_table(movie_name, image_path)values("Raya and the Last Dragon", "https://variety.com/wp-content/uploads/2020/10/raya.jpg?w=1000");
insert into movie_table(movie_name, image_path)values("Godzilla vs. Kong", "https://variety.com/wp-content/uploads/2019/11/godzilla-king-kong.jpg?w=1000");
insert into movie_table(movie_name, image_path)values("Mortal Kombat", "https://variety.com/wp-content/uploads/2021/01/mortal-kombat.jpg?w=1280");
insert into movie_table(movie_name, image_path)values("Cruella", "https://variety.com/wp-content/uploads/2019/08/cruella.jpg?w=1280");
insert into movie_table(movie_name, image_path)values("A Quiet Place Part II", "https://variety.com/wp-content/uploads/2020/04/a-quiet-place-2.jpg?w=751");
insert into movie_table(movie_name, image_path)values("Fast & Furious 9", "https://variety.com/wp-content/uploads/2020/01/fast-3.jpg?w=1280");
insert into movie_table(movie_name, image_path)values("Black Widow", "https://variety.com/wp-content/uploads/2019/12/black-widow-trailer-2.jpg?w=1000");
insert into movie_table(movie_name, image_path)values("Space Jam: A New Legacy", "https://variety.com/wp-content/uploads/2021/01/Space-Jam.jpg?w=1280");
insert into movie_table(movie_name, image_path)values("Forever Purge", "https://variety.com/wp-content/uploads/2016/08/5-the-purge-election-year.jpg?w=700");

insert into seat_table(seat_number)values("A1");
insert into seat_table(seat_number)values("A2");
insert into seat_table(seat_number)values("A3");
insert into seat_table(seat_number)values("A4");
insert into seat_table(seat_number)values("A5");
insert into seat_table(seat_number)values("A6");
insert into seat_table(seat_number)values("A7");
insert into seat_table(seat_number)values("A8");
insert into seat_table(seat_number)values("A9");
insert into seat_table(seat_number)values("B1");
insert into seat_table(seat_number)values("B2");
insert into seat_table(seat_number)values("B3");
insert into seat_table(seat_number)values("B4");
insert into seat_table(seat_number)values("B5");
insert into seat_table(seat_number)values("B6");
insert into seat_table(seat_number)values("B7");
insert into seat_table(seat_number)values("B8");
insert into seat_table(seat_number)values("B9");

insert into seat_table(seat_number)values("C1");
insert into seat_table(seat_number)values("C2");
insert into seat_table(seat_number)values("C3");
insert into seat_table(seat_number)values("C4");
insert into seat_table(seat_number)values("C5");
insert into seat_table(seat_number)values("C6");
insert into seat_table(seat_number)values("C7");
insert into seat_table(seat_number)values("C8");
insert into seat_table(seat_number)values("C9");
insert into seat_table(seat_number)values("D1");
insert into seat_table(seat_number)values("D2");
insert into seat_table(seat_number)values("D3");
insert into seat_table(seat_number)values("D4");
insert into seat_table(seat_number)values("D5");
insert into seat_table(seat_number)values("D6");
insert into seat_table(seat_number)values("D7");
insert into seat_table(seat_number)values("D8");
insert into seat_table(seat_number)values("D9");

insert into seat_table(seat_number)values("E1");
insert into seat_table(seat_number)values("E2");
insert into seat_table(seat_number)values("E3");
insert into seat_table(seat_number)values("E4");
insert into seat_table(seat_number)values("E5");
insert into seat_table(seat_number)values("E6");
insert into seat_table(seat_number)values("E7");
insert into seat_table(seat_number)values("E8");
insert into seat_table(seat_number)values("E9");
insert into seat_table(seat_number)values("F1");
insert into seat_table(seat_number)values("F2");
insert into seat_table(seat_number)values("F3");
insert into seat_table(seat_number)values("F4");
insert into seat_table(seat_number)values("F5");
insert into seat_table(seat_number)values("F6");
insert into seat_table(seat_number)values("F7");
insert into seat_table(seat_number)values("F8");
insert into seat_table(seat_number)values("F9");

insert into seat_table(seat_number)values("G1");
insert into seat_table(seat_number)values("G2");
insert into seat_table(seat_number)values("G3");
insert into seat_table(seat_number)values("G4");
insert into seat_table(seat_number)values("G5");
insert into seat_table(seat_number)values("G6");
insert into seat_table(seat_number)values("G7");
insert into seat_table(seat_number)values("G8");
insert into seat_table(seat_number)values("G9");
insert into seat_table(seat_number)values("H1");
insert into seat_table(seat_number)values("H2");
insert into seat_table(seat_number)values("H3");
insert into seat_table(seat_number)values("H4");
insert into seat_table(seat_number)values("H5");
insert into seat_table(seat_number)values("H6");
insert into seat_table(seat_number)values("H7");
insert into seat_table(seat_number)values("H8");
insert into seat_table(seat_number)values("H9");

-- Populates movie_seat_table with available seats --
-- **REQUIRED** --
delimiter \\
create procedure populateMovieSeatTable(in movie int)
begin
declare x int default 1;
while x <= 72 do
	insert into movie_seat_table(movie_id, seat_id)values(movie, x);
	set x = x + 1;
end while;

end \\
delimiter ;

-- Call Proceudre 9 times (1 - 9) --
call populateMovieSeatTable(9);



-- set which seats are available here ('movie_id', 'movie_id', 'maximum 10, minimum 2 randomly sets what seats are available') --
-- THIS IS REQUIRED TO SET SEATS UNBOOKABLE --
call setBooked(9, 9, 2);

-- after setting booked view changes here and movie on to the next movie_id --
select * from movie_seat_table
where movie_id = 9;

delimiter \\
create procedure setBooked(in id int, in times int, in multiple int)
begin
declare x int default 0;
declare y int default 0;
set x = 72 * times;
set y = x - 72;
while y <= x do
	update movie_seat_table
	set is_available = false
	where movie_id = id and movie_seat_id = y;
    
    set y = y + multiple;
end while;
end \\
delimiter ;

select * from user_table;