create schema if not exists music;

create table if not exists music.singer (
    id serial primary key,
    name varchar(50)
);

create table if not exists music.genre (
    id serial primary key,
    name varchar(70)
);

create table if not exists music.singer_genre (
  id serial primary key,
  singer_id integer not null references music.singer(id),
  genre_id integer not null references music.genre(id)

);

create table if not exists music.album (
    id serial primary key,
    name varchar(80),
    release_year integer
);

create table if not exists music.singer_album (
    id serial primary key,
    singer_id integer not null references music.singer(id),
    album_id integer not null references music.album(id)
);

create table if not exists music.track (
    id serial primary key,
    name varchar(75),
    duration_m numeric(3, 2) check (duration_m > 0),
    album_id integer not null references music.album(id)
);

create table if not exists music.collection (
    id serial primary key,
    name varchar(85),
    release_year integer
);

create table if not exists music.track_collection (
    id serial primary key,
    track_id integer not null references music.track(id),
    collection_id integer not null references music.collection(id)
);
