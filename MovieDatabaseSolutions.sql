use moviedatabase;

-- ----------------------------------BASIC QUESTIONS----------------------------------------------
#1 From the 'movie' table, write a SQL query to find the name and year of the movies. Return movie title, movie release year.

select mov_title, mov_year
from movie;

#2 From the 'movie' table, write a SQL query to find when the movie 'American Beauty' released. Return movie release year.

select mov_year
from movie
where mov_title = 'American Beauty';

#3 From the 'movie' table, write a SQL query to find the movie that was released in 1999. Return movie title.

select mov_title
from movie
where mov_year = 1999;

#4 From the 'movie' table, write a SQL query to find those movies, which were released before 1998. Return movie title.

select mov_title
from movie
where mov_year < 1998;

#5 From the 'movie' and 'rating' tables, write a SQL query to find the name of all reviewers and movies together in a single list.

select mov_title as TitlesandReviewers
from movie
UNION
select rev_name
from reviewer;

#6 From the 'reviwer' and 'rating' tables, write a SQL query to find all reviewers who have rated seven or more stars to their rating. 
-- Return reviewer name.

select reviewer.rev_name
from reviewer
left join rating on reviewer.rev_id = rating.rev_id
where rating.rev_stars >= 7;

#7 From the 'movie' and 'rating' tables, write a SQL query to find the movies without any rating. Return movie title.

-- using joins
select movie.mov_title
from movie
left join rating on movie.mov_id = rating.mov_id
where rating.mov_id is NULL; 

-- using subquery
select mov_title
from movie
where mov_id not in (select mov_id from rating);

#8 From the 'movie' table, write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.

select mov_title
from movie
where mov_id in (905, 907, 917);

#9 From the 'movie' table, write a SQL query to find the movie titles that contain the word 'Boogie Nights'. 
-- Sort the result-set in ascending order by movie year. 
-- Return movie ID, movie title and movie release year.

select mov_id, mov_title, mov_year
from movie
where mov_title like '%Boogie Nights%'
order by mov_year;

#10 From the 'actor' table, write a SQL query to find those actors with the first name 'Woody' and the last name 'Allen'. Return actor ID.

select act_id
from actor
where act_fname = 'Woody' and act_lname = 'Allen';


-- ---------------------------------------SUBQUERIES Questions----------------------------------------------
#11 From the following table, write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Return all the fields of actor table.

select * 
from actor as a
where a.act_id in (select act_id 
					from movie_cast 
					where mov_id in (select mov_id
									from movie
									where mov_title = 'Annie Hall'));
												

#12 From the following tables, write a SQL query to find the director of a film that cast a role in 'Eyes Wide Shut'. Return director first name, last name.

select d.dir_fname, d.dir_lname
from director as d
where d.dir_id in (select dir_id 
					from movie_direction as md
					where md.mov_id in (select mov_id
										from movie 
										where mov_title = 'Eyes Wide Shut'));

#13 From the following table, write a SQL query to find those movies that have been released in countries other than the United Kingdom. 
-- Return movie title, movie year, movie time, and date of release, releasing country.

select m.mov_title, m.mov_year, m.mov_time, m.mov_dt_rel, m.mov_rel_country
from movie as m 
where m.mov_rel_country <> 'UK';

#14 From the following tables, write a SQL query to find for movies whose reviewer is unknown. 
-- Return movie title, year, release date, director first name, last name, actor first name, last name.

select m.mov_title, m.mov_year, m.mov_dt_rel, d.dir_fname, d.dir_lname, a.act_fname, a.act_lname
from actor as a, movie_cast as mc, movie as m, movie_direction as md, director as d, rating as r, reviewer as rev
where a.act_id = mc.act_id
and mc.mov_id = m.mov_id
and m.mov_id = md.mov_id
and md.dir_id = d.dir_id
and m.mov_id = r.mov_id
and r.rev_id = rev.rev_id
and rev.rev_name is NULL;

#15 From the following tables, write a SQL query to find those movies directed by the director whose first name is Woddy and last name is Allen. 
-- Return movie title.

select m.mov_title
from movie as m
where m.mov_id in (select mov_id
					from movie_direction as md
					where md.dir_id in (select dir_id
										from director as d
										where d.dir_fname = 'Woody' and d.dir_lname = 'Allen'));

#16 From the following tables, write a SQL query to determine those years in which there was at least one movie that received a rating of at least three stars. 
-- Sort the result-set in ascending order by movie year. Return movie year.

select distinct m.mov_year
from movie as m, rating as r
where m.mov_id in (select mov_id 
					from rating 
                    where rev_stars > 3)
order by m.mov_year asc;

#17 From the following table, write a SQL query to search for movies that do not have any ratings. Return movie title.

select m.mov_title
from movie as m
where m.mov_id in (select mov_id 
					from rating
                    where num_o_ratings is NULL);

#18 From the following table, write a SQL query to find those reviewers who have not given a rating to certain films. Return reviewer name.

select rev.rev_name
from reviewer as rev
where rev.rev_id in (select rev_id 
						from rating
                        where rev_stars is NULL);
                        
#19 From the following tables, write a SQL query to find movies that have been reviewed by a reviewer and received a rating. 
-- Sort the result-set in ascending order by reviewer name, movie title, review Stars. 
-- Return reviewer name, movie title, review Stars.

select rev.rev_name, m.mov_title, r.rev_stars
from movie as m, rating as r, reviewer as rev
where m.mov_id = r.mov_id
and r.rev_id = rev.rev_id
and rev.rev_name is NOT NULL 
and r.rev_stars is NOT NULL
order by rev.rev_name, m.mov_title, r.rev_stars;

#20 From the following table, write a SQL query to find those reviewers who rated more than one movie. 
-- Group the result set on reviewer’s name, movie title. 
-- Return reviewer’s name, movie title.  

-- (question is kind of ambiguous and group by conditions are wierd)

select rev.rev_name, m.mov_title
from movie as m, rating as r, reviewer as rev
where m.mov_id = r.mov_id
and r.rev_id = rev.rev_id
and r.rev_id in (select rev_id 
				from rating
				group by rev_id having count(rev_id) > 1);
                        

#21 From the following tables, write a SQL query to find those movies, which have received highest number of stars. 
-- Group the result set on movie title and sorts the result-set in ascending order by movie title. 
-- Return movie title and maximum number of review stars.

select m.mov_title, max(r.rev_stars)
from movie as m, rating as r
where m.mov_id = r.mov_id and r.rev_stars is NOT NULL
group by m.mov_title
order by m.mov_title;
                        
#22 From the following tables, write a SQL query to find all reviewers who rated the movie 'American Beauty'. Return reviewer name.

select rev.rev_name
from movie as m, rating as r, reviewer as rev
where m.mov_id = r.mov_id
and r.rev_id = rev.rev_id
and m.mov_title = 'American Beauty';

#23 From the following table, write a SQL query to find the movies that have not been reviewed by any reviewer body other than 'Paul Monks'. Return movie title.

-- M1
select m.mov_title
from movie as m, rating as r, reviewer as rev
where m.mov_id = r.mov_id
and r.rev_id = rev.rev_id
and rev.rev_name <> 'Paul Monks';          

-- M2
select m.mov_title
from movie as m
where m.mov_id in (select mov_id 
					from rating as r
                    where r.rev_id in (select rev_id 
										from reviewer as rev
										where rev.rev_name <> 'Paul Monks'));
                                            

-- M3                                            
select m.mov_title
from movie as m
where m.mov_id in (select mov_id 
					from rating as r
                    where r.rev_id not in (select rev_id 
											from reviewer as rev
                                            where rev.rev_name = 'Paul Monks'));
                                            
-- M1 and M2 give similar solution but M3 gives a different solution
-- -------------------------------------------------------------------

#24 From the following table, write a SQL query to find the movies with the lowest ratings. 
-- Return reviewer name, movie title, and number of stars for those movies.

select rev.rev_name, m.mov_title, r.rev_stars
from movie as m, rating as r, reviewer as rev
where m.mov_id = r.mov_id
and r.rev_id = rev.rev_id
and r.rev_stars = (select min(rev_stars) from rating);

#25 From the following tables, write a SQL query to find the movies directed by 'James Cameron'. Return movie title. 

-- M1
select m.mov_title
from movie as m, movie_direction as md, director as d
where m.mov_id = md.mov_id
and md.dir_id = d.dir_id
and d.dir_fname = 'James' and d.dir_lname = 'Cameron';

-- M2
select mov_title
from movie
where mov_id in (select mov_id 
				from movie_direction 
				where dir_id in (select dir_id 
									from director as d
									where d.dir_fname = 'James' and d.dir_lname = 'Cameron'));


#26 Write a query in SQL to find the movies in which one or more actors appeared in more than one film.

select m.mov_title
from movie_cast as mc, movie as m
where mc.mov_id = m.mov_id
and mc.act_id in (select act_id 
				from movie_cast 
				group by act_id having count(act_id) > 1);
                        
                        
-- ----------------------------------------JOINS Questions---------------------------------------------------------------
#1. From the following table, write a SQL query to find all reviewers whose ratings contain a NULL value. Return reviewer name.

select reviewer.rev_name
from reviewer
inner join rating on rating.rev_id = reviewer.rev_id
where rating.rev_stars is NULL; 

#2. From the following table, write a SQL query to find out who was cast in the movie 'Annie Hall'. Return actor first name, last name and role.

select a.act_fname, a.act_lname, mc.role
from actor as a
join movie_cast as mc on a.act_id = mc.act_id
join movie as m on m.mov_id = mc.mov_id
where m.mov_title = 'Annie Hall';

#3. From the following table, write a SQL query to find the director who directed a movie that featured a role in 'Eyes Wide Shut'. 
-- Return director first name, last name and movie title.

select d.dir_fname, d.dir_lname, m.mov_title
from director as d
join movie_direction as md on d.dir_id = md.dir_id
join movie as m on md.mov_id = m.mov_id
where m.mov_title = 'Eyes Wide Shut';

#4. From the following tables, write a SQL query to find the director of a movie that cast a role as Sean Maguire. 
-- Return director first name, last name and movie title.

select d.dir_fname, d.dir_lname, m.mov_title
from director as d
join movie_direction as md on d.dir_id = md.dir_id
join movie as m on m.mov_id = md.mov_id
join movie_cast as mc on m.mov_id = mc.mov_id
where mc.role = 'Sean Maguire';  

#5. From the following table, write a SQL query to find out which actors have not appeared in any movies between 1990 and 2000 (Begin and end values are included.). 
-- Return actor first name, last name, movie title and release year.

select a.act_fname, a.act_lname, m.mov_title, m.mov_year
from actor as a
join movie_cast as mc on a.act_id = mc.act_id
join movie as m on mc.mov_id = m.mov_id
where m.mov_year not between 1990 and 2000;

#6. From the following table, write a SQL query to find the directors who have directed films in a variety of genres. 
-- Group the result set on director first name, last name and generic title. 
-- Sort the result-set in ascending order by director first name and last name. 
-- Return director first name, last name and number of genres movies.

select d.dir_fname, d.dir_lname, g.gen_title, count(g.gen_title)
from director as d
join movie_direction as md on d.dir_id = md.dir_id
join movie as m on md.mov_id = m.mov_id
join movie_genres as mg on m.mov_id = mg.mov_id
join genres as g on mg.gen_id = g.gen_id
group by d.dir_fname, d.dir_lname, g.gen_title
order by d.dir_fname asc, d.dir_lname asc;

#7. From the following table, write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.

select m.mov_title, m.mov_year, g.gen_title
from movie as m
join movie_genres as mg on m.mov_id = mg.mov_id
join genres as g on mg.gen_id = g.gen_id;

#8. From the following tables, write a SQL query to find all the movies with year, genres, and name of the director.

select m.mov_title, m.mov_year, g.gen_title, concat(d.dir_fname,' ', d.dir_lname) as Director_name
from genres as g
join movie_genres as mg on g.gen_id = mg.gen_id
join movie as m on mg.mov_id = m.mov_id
join movie_direction as md on m.mov_id = md.mov_id
join director as d on md.dir_id = d.dir_id;

#9. From the following tables, write a SQL query to find the movies released before 1st January 1989. 
-- Sort the result-set in descending order by date of release. 
-- Return movie title, release year, date of release, duration, and first and last name of the director.

select m.mov_title, m.mov_year, m.mov_dt_rel, m.mov_time, d.dir_fname, d.dir_lname
from movie as m
join movie_direction as md on m.mov_id = md.mov_id
join director as d on md.dir_id = d.dir_id
where m.mov_dt_rel < '1989.01.01'
order by m.mov_dt_rel desc;   -- dateformat in the uploaded tables doesn't match with the date format of sql

#10. From the following table, write a SQL query to calculate the average movie length and count the number of movies in each genre. 
-- Return genre title, average time and number of movies for each genre.

select g.gen_title, avg(m.mov_time) as avg_time, count(mov_title) as MovieCount
from genres as g
join movie_genres as mg on g.gen_id = mg.gen_id
join movie as m on mg.mov_id = m.mov_id
group by g.gen_title;

#11. From the following table, write a SQL query to find movies with the shortest duration. 
-- Return movie title, movie year, director first name, last name, actor first name, last name and role.

select m.mov_title, m.mov_year, d.dir_fname, d.dir_lname, a.act_fname, a.act_lname, mc.role
from actor as a
join movie_cast as mc on a.act_id = mc.act_id
join movie as m on mc.mov_id = m.mov_id
join movie_direction as md on m.mov_id = md.mov_id
join director as d on md.dir_id = d.dir_id
where m.mov_time = (select min(mov_time) from movie);

#12. From the following table, write a SQL query to find the years in which a movie received a rating of 3 or 4. 
-- Sort the result in increasing order on movie year.

select distinct m.mov_year
from movie as m
join rating as r on m.mov_id = r.mov_id
where r.rev_stars in (3, 4)
order by m.mov_year asc;

#13. From the following tables, write a SQL query to get the reviewer name, movie title, and stars 
-- in an order that reviewer name will come first, then by movie title, and lastly by number of stars.

select rev.rev_name, m.mov_title, r.rev_stars
from movie as m
join rating as r on m.mov_id = r.mov_id
join reviewer as rev on r.rev_id = rev.rev_id
where rev.rev_name is NOT NULL
order by rev.rev_name, m.mov_title, r.rev_stars;


#14. From the following table, write a SQL query to find those movies that have at least one rating and received the most stars. 
-- Sort the result-set on movie title. 
-- Return movie title and maximum review stars.

select m.mov_title, r.rev_stars
from movie as m
join rating as r on m.mov_id = r.mov_id
where r.rev_stars >= 1
order by m.mov_title;

#15. From the following table, write a SQL query to find out which movies have received ratings. 
-- Return movie title, director first name, director last name and review stars.

select m.mov_title, d.dir_fname, d.dir_lname, r.rev_stars
from rating as r
join movie as m on r.mov_id = m.mov_id
join movie_direction as md on m.mov_id = md.mov_id
join director as d on md.dir_id = d.dir_id 
where r.rev_stars > 0;

#16. From the following table, write a SQL query to find movies in which one or more actors have acted in more than one film. 
-- Return movie title, actor first and last name, and the role.

select m.mov_title, a.act_fname, a.act_lname, mc.role
from actor as a
join movie_cast as mc on a.act_id = mc.act_id
join movie as m on mc.mov_id = m.mov_id
where a.act_id in (select act_id 
					from movie_cast
					group by act_id 
                    having count(act_id) > 1);


#17. From the following tables, write a SQL query to find the actor whose first name is 'Claire' and last name is 'Danes'. 
-- Return director first name, last name, movie title, actor first name and last name, role.

select d.dir_fname, d.dir_lname, m.mov_title, a.act_fname, a.act_lname, mc.role
from actor as a
join movie_cast as mc on a.act_id = mc.act_id
join movie as m on mc.mov_id = m.mov_id
join movie_direction as md on m.mov_id = md.mov_id
join director as d on md.dir_id = d.dir_id
where a.act_fname = 'Claire' and a.act_lname = 'Danes';

#18. From the following table, write a SQL query to find for actors whose films have been directed by them. 
-- Return actor first name, last name, movie title and role.

select a.act_fname, a.act_lname, m.mov_title, mc.role
from actor as a
join movie_cast as mc on a.act_id = mc.act_id
join movie as m on mc.mov_id = m.mov_id
join movie_direction as md on m.mov_id = md.mov_id
join director as d on md.dir_id = d.dir_id
where a.act_fname = d.dir_fname and a.act_lname = d.dir_lname;

#19. From the following tables, write a SQL query to find the cast list of the movie ‘Chinatown’. Return first name, last name.

select a.act_fname, a.act_lname
from actor as a
join movie_cast as mc on a.act_id = mc.act_id
join movie as m on mc.mov_id = m.mov_id
where m.mov_title = 'Chinatown';

#20. From the following tables, write a SQL query to find those movies where actor’s first name is 'Harrison' and last name is 'Ford'. Return movie title.

select m.mov_title
from actor as a
join movie_cast as mc on a.act_id = mc.act_id
join movie as m on mc.mov_id = m.mov_id
where a.act_fname = 'Harrison' and a.act_lname = 'Ford';

#21. From the following tables, write a SQL query to find the highest-rated movies. Return movie title, movie year, review stars and releasing country.

select m.mov_title, m.mov_year, r.rev_stars, m.mov_rel_country
from rating as r
join movie as m on r.mov_id = m.mov_id
where r.rev_stars in (select max(rev_stars) from rating);

#22. From the following tables, write a SQL query to find the highest-rated ‘Mystery Movies’. Return the title, year, and rating.

select m.mov_title, m.mov_year, r.rev_stars
from genres as g
join movie_genres as mg on g.gen_id = mg.gen_id
join movie as m on mg.mov_id = m.mov_id
join rating as r on m.mov_id = r.mov_id
where g.gen_title = 'Mystery' and rev_stars in (select max(r.rev_stars)
                                                from rating as r 
                                                join movie_genres as mg on r.mov_id = mg.mov_id
                                                join genres as g on mg.gen_id = g.gen_id
                                                where g.gen_title = 'Mystery');

#23. From the following tables, write a SQL query to find the years when most of the ‘Mystery Movies’ produced. 
-- Count the number of generic title and compute their average rating. Group the result set on movie release year, generic title. 
-- Return movie year, generic title, number of generic title and average rating.

select m.mov_year, g.gen_title, count(g.gen_title), avg(r.rev_stars)
from genres as g
join movie_genres as mg on g.gen_id = mg.gen_id
join movie as m on mg.mov_id = m.mov_id
join rating as r on m.mov_id = r.mov_id
where g.gen_title = 'Mystery'
group by m.mov_year, g.gen_title;

#24. From the following tables, write a query in SQL to generate a report, which contain the fields 
-- movie title, name of the female actor, year of the movie, role, movie genres, the director, date of release, and rating of that movie.

select m.mov_title, a.act_fname, a.act_lname, m.mov_year, mc.role, g.gen_title, d.dir_fname, d.dir_lname, m.mov_dt_rel, r.rev_stars
from actor as a
join movie_cast as mc on a.act_id = mc.act_id
join movie as m on mc.mov_id = m.mov_id
join movie_direction as md on m.mov_id = md.mov_id
join director as d on md.dir_id = d.dir_id
join movie_genres as mg on m.mov_id = mg.mov_id
join genres as g on mg.gen_id = g.gen_id
join rating as r on m.mov_id = r.mov_id
where a.act_gender = 'F';