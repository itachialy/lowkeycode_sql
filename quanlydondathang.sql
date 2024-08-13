create table donvi_dh(
ma_dv int primary key auto_increment,
ten_dv varchar(50),
phone int,
adress varchar(50)
);
create table donvi_kh(
ma_dv int primary key auto_increment,
ten_dv varchar(50),
adress varchar(50)
);
create table nguoi_dat(
maso_nd int primary key auto_increment,
ten_nd varchar(50)
);
create table nguoi_nhan(
maso_nn int primary key auto_increment,
ten_nn varchar(50)
);
create table hang(
ma_hang int primary key auto_increment,
ten_hang varchar(50),
dv_tinh varchar(50),
mota_hang varchar(255)
);
create table nguoi_giao(
maso_ng int primary key auto_increment,
ten_ng varchar(50)
);
create table noi_giao(
maso_ddg int primary key auto_increment,
ten_noi_giao varchar(255)
);