# MVP

## Feature 1: View All Concerts

**User Story:** As a user, I want to view all concerts I’m interested in which also shows everyone who is attending.

**Details:** Run a GET request to `/concerts` that includes attendees.

## Feature 2: View All Attendees

**User Story:** As a user, I want to view all attendees and view which concerts they will be attending.

**Details:** Run a GET request to `/attendees` that includes concerts.

## Feature 3: Create a New Concert

**User Story:** As a user, I want to be able to add new concerts I am interested in attending to the list.

**Details:** Run a POST request to `/concerts` that creates a new concert instance.

## Feature 4: Update a Concert

**User Story:** As a user, I want to be able to update an existing concert if the details change.

**Details:** Run PATCH request to `/concerts/:id` to update concert details on a specific concert.

## Feature 5: Delete a Concert

**User Story:** As a user, I want to be able to delete a concert I have decided I'm no longer interested in or that has been cancelled.

**Details:** Run a DELETE request to `/concerts/:id` to delete a specific concert.

## Feature 6: Add an Attendee

**User Story:** As a user, I want to be able to add someone to the `attendees` list so I can track who is attending which concerts.

**Details:** Run POST request to `/attendees` to create a new attendee instance.

## Feature 7: Update Attendance Status

**User Story:** As a user, I want to be able to update the attendance status of a concert I have purchased tickets to.

**Details:** Run a PATCH request to create a new ticket instance for an existing concert.

---

# Stretch Goals

## Feature 8: View an Individual Attendee and Their Concerts

**User Story:** As a user, I want to be able to search an individual attendee by name and see a list of all concerts they are attending.

**Details:** Run a GET request to `/attendees/:id` that includes concerts. Loop through an attendees concerts.

## Feature 9: View an Individual Band's Concerts and Attendees

**User Story:** As a user, I want to be able to search an individual band by band name and see a list of all it's concerts and attendees for each concert.

**Details:** Run a GET request to `/concerts/:id` that includes concerts. Loop through band's concerts then loop through a concert's attendees.
