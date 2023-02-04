# Swift Storyboard & SQLite Database To-Do List App with Viper Architecture

# Overview
This app allows users to create, read, update, and delete to-do items stored in an SQLite database. The app follows the VIPER architecture, with separate modules for the View, Interactor, Presenter, Entity, and Router. The UI is built using Storyboards in Swift.

# Screenshoot

<img src="https://i.imgur.com/wFgxX8P.png"  width="300" height="560">


# Features
 -Add new to-do items
 -List all existing to-do items
 -Search for to-do items by keyword
 -Update to-do items
 -Delete to-do items

# Architecture
The VIPER architecture is used in this app, which consists of the following components:

View: Responsible for displaying information to the user and capturing user input.
Interactor: Contains the business logic for fetching and manipulating data.
Presenter: Translates data from the Interactor into a format that can be displayed by the View.
Entity: Represents the data model, in this case, the to-do items.
Router: Handles navigation between screens.

# Database
SQLite is used as the database to store the to-do items. The database is managed using the SQLite.swift library.

# License

Distributed under the MIT License. See [LICENSE](https://github.com/mehmetalidemir/VideoGamesApp/blob/main/LICENSE.md) for more information.

# Authors

* **Mehmet Ali Demir** - *iOS Developer* - [Mehmet Ali Demir](https://github.com/mehmetalidemir) - **
