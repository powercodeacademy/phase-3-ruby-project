# My Fitness App

Welcome to My Fitness App! This application helps you track your runs, manage your running shoes, and monitor your progress.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

My Fitness App is designed to help runners keep track of their activities. With this app you can log your runs, manage your running shoes, and view detailed stats about your progress.

## Features

- **Run Tracking:** Log your runs with distance, time, cadence, and more.
- **Shoe Management:** Keep track of the mileage on each pair of your running shoes.
- **Runner Stats:** View detailed statistics about your runs and shoes.
- **User Management:** Add and switch between different runners.

## Installation

To install and set up the application, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/my-fitness-app.git
   cd my-fitness-app
   ```

2. **Install dependencies:**

   ```bash
   npm install
   ```

3. **Start the backend server:**

   ```bash
   cd backend
   bundle install
   bundle exec rake db:migrate db:seed db:server

   ```

4. **Start the frontend server:**

   ```bash
   cd frontend
   npm start
   ```

## Usage

Once the servers are running, open your browser and go to `http://localhost:3000` to access My Fitness App.

### Adding a Runner

1. Click on the "Add Runner" button.
2. Enter the runner's name.
3. Click "Submit."

### Logging a Run

1. Select a runner from the dropdown menu.
2. Click on "Log a Run."
3. Fill in the run details (distance, time, cadence, etc.).
4. Click "Submit."

### Managing Shoes

1. Select a runner from the dropdown menu.
2. Click on "Manage Shoes."
3. Add, edit, or view the shoes associated with the runner.
