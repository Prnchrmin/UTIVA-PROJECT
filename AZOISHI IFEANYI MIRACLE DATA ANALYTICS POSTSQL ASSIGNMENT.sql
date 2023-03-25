AZOISHI IFEANYI MIRACLE DATA ANALYTICS POSTGRESQL ASSIGNMENT 2
/* DAMILARE'S COMMENT:
	    What you have done wuld show each team and their corresponing total games played
	    ayou then tried to use the MAX fctn to get the team with the highest game played 
	    but this would only return the highest game played per team.
	    
	    we would be correcting this in class.
	    
	    Great technique trying to sort by games played in DESC order
*/

--  Q1. How many countries have played in the world cup(5 Years)?

WITH
	all_world_cup AS (
		SELECT
        'wc 2002' AS worldcupyear,
        team,
        points
    FROM
        fifa_2002
    UNION ALL
    SELECT
        'wc 2006' AS worldcupyear,
        team,
        points
    FROM
        fifa_2006
    UNION ALL
    SELECT
        'wc 2010' AS worldcupyear,
        team,
        points
    FROM
        fifa_2010
    UNION ALL
    SELECT
        'wc 2014' AS worldcupyear,
        team,
        points
    FROM
        fifa_2014
    UNION ALL
    SELECT
        'wc 2018' AS worldcupyear,
        team,
        points
    FROM
        fifa_2018
        )

SELECT
	COUNT(DISTINCT team)
FROM
	all_world_cup
;


--Q2. Get the total games played, win, loss, Goals for/against. 


    WITH 
        alWl_world_cup AS (
        SELECT
        'wc 2002' AS worldcupyear,
        team,
        points,
        games_played,
        win,
        loss,
        goals_for,
        goals_against
    FROM
        fifa_2002
    UNION ALL
    SELECT 
        'wc 2006' AS worldcupyear,
        team,
        points,
        games_played,
        win,
        loss,
        goals_for,
        goals_against
    FROM
        FIFA_2006
    UNION ALL
        SELECT 
        'wc 2010' AS worldcupyear,
        team,
        points,
        games_played,
        win,
        loss,
        goals_for,
        goals_against
    FROM
        FIFA_2010
    UNION ALL
        SELECT 
        'wc 2014' AS worldcupyear,
        team,
        points,
        games_played,
        win,
        loss,
        goals_for,
        goals_against
    FROM
        FIFA_2014
    UNION ALL
        SELECT 
        'wc 2018' AS worldcupyear,
        team,
        points,
        games_played,
        win,
        loss,
        goals_for,
        goals_against
    FROM
        FIFA_2018
        )
    SELECT
        SUM(games_played) AS total_games_played,
        SUM(win) AS total_win,
        SUM(loss) AS total_loss,
        SUM(goals_for) AS total_goals_for,
        SUM(goals_against) AS total_goals_against
    FROM 
        all_world_cup;


-- Q3-The country with the highest and lowest appearance in the last five years?
    WITH
        all_world_cup AS (
        SELECT
        'wc 2002' AS worldcupyear,
        team,
        position
    FROM 
        fifa_2002
    UNION ALL
    SELECT 
        'wc 2006' AS worldcupyear,
        team,
        position
    FROM
        fifa_2006
    UNION ALL
    SELECT
        'wc 2010' AS worldcupyear,
        team,
        position
    FROM	
        fifa_2010
    UNION ALL
    SELECT
        'wc 2014' AS worldcupyear,
        team,
        position
    FROM
        fifa_2014
    UNION ALL
    SELECT 
        'wc 2018' AS worldcupyear,
        team,
        position
    FROM
        fifa_2018
        )
    SELECT
        team,
        SUM(position),
        MAX(position),
        MIN(position)
    FROM
        all_world_cup
    GROUP BY 
        team
    ORDER BY
        SUM(position) DESC;

	
--Q4- The country with the highest and lowest games_played?
    WITH
        all_world_cup AS (
        SELECT
        'wc 2002' AS worldcupyear,
        team,
        games_played
    FROM 
        fifa_2002
    UNION ALL
    SELECT 
        'wc 2006' AS worldcupyear,
        team,
        games_played
    FROM
        fifa_2006
    UNION ALL
    SELECT
        'wc 2010' AS worldcupyear,
        team,
        games_played
    FROM	
        fifa_2010
    UNION ALL
    SELECT
        'wc 2014' AS worldcupyear,
        team,
        games_played
    FROM
        fifa_2014
    UNION ALL
    SELECT 
        'wc 2018' AS worldcupyear,
        team,
        games_played
    FROM
        fifa_2018
        )
    SELECT
        team,
        SUM(games_played),
        MAX(games_played),
        MIN(games_played)
    FROM
        all_world_cup
    GROUP BY 
        team
    ORDER BY
        SUM(games_played) DESC;


-- Q5- The country with the highest and lowest games_won?

    WITH
        all_world_cup AS (
        SELECT
        'wc 2002' AS worldcupyear,
        team,
        win
    FROM 
        fifa_2002
    UNION ALL
    SELECT 
        'wc 2006' AS worldcupyear,
        team,
        win
    FROM
        fifa_2006
    UNION ALL
    SELECT
        'wc 2010' AS worldcupyear,
        team,
        win
    FROM	
        fifa_2010
    UNION ALL
    SELECT
        'wc 2014' AS worldcupyear,
        team,
        win
    FROM
        fifa_2014
    UNION ALL
    SELECT 
        'wc 2018' AS worldcupyear,
        team,
        win
    FROM
        fifa_2018
        )
    SELECT
        team,
        SUM(win) AS games_won,
        MAX(win) AS games_won,
        MIN(win) AS games_won  
    FROM
        all_world_cup
    GROUP BY 
        team
    ORDER BY
        SUM(win) DESC;
	


	
-- Q6- The country with the highest and lowest games_lost?

    WITH
        all_world_cup AS (
        SELECT
        'wc 2002' AS worldcupyear,
        team,
        loss
    FROM 
        fifa_2002
    UNION ALL
    SELECT 
        'wc 2006' AS worldcupyear,
        team,
        loss
    FROM
        fifa_2006
    UNION ALL
    SELECT
        'wc 2010' AS worldcupyear,
        team,
        loss
    FROM	
        fifa_2010
    UNION ALL
    SELECT
        'wc 2014' AS worldcupyear,
        team,
        loss
    FROM
        fifa_2014
    UNION ALL
    SELECT 
        'wc 2018' AS worldcupyear,
        team,
        loss
    FROM
        fifa_2018
        )
    SELECT
        team,
        SUM(loss) AS games_lost,
        MAX(loss) AS games_lost,
        MIN(loss) AS games_lost  
    FROM
        all_world_cup
    GROUP BY 
        team
    ORDER BY
        SUM(loss) DESC;
	

--Q7- The country with the highest and lowest games for?
        
        WITH
            all_world_cup AS (
            SELECT
            'wc 2002' AS worldcupyear,
            team,
            goals_for
        FROM 
            fifa_2002
        UNION ALL
        SELECT 
            'wc 2006' AS worldcupyear,
            team,
            goals_for
        FROM
            fifa_2006
        UNION ALL
        SELECT
            'wc 2010' AS worldcupyear,
            team,
            goals_for
        FROM	
            fifa_2010
        UNION ALL
        SELECT
            'wc 2014' AS worldcupyear,
            team,
            goals_for
        FROM
            fifa_2014
        UNION ALL
        SELECT 
            'wc 2018' AS worldcupyear,
            team,
            goals_for
        FROM
            fifa_2018
            )
        SELECT
            team,
            SUM(goals_for),
            MAX(goals_for), 
            MIN(goals_for)
        FROM
            all_world_cup
        GROUP BY 
            team
        ORDER BY
            SUM(goals_for) DESC;
        
            
        
    -- Q8- The country with the highest and lowest goals_agaisnt?

    WITH
        all_world_cup AS (
        SELECT
        'wc 2002' AS worldcupyear,
        team,
        goals_against
    FROM 
        fifa_2002
    UNION ALL
    SELECT 
        'wc 2006' AS worldcupyear,
        team,
        goals_against
    FROM
        fifa_2006
    UNION ALL
    SELECT
        'wc 2010' AS worldcupyear,
        team,
        goals_against
    FROM	
        fifa_2010
    UNION ALL
    SELECT
        'wc 2014' AS worldcupyear,
        team,
        goals_against
    FROM
        fifa_2014
    UNION ALL
    SELECT 
        'wc 2018' AS worldcupyear,
        team,
        goals_against
    FROM
        fifa_2018
        )
    SELECT
        team,
        SUM(goals_against),
        MAX(goals_against), 
        MIN(goals_against)
    FROM
        all_world_cup
    GROUP BY 
        team
    ORDER BY
        SUM(goals_against) DESC,
        MAX(goals_against) DESC,
        MIN(goals_against) DESC
	

  -- Q9- The country with the highest and lowest goals_difference?
    WITH
        all_world_cup AS (
        SELECT
        'wc 2002' AS worldcupyear,
        team,
        goal_difference
    FROM 
        fifa_2002
    UNION ALL
    SELECT 
        'wc 2006' AS worldcupyear,
        team,
        goal_difference
    FROM
        fifa_2006
    UNION ALL
    SELECT
        'wc 2010' AS worldcupyear,
        team,
        goal_difference
    FROM	
        fifa_2010
    UNION ALL
    SELECT
        'wc 2014' AS worldcupyear,
        team,
        goal_difference
    FROM
        fifa_2014
    UNION ALL
    SELECT 
        'wc 2018' AS worldcupyear,
        team,
        goal_difference
    FROM
        fifa_2018
        )
    SELECT
        team,
        SUM(goal_difference),
        MAX(goal_difference), 
        MIN(goal_difference)
    FROM
        all_world_cup
    GROUP BY 
        team
    ORDER BY
        SUM(goal_difference) DESC,
        MAX(goal_difference) DESC,
        MIN(goal_difference) DESC
	
	

--Q10- The country with the highest and lowest point?

    WITH
        all_world_cup AS (
        SELECT
        'wc 2002' AS worldcupyear,
        team,
        points
    FROM 
        fifa_2002
    UNION ALL
    SELECT 
        'wc 2006' AS worldcupyear,
        team,
        points
    FROM
        fifa_2006
    UNION ALL
    SELECT
        'wc 2010' AS worldcupyear,
        team,
        points
    FROM	
        fifa_2010
    UNION ALL
    SELECT
        'wc 2014' AS worldcupyear,
        team,
        points
    FROM
        fifa_2014
    UNION ALL
    SELECT 
        'wc 2018' AS worldcupyear,
        team,
        points
    FROM
        fifa_2018
        )
    SELECT
        team,
        SUM(points),
        MAX(points), 
        MIN(points)
    FROM
        all_world_cup
    GROUP BY 
        team
    ORDER BY
        SUM(points) DESC;
