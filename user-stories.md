# MVP

## Feature 1: View All Concerts

**User Story:** As a user, I want to view all concerts I’m interested in, including which people are attending and whether I have purchased a ticket.

**Details:** Run a GET request to `/concerts` that includes attendance info, associated people, and the user's ticket purchase status via associations.

## Feature 2: Create a New Concert

**User Story:** As a user, I want to be able to add new concerts I am interested in attending to the list.

**Details:** Run a POST request to create a new concert instance.

## Feature 3: Update a Concert

**User Story:** As a user, I want to be able to update an existing concert if the details change.

**Details:** Run PATCH request to update concert details.

## Feature 4: Delete a Concert

**User Story:** As a user, I want to be able to delete a concert I have decided I'm no longer interested in.

**Details:** Run a DELETE request to delete a concert.

## Feature 5: Add a Person

**User Story:** As a user, I want to be able to add a Person to my peoples table so I can track which concerts they are attending with me.

**Details:** Run POST request to create a new person instance.

## Feature 6: Update Attendance Status

**User Story:** As a user, I want to be able to update the attendance status of a concert I have purchased tickets to.

**Details:** Run a PATCH request to update attendance status from false to true for selected concert.

## Feature 7: Show a Person as Attending Concert

**User Story:** As a user, I want to be able to update a person to show they are attending a selected concert.

**Details:** Run a POST request to create a new attendance instance and use ActiveRecord associations to include the concert and person.

## Feature 8: Show All Concerts With Purchased Tickets

**User Story:** As a user, I want to be able to see a list of which concerts I have purchased tickets for.

**Details:** Run a GET request to return concerts where `ticket_purchased` is true, using ActiveRecord associations.

## Feature 9: Show Who is Attending a Concert

**User Story:** As a user, I want to be able to see a list of which people are attending a specific concert.

**Details:** Write an ActiveRecord method to GET a list of people associated with selected concert_id.

---

# Stretch Goals

## Feature 10: Sort Concerts by Date

**User Story:** As a user, I want to be able to sort concerts by date in ascending order.

**Details:** Write ActiveRecord method to GET and order concerts by date.

## Feature 11: View All Concerts by Attributes

**User Story:** As a user, I want to be able to view all concerts by band name, genre, venue, or city.

**Details:** Write ActiveRecord method to GET all concerts with specified attribute(s).
