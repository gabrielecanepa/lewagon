# Jukebox Livecode

Let’s recap what you discovered today about the [**Structured Query Language**](https://en.wikipedia.org/wiki/SQL). We will use a database called `Jukebox` containing some information about artists and tracks (like Spotify has) to practice some SQL queries.

## Preparation

Before you start, note that the usage of the VSCode [SQLite extension](https://marketplace.visualstudio.com/items?itemName=alexcvzz.vscode-sqlite) is recommended to help visualize the database. If you don’t have it, you can always go back to the macOS, Windows or Ubuntu dedicated section of the setup.

If you need a refresher on how to use it, check out the [dedicated cheatsheet](https://kitt.lewagon.com/knowledge/cheatsheets/vs_code_sqlite_extension).

Make sure you have the `jukebox.sqlite` database open:

- Open your command palette with `Cmd/Ctrl + Shift + P`.
- Type in `SQLite: Open Database`
- Select the `jukebox.sqlite` database

You will notice a new tab at the bottom of your file explorer called _SQLITE EXPLORER_. Keep the tab open and ready to use.

## Database Schema

Explore the database structure with the SQLite extension and complete the schema using the [Kitt DB Schema tool](https://kitt.lewagon.com/db).

You should come up with a similar version of the schema:

![Jukebox Schema](https://github.com/lewagon/fullstack-images/blob/master/db/jukebox/schema-jukebox.png?raw=true)

To see the full schema, copy and paste the content of `jukebox.xml` in the DB schema tool.

## SQL Queries

To run queries in the SQLite extension, you need to:

- Open your command palette with `Cmd/Ctrl + Shift + P`.
- Type in `SQLite: New Query`
- Write your query in the opened `.sql` file
- Once the query is ready, open your command palette again and type in `SQLite: Run Query`
- Select the database you want to run your query on

### 1. Artists’ names list

```sql
SELECT artists.name
FROM artists

-- Should yield 275 results
```

### 2. Short tracks list

Let’s count the number of tracks in the database that last **less than 2 minutes**.

```sql
SELECT COUNT(*)
FROM tracks
WHERE tracks.milliseconds < 2 * 60 * 1000

-- Should yield 93 results
```

### 3. First ten albums

Let’s get the first ten albums of the Jukebox DB, sorted alphabetically.

```sql
SELECT albums.title
FROM albums
ORDER BY albums.title ASC
LIMIT 10

--- First result should be "...And Justice For All" and last one "Ace Of Spades"
```

### 4. Tracks with a keyword

Fetch track and album information for tracks which contain a given keyword (case insensitive). Experiment with different keywords! 

```sql
SELECT tracks.name, albums.title
FROM tracks
JOIN albums ON tracks.album_id = albums.id
WHERE UPPER(tracks.name) LIKE "%music%"
```

### 5. Top 5 artists

Finally, let’s use what we’ve learned to do something a bit more advanced. In this assignment, we want to find the top five artists with the most tracks within the Rock genre.

```sql
SELECT artists.name, COUNT(*) AS track_count
FROM artists
JOIN albums ON albums.artist_id = artists.id
JOIN tracks ON tracks.album_id = albums.id
JOIN genres ON tracks.genre_id = genres.id
WHERE genres.name = "Rock"
GROUP BY artists.name
ORDER BY track_count DESC
LIMIT 5
```

## Going Further

If you want to go further, you can try to:

- Find the artist with the most tracks in the database
- Find the artist with the highest average track length
- Find the artist with the highest average track length in the Rock genre
- Find the tracks of the artist with the highest average track length in the Rock genre
- Create your own queries and share them with your classmates!
