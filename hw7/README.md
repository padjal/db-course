# HW7 - Olympic games
While completing this homework, I encountered several problems, which I believe would be beneficial to be discussed.

## Db configuration
In order to test this project in your local environment, you need to configure the db. First, you need a running Postgre instance

## Migrations
Migrations turned out to be the hardest part, but I finally managed to wrap my head around them. Here's the result:

```shell
[INFO] Database: jdbc:postgresql://localhost:5432/olympic_games (PostgreSQL 14.5)
[INFO] Successfully validated 2 migrations (execution time 00:00.021s)
[INFO] Current version of schema "public": 1
[INFO] Migrating schema "public" to version "2 - add athletes participation in olympiads"
[INFO] Successfully applied 1 migration to schema "public", now at version v2 (execution time 00:00.057s)
[INFO] Flyway Community Edition 8.5.13 by Redgate
[INFO] See what's new here: https://flywaydb.org/documentation/learnmore/releaseNotes#8.5.13
[INFO] 
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  0.785 s
[INFO] Finished at: 2022-11-23T18:48:28+02:00
[INFO] ------------------------------------------------------------------------

Process finished with exit code 0
```

For the migrations, I have used the Flyway IntelliJ Idea plugin, which is based on some versioned configuration files, specifying all the new changes in each db iteration.

## Seeding
The seeder script is located in the Java project and is called `DbFaker`. You can execute it to fill the database.