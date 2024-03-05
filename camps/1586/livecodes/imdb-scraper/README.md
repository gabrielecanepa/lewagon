# IMDB Scraper

Write a program that scrapes the top 5 films on IMDB and dumps this information into a `movies.yml` file:

```yaml
- title: The Shawshank Redemption
  year: 1994
  duration: 2h 22m
  rating: 9.3

# etc. up to 5 movies.
```

## Setup

Download this folder to your computer with:

```sh
sh -c "$(curl -s https://raw.githubusercontent.com/gabrielecanepa/lewagon/main/download.sh)" -- camps/1586/livecodes/imdb-scraper
cd imdb-scraper
```

Run the scraper with:

```sh
ruby scraper.rb
```
