# Sample Project: Pet Tracker

This is a complete implementation of the Phase 3 project requirements. It demonstrates how to build a Sinatra API backend with Active Record and a Ruby CLI frontend that consumes the API.

## Domain Model

**Pet Tracker** - A simple application to manage pet owners and their pets.

- `Owner` has many `Pets` (one-to-many relationship)
- `Pet` belongs to `Owner`

### Models

#### Owner

- `name` (string, required)
- `email` (string, required, unique)
- `phone` (string, required)
- `address` (text, optional)

#### Pet

- `name` (string, required)
- `species` (string, required)
- `breed` (string, required)
- `age` (integer, required, > 0)
- `notes` (text, optional)
- `owner_id` (foreign key, required)

## Backend API

### Routes

#### Owners (Full CRUD)

- `GET /owners` - List all owners with their pets
- `GET /owners/:id` - Get a specific owner with their pets
- `POST /owners` - Create a new owner
- `PATCH /owners/:id` - Update an owner
- `DELETE /owners/:id` - Delete an owner

#### Pets (Full CRUD)

- `GET /pets` - List all pets with their owners
- `GET /pets/:id` - Get a specific pet with its owner
- `POST /pets` - Create a new pet
- `PATCH /pets/:id` - Update a pet
- `DELETE /pets/:id` - Delete a pet

#### Relationships

- `GET /owners/:owner_id/pets` - Get all pets for a specific owner

### Features

- JSON responses with associated data
- Error handling for validation errors and not found records
- Proper HTTP status codes
- CORS enabled for cross-origin requests

## CLI Frontend

### Architecture

- **Object-oriented design** with two main classes:
  - `APIClient` - Handles HTTP requests to the API
  - `CLIInterface` - Manages user interaction and display

### Features

- **Menu-driven interface** with loops and conditionals
- **Full CRUD operations** for both owners and pets
- **Current value prompts** for updates (retrieved from API)
- **JSON parsing** and readable display formatting
- **Error handling** for network issues and API errors
- **User input validation** and confirmation prompts

### Usage

1. Start the API server: `bundle exec rackup -p 9293`
2. Run the CLI: `ruby cli/main.rb`

## Implementation Highlights

### Backend

- Active Record models with validations and associations
- RESTful routes with proper HTTP methods
- JSON serialization with `include` for associated data
- Error handling with appropriate status codes
- Database migrations and seed data

### Frontend

- `RestClient` for HTTP requests
- JSON parsing with error handling
- User-friendly display formatting
- Input validation and confirmation
- Modular class design

## Learning Points

This implementation demonstrates:

- **Active Record associations** (has_many, belongs_to)
- **RESTful API design** with proper HTTP methods
- **JSON API responses** with associated data
- **Error handling** in both API and CLI
- **Object-oriented design** in Ruby
- **HTTP client usage** with RestClient
- **User interface design** with loops and conditionals
- **Database design** with migrations and seed data

## Testing the Sample

1. **Start the API:**

   ```bash
   bundle exec rackup -p 9293
   ```

2. **Test API endpoints:**

   ```bash
   curl http://localhost:9293/owners
   curl http://localhost:9293/pets
   ```

3. **Run the CLI:**

   ```bash
   ruby cli/main.rb
   ```

4. **Try the features:**
   - View all owners and pets
   - Create new owners and pets
   - Update existing records
   - Delete records
   - View pets by owner

This sample project provides a complete reference implementation that students can study to understand how to meet all the project requirements.
