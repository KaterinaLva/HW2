-- Создание таблицы Genre
CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Создание таблицы Artist
CREATE TABLE artist (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL
);

-- Создание таблицы Album
CREATE TABLE album (
    album_id SERIAL PRIMARY KEY,
    album_title VARCHAR(150) NOT NULL,
    release_year SMALLINT NOT NULL
);

-- Создание таблицы Track
CREATE TABLE track (
    track_id SERIAL PRIMARY KEY,
    track_title VARCHAR(250) NOT NULL,
    duration INTERVAL NOT NULL,
    album_id INT NOT NULL,
    CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES album(album_id) ON DELETE CASCADE
);

-- Создание таблицы Compilation (Сборник)
CREATE TABLE compilation (
    compilation_id SERIAL PRIMARY KEY,
    compilation_title VARCHAR(150) NOT NULL,
    release_year SMALLINT NOT NULL
);

-- Создание связующей таблицы Artist_Genre
CREATE TABLE artist_genre (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE,
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);

-- Создание связующей таблицы Album_Artist
CREATE TABLE album_artist (
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (album_id, artist_id),
    CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES album(album_id) ON DELETE CASCADE,
    CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE
);

-- Создание связующей таблицы Track_Compilation
CREATE TABLE track_compilation (
    track_id INT NOT NULL,
    compilation_id INT NOT NULL,
    PRIMARY KEY (track_id, compilation_id),
    CONSTRAINT fk_track FOREIGN KEY(track_id) REFERENCES track(track_id) ON DELETE CASCADE,
    CONSTRAINT fk_compilation FOREIGN KEY(compilation_id) REFERENCES compilation(compilation_id) ON DELETE CASCADE
);
