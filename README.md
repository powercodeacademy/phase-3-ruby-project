# My Fitness App

Welcome to My Fitness App! This application helps you track your runs, manage your running shoes, and monitor your progress.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)

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
   git clone git@github.com:Lsimmons98/running-mileage-tracker.git
   cd running-mileage-tracker
   ```

2. **Start the backend server:**

   ```bash
   cd backend
   bundle install
   bundle exec rake db:migrate db:seed server

   ```

3. **Start the frontend server:**

   ```bash
   cd frontend
   npm install
   npm start
   ```

## Usage

Once the servers are running, open your browser and go to `http://localhost:3000` to access My Fitness App.

### Adding a New Runner

1. Enter the runner's name.
2. Click "Add Runner."

### Logging a Run

1. Select a shoe from the dropdown menu.
2. Click on "Add Run."
3. Your "fitness tracker" will automatically calculate the details of your run including cadence, average pace, distance, average heart rate, calories burned, and time.

### Adding New Shoes

1. Enter the name of your shoes.
2. Click on "Add Shoe."
