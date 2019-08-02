# bliss-makers :sparkles: :man: :woman: :woman: :man: :sparkles:


1. [Makers BnB Instructions](https://github.com/makersacademy/course/tree/master/makersbnb#turning-a-specification-into-user-stories)
   - [Project Setup](https://github.com/makersacademy/course/tree/master/makersbnb#project-setup)
   - [XP Values](https://github.com/makersacademy/course/tree/master/makersbnb#xp-values)
   - [Development Workflow](https://github.com/makersacademy/course/blob/master/pills/development_workflow.md)
 2. [Workshop Video](https://drive.google.com/open?id=18oBTHQp5m0-5uDq9mcvfIon4jB4A_auv)
 3. [ERD Tutorial](https://www.youtube.com/watch?v=QpdhBUYk7Kk&list=WL&index=9&t=65s)

# User Stories
```
As a user
So I can make money from my property
I want to be able to list the property on the site - including name of space, description of space and price per night

As a user
So I can book a holiday home
I want to be able to see the listings

As a user
So the property is free to use
I can offer a range of dates where the space is available

As a user
So I can go on holiday
I want to be able to request to stay at a space for one night

As a homeowner
So I can approve a request
I want to be able to approve a request to use the space

As a holidaymaker
So I can book somewhere that is available
I will not be able to book somewhere that is not available

As a user
So I can access the site
I want to be able to sign up

As a user
So I can access the site
I want to be able to sign in

As a user
So I can leave the site
I want to be able to sign out

As a user
So I can make even more money
I want to be able to list multiple spaces

As a holidaymaker
So I can book a place to stay
I will still be able to book somewhere that has not yet been confirmed by the owner
```
# Setting up Databases
## Database ```bliss```
1. Use Homebrew to install the package in Terminal -> ```brew install postgresql```
2. Connect to ```psql``` in Terminal -> ```psql postgres```
3. Create a databse ```bliss``` -> ```CREATE DATABASE bliss;```
4. List all available databases to check that ```bliss``` database was added -> ```\l;```
5. Connect to ```bliss``` to check that there is a connection -> ```\c bliss;```
6. Quit ```psql``` -> ```\q;```
7. Open TablePlus and open ```bliss``` database by clicking on ```create a new connection``` tab on the bottom left.
8. Add a new table named ```users``` to ```bliss``` database.
9. Add ```user_name```, ```email```, ```password``` to **column_name**. Add ```varchar(60)```, ```varchar(120)```, ```varchar(120)``` to **data_type** respectively.
10. Add a new table named ```spaces``` to ```bliss``` database.
11. Add ```space_name```, ```description```, ```price``` to **column_name**. Add ```varchar(120)```, ```varchar(500)```, ```int4``` to **data_type** respectively.
12. Add a new table named ```requests``` to ```bliss``` database.
13. Add ```user_id```, ```space_id```, ```check_in```, ```confirmed``` to **column_name**. Add ```int4```, ```int4```, ```date```, ```bool``` to **data_type** respectively.
14. Add a FOREIGN KEY to ```spaces``` -> add ```user_id``` to **column_name** on row 5, add ```int4``` to **data_type**, press ```->``` in **foreign_key** column on row 5. Write ```user_id``` in ```Columns```, ```id``` in ```Referenced Columns```, select ```users``` in ```Referenced Table```.
15. Add FOREIGN KEYS ```requests``` -> add a foreign key to ```user_id``` and ```space_id```. (See images below for reference)
16. Upload/Save all the changes.
## Database ```bliss_test```
1. Connect to ```psql``` in Terminal -> ```psql postgres```
3. Create a databse ```bliss_test``` -> ```CREATE DATABASE bliss_test;```
4. List all available databases to check that ```bliss_test``` database was added -> ```\l;```
5. Connect to ```bliss_test``` to check that there is a connection -> ```\c bliss_test;```
6. Quit ```psql``` -> ```\q;```
7. Open TablePlus and open ```bliss_test``` database by clicking on ```create a new connection``` tab on the bottom left.
8. Add a new table named ```users``` to ```bliss_test``` database.
9. Add ```user_name```, ```email```, ```password``` to **column_name**. Add ```varchar(60)```, ```varchar(120)```, ```varchar(120)``` to **data_type** respectively.
10. Add a new table named ```spaces``` to ```bliss_test``` database.
11. Add ```space_name```, ```description```, ```price``` to **column_name**. Add ```varchar(120)```, ```varchar(500)```, ```int4``` to **data_type** respectively.
12. Add a new table named ```requests``` to ```bliss_test``` database.
13. Add ```user_id```, ```space_id```, ```check_in```, ```confirmed``` to **column_name**. Add ```int4```, ```int4```, ```date```, ```bool``` to **data_type** respectively.
14. Add a FOREIGN KEY to ```spaces``` -> add ```user_id``` to **column_name** on row 5, add ```int4``` to **data_type**, press ```->``` in **foreign_key** column on row 5. Write ```user_id``` in ```Columns```, ```id``` in ```Referenced Columns```, select ```users``` in ```Referenced Table```.
15. Add FOREIGN KEYS ```requests``` -> add a foreign key to ```user_id``` and ```space_id```. (See images below for reference)
16. Upload/Save all the changes.

```users``` table reference:
<img width="850" alt="users table" src="https://user-images.githubusercontent.com/42152431/62059827-de99e700-b21b-11e9-95a6-e35a2e98aade.png">

```spaces``` table reference:
<img width="890" alt="spaces table" src="https://user-images.githubusercontent.com/42152431/62059825-de99e700-b21b-11e9-88e8-562cbff99012.png">

```requests``` table reference:
<img width="995" alt="requests" src="https://user-images.githubusercontent.com/42152431/62363998-574cbc00-b518-11e9-9177-87910824b39b.png">

Foreign Key ```spaces``` table:
<img width="388" alt="foreign key in spaces table" src="https://user-images.githubusercontent.com/42152431/62059824-de99e700-b21b-11e9-89aa-00b695548a75.png">

Foreign Key ```requests``` table, ```user_id```:
<img width="388" alt="fk user_id" src="https://user-images.githubusercontent.com/42152431/62363997-574cbc00-b518-11e9-9403-04dbb5aece1f.png">

Foreign Key ```requests``` table, ```space_id```:
<img width="390" alt="fk space_d" src="https://user-images.githubusercontent.com/42152431/62363996-574cbc00-b518-11e9-9795-2a71dd1e9ee2.png">


# Progress Tracking
- 9:30am - StandUp (setting daily goals, raising issues)
- 2:00pm - StandUp (checking in, chat about what went well, setting goals for the rest of the afternoon)
- 4:30pm - Retro (Feedback)

## Monday (29.07)
### Meeting 1
- Deciding what tech to use (Sinatra Framework, Ruby for backend, ORM - Datamapper)
- Writing out user stories
- Creating issues for each user story, feature, etc.
- Assigning pairs (Ben & Genny, Kareem & Anastasiia)
- Setting up all the files for the project - FRAMEWORK
### Afternoon Meeting
- Talk about databases, decide what ORM to use for the project
- Assign tasks (Anstasiia - record the database setup instructions, Genny & Kareem - research DataMapper and add it to the project, Ben - work on Controller and View)
### Retro
- Really bad times with DataMapper (setting up, configuring) -> will speak to one of the coaches on Tuesday morning.
- Pretty sick README. 
- View has been set up.
- ***WHAT WENT WELL:*** stunning View, cool README, great planning, created identical databases together to avoid any potential issues with it in a future.
- ***WHAT DID NOT GO SO WELL AND/OR RAISED QUESTIONS:*** branching and merging without crashing -> will speak to the coach to double check.

**EVERYONE IS HAPPY! :yellow_heart: :blue_heart: :purple_heart: :star: :boom: :fire:**


## Tuesday (30.07)
### Morning StandUp 
- assigned pairs (Genny&Ben - listings, Anastasiia&Kareem - users).
### Afternooon StandUp
- missed that one. Carried on working on assigned tasks.
### Retro
- Managed to pass the tests but @user_name is not showing up on the page.
- Tried to solve that problem as a group. Decided to look at it again tomorrow morning with fresh eyes.
- ***WHAT WENT WELL:*** managed to get '/signup/new' working,
- ***WHAT DID NOT GO SO WELL AND/OR RAISED QUESTIONS:*** 
## Wednesday (31.07)
## Thursday (01.08)
## Friday (02.08)
