-- ----------------------------------BASIC QUESTIONS----------------------------------------------
#1 From the 'movie' table, write a SQL query to find the name and year of the movies. Return movie title, movie release year.


#2 From the 'movie' table, write a SQL query to find when the movie 'American Beauty' released. Return movie release year.

#3 From the 'movie' table, write a SQL query to find the movie that was released in 1999. Return movie title.

#4 From the 'movie' table, write a SQL query to find those movies, which were released before 1998. Return movie title.

#5 From the 'movie' and 'rating' tables, write a SQL query to find the name of all reviewers and movies together in a single list.

#6 From the 'movie' and 'rating' tables, write a SQL query to find all reviewers who have rated seven or more stars to their rating. 
-- Return reviewer name.

#7 From the 'movie' and 'rating' tables, write a SQL query to find the movies without any rating. Return movie title.

#8 From the 'movie' table, write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.

#9 From the 'movie' table, write a SQL query to find the movie titles that contain the word 'Boogie Nights'. 
-- Sort the result-set in ascending order by movie year. 
-- Return movie ID, movie title and movie release year.

#10 From the 'actor' table, write a SQL query to find those actors with the first name 'Woody' and the last name 'Allen'. Return actor ID.

-- ---------------------------------------SUBQUERIES Questions----------------------------------------------
#11 From the following table, write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Return all the fields of actor table.

#12 From the following tables, write a SQL query to find the director of a film that cast a role in 'Eyes Wide Shut'. Return director first name, last name.

#13 From the following table, write a SQL query to find those movies that have been released in countries other than the United Kingdom. 
-- Return movie title, movie year, movie time, and date of release, releasing country.

#14 From the following tables, write a SQL query to find for movies whose reviewer is unknown. 
-- Return movie title, year, release date, director first name, last name, actor first name, last name.

#15 From the following tables, write a SQL query to find those movies directed by the director whose first name is Woddy and last name is Allen. 
-- Return movie title.

#16 From the following tables, write a SQL query to determine those years in which there was at least one movie that received a rating of at least three stars. 
-- Sort the result-set in ascending order by movie year. Return movie year.

#17 From the following table, write a SQL query to search for movies that do not have any ratings. Return movie title.

#18 From the following table, write a SQL query to find those reviewers who have not given a rating to certain films. Return reviewer name.

#19 From the following tables, write a SQL query to find movies that have been reviewed by a reviewer and received a rating. 
-- Sort the result-set in ascending order by reviewer name, movie title, review Stars. Return reviewer name, movie title, review Stars.

#20 From the following table, write a SQL query to find movies that have been reviewed by a reviewer and received a rating. 
-- Group the result set on reviewer’s name, movie title. Return reviewer’s name, movie title.

#21 From the following tables, write a SQL query to find those movies, which have received highest number of stars. 
-- Group the result set on movie title and sorts the result-set in ascending order by movie title. 
-- Return movie title and maximum number of review stars.

#22 From the following tables, write a SQL query to find all reviewers who rated the movie 'American Beauty'. Return reviewer name.

#23 From the following table, write a SQL query to find the movies that have not been reviewed by any reviewer body other than 'Paul Monks'. Return movie title.

#24 From the following table, write a SQL query to find the movies with the lowest ratings. 
-- Return reviewer name, movie title, and number of stars for those movies.

#25 From the following tables, write a SQL query to find the movies directed by 'James Cameron'. Return movie title. 

#26 Write a query in SQL to find the movies in which one or more actors appeared in more than one film.

-- ----------------------------------------JOINS Questions---------------------------------------------------------------
#1. From the following table, write a SQL query to find all reviewers whose ratings contain a NULL value. Return reviewer name.

#2. From the following table, write a SQL query to find out who was cast in the movie 'Annie Hall'. Return actor first name, last name and role.

#3. From the following table, write a SQL query to find the director who directed a movie that featured a role in 'Eyes Wide Shut'. 
-- Return director first name, last name and movie title.

#4. From the following tables, write a SQL query to find the director of a movie that cast a role as Sean Maguire. 
-- Return director first name, last name and movie title.

#5. From the following table, write a SQL query to find out which actors have not appeared in any movies between 1990 and 2000 (Begin and end values are included.). 
-- Return actor first name, last name, movie title and release year.

#6. From the following table, write a SQL query to find the directors who have directed films in a variety of genres. 
-- Group the result set on director first name, last name and generic title. 
-- Sort the result-set in ascending order by director first name and last name. 
-- Return director first name, last name and number of genres movies.

#7. From the following table, write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.

#8. From the following tables, write a SQL query to find all the movies with year, genres, and name of the director.

#9. From the following tables, write a SQL query to find the movies released before 1st January 1989. 
-- Sort the result-set in descending order by date of release. 
-- Return movie title, release year, date of release, duration, and first and last name of the director.

#10. From the following table, write a SQL query to calculate the average movie length and count the number of movies in each genre. 
-- Return genre title, average time and number of movies for each genre.

#11. From the following table, write a SQL query to find movies with the shortest duration. 
-- Return movie title, movie year, director first name, last name, actor first name, last name and role.

#12. From the following table, write a SQL query to find the years in which a movie received a rating of 3 or 4. 
-- Sort the result in increasing order on movie year.

#13. From the following tables, write a SQL query to get the reviewer name, movie title, and stars 
-- in an order that reviewer name will come first, then by movie title, and lastly by number of stars.

#14. From the following table, write a SQL query to find those movies that have at least one rating and received the most stars. 
-- Sort the result-set on movie title. 
-- Return movie title and maximum review stars.

#15. From the following table, write a SQL query to find out which movies have received ratings. 
-- Return movie title, director first name, director last name and review stars.

#16. From the following table, write a SQL query to find movies in which one or more actors have acted in more than one film. 
-- Return movie title, actor first and last name, and the role.

#17. From the following tables, write a SQL query to find the actor whose first name is 'Claire' and last name is 'Danes'. 
-- Return director first name, last name, movie title, actor first name and last name, role.

#18. From the following table, write a SQL query to find for actors whose films have been directed by them. 
-- Return actor first name, last name, movie title and role.

#19. From the following tables, write a SQL query to find the cast list of the movie ‘Chinatown’. Return first name, last name.

#20. From the following tables, write a SQL query to find those movies where actor’s first name is 'Harrison' and last name is 'Ford'. Return movie title.

#21. From the following tables, write a SQL query to find the highest-rated movies. Return movie title, movie year, review stars and releasing country.

#22. From the following tables, write a SQL query to find the highest-rated ‘Mystery Movies’. Return the title, year, and rating.

#23. From the following tables, write a SQL query to find the years when most of the ‘Mystery Movies’ produced. 
-- Count the number of generic title and compute their average rating. Group the result set on movie release year, generic title. 
-- Return movie year, generic title, number of generic title and average rating.

#24. From the following tables, write a query in SQL to generate a report, which contain the fields 
-- movie title, name of the female actor, year of the movie, role, movie genres, the director, date of release, and rating of that movie.
