# App Concept: Baseball Team and Game Manager

## Stories:
### Feature 1 - DB Migrations and Ruby Models  
User story: As a user, I want my database setup to handle any data I will add. I also want my app to have models associated with each of the tables.  
*Details: Create migration and ruby model files*  
  
### Feature 2 - Build CLI Menu Nav  
User story: As a user, I want to navigate through the app via a menu. This menu will have numbered options  
*Details: Create a switch/case statement to handle user inputs. Create a menu option for every CRUD action*

### Feature 3 - Build Read methods  
User story: As a user, I want to be able to read data from the database.  
*Details: Create methods to query the DB. Have basically "query all X" methods as well as association methods (eg - All games played by a specific team)*  
  
### Feature 4 - Build Create/Update methods  
User story: As a user, I want to add new entries and edit existing ones  
*Details: Create methods to send new entries to the DB as well as pull existing entries and save changes to them*  
  
### Feature 5 - Build Delete methods  
User story: As a user, I want to remove entries from the DB
*Detauls: If a team is deleted, all players on it should have their team_id cleared. Games with that team should be able to handle displaying the team (maybe put "Team Deleted"?)*  
  
### Feature 6 - Stretch Goals  
User story: As a user, I want to do more than basic CRUD actions.  
*Details: Add bonus features, like simulating games*
