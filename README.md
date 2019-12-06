# Bookmark Manager


## User Stories

```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

As a time-pressed user
So that I may remove a site from my records
I would like to delete a bookmark of my choosing
```

## To set up the database

Connect to `psql` and create the `bookmark_manager` and `bookmark_manager_test` databases:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

## How to use the Bookmark Manager app

```
In your terminal, type rackup -p 4567
```
To view bookmarks, navigate to `localhost:4567/bookmarks`.
