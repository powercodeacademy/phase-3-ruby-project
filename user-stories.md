# MVP

## Feature 1: View All Concerts

**User Story:** As a user, I want to be able to view a list of my concerts.

**Details:** Run a GET request to retrieve all concerts.

## Feature 2: Create a New Concert

**User Story:** As a user, I want to be able to add new concerts to the list.

**Details:** Run a POST request to add a new concert.

## Feature 3: Update a Concert

**User Story:** As a user, I want to be able to update an existing concert.

**Details:** Run PATCH request to update concert details.

## Feature 4: Delete a Concert

**User Story:** As a user, I want to be able to delete a concert.

**Details:** Run a DELETE request to delete a concert.

## Feature 5: View Concerts by Attribute

**User Story:** As a user, I want to be able to view concerts by Band Name, Date, Venue, Genre and whether Tickets have been purchased.

**Details:** Write ActiveRecord methods to find concerts by attribute.

## Feature 6: Sort Concerts by Date:

**User Story:** As a user I want to be able to sort concerts by date in ascending order.

**Details:** Write ActiveRecord method to order concerts.

---

# Stretch Goals

### Create a Person Table

**User Story:** As a user, I want to be able to see who is attending a concert.

**Details:** Create a new Person Table and join to Concerts and Bands.

### View Concerts by Person

**User Story:** As a user, I want to be able to view the concerts being attended by a specific person.

**Details:** Wite ActiveRecord method to show only concerts being attended by selected Person.
