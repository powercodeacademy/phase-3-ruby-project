# Sample Project: Pet Tracker

This is a complete implementation of the Phase 3 project requirements. It demonstrates how to build a Ruby CLI application backed by a SQLite3 database using Active Record — no web server required.

## Domain Model

**Pet Tracker** — A simple application to manage pet owners and their pets.

- `Owner` has many `Pets` (one-to-many relationship)
- `Pet` belongs to `Owner`

### Owner

- `name` (string, required)
- `email` (string, required, unique)
- `phone` (string, required)
- `address` (text, optional)

### Pet

- `name` (string, required)
- `species` (string, required)
- `breed` (string, required)
- `age` (integer, required, must be > 0)
- `notes` (text, optional)
- `owner_id` (foreign key, required)

## Architecture

The CLI is built with two Ruby classes:

- **`PetTracker`** — manages the menu loop and all user interaction
- **`Owner` / `Pet`** — Active Record models that handle all database reads and writes

There is no API layer. The CLI talks directly to the database through the models.

## Getting Started

Install dependencies:

```bash
bundle install
```

Create and migrate the database:

```bash
bundle exec rake db:create
bundle exec rake db:migrate
```

Seed the database with sample data:

```bash
bundle exec rake seed
```

Run the CLI:

```bash
ruby cli/main.rb
```

## Features

- **Menu-driven interface** with a loop and numbered choices
- **Full CRUD** for both owners and pets
- **Current value prompts** for updates — shows the existing value before asking for a new one
- **Associated data display** — owners show their pets, pets show their owner
- **Validation error display** — shows Active Record error messages if a save fails
- **Confirmation prompts** before deleting records

## Implementation Highlights

- Active Record `has_many` / `belongs_to` association with `dependent: :destroy`
- Validations on both models (presence, uniqueness, numericality)
- `find_by` with nil checks instead of `find` to avoid exceptions on bad IDs
- `include(:pets)` on queries to avoid N+1 queries when displaying owners with pets
- `owner.save` + `owner.errors.full_messages` pattern for user-friendly error handling

## Learning Points

This implementation demonstrates:

- Active Record associations (`has_many`, `belongs_to`)
- Migrations and schema design with foreign keys
- Model validations and error handling
- Object-oriented CLI design with private helper methods
- User input collection with `gets.chomp`
- Conditional logic and loops for menu navigation
- Seed data for development and testing
