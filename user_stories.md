# Tool Rental Application

## Overview
This project aims to create a tool rental application with a Sinatra backend and a React frontend. The application allows administrators to manage customers, tools, and rentals. The accessory rental feature is a stretch goal that adds functionality for renting accessories either with tools or independently at a higher price.

## User Stories

### Feature 1: Display a list of all tools in the database.

#### User Story:
As an administrator, I want to display all tools upon launching the app.

#### Details:
- Implement tool cards displaying name, description, price per day, availability, category, and image.

### Feature 2: Add a new tool.

#### User Story:
As an administrator, I want to add a new tool to the collection by filling out a form.

#### Details:
- Implement a form modal with input fields matching the database structure.
- A new tool should be added to the database, and I should see this tool in the list.

### Feature 3: Show tools that are available to rent.

#### User Story:
As an administrator, I want to sort tools by name or if they are available on the tool list.

#### Details:
- Implement sort functionality displaying all tools or just those that are available.

### Feature 4: Display a list of all customers.

#### User Story:
As an administrator, I want to view customers on the page.

#### Details:
- Display a list of all customers with their details.

### Feature 5: Add a new customer.

#### User Story:
As an administrator, I want to add a new customer by filling out a form.

#### Details:
- Implement a form to add new customers.
- A new customer should be added to the database, and I should see this customer in the list.

### Feature 6: Edit and delete customers.

#### User Story:
As an administrator, I want to be able to edit and delete customer information.

#### Details:
- Implement functionality to edit customer details.
- Implement functionality to delete a customer from the database.

### Feature 7: Manage rentals for each customer.

#### User Story:
As an administrator, I want to add, edit, and delete rentals for each customer.

#### Details:
- Display associated rentals for each customer.
- Implement functionality to add new rentals.
- Implement functionality to edit rental details.
- Implement functionality to delete rentals.
- Calculate and display the cost of rentals based on the duration and tool’s price per day.

## Stretch Goals

### Feature 8: Sell a tool.

#### User Story:
As an administrator, I want to delete a tool from the tool list and add the cost to the customer.

#### Details:
- Implement functionality to delete a tool from the tool list.
- Add the cost of the tool to the customer's balance.

### Feature 9: Accessory Management and Rental

#### User Story:
As an administrator, I want to manage accessories and have the option to rent them independently or with tools at a discounted price.

#### Details:
- Display a list of all accessories with their details.
- Implement a form to add new accessories.
- Implement functionality to edit and delete accessories.
- Allow accessories to be rented independently with a higher price.
- Allow accessories to be rented with tools at a regular price.
- Calculate and display the rental cost based on whether the accessory is rented independently or with a tool.
