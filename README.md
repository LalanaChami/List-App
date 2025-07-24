# List-App

<p align="center">
  <img src="Demo/codingAssingmentReco.gif" width="400" alt="Demo GIF" />
</p>

## Overview
List-App is an iOS application built as an assessment project. It demonstrates a clean implementation of the MVVM (Model-View-ViewModel) architecture, uses Core Data for local data persistence, and uses Combine for reactive programming. The app displays a list of items fetched from https://picsum.photos/v2/list , allows users to add, delete, and reorder items, and persists user changes locally.

## Project Structure
The project is organized into the following main directories:

- **Models/**: Contains data models and DTOs (Data Transfer Objects) used throughout the app.
- **ViewModels/**: Contains the viewmodel that manage the app's business logic and state, exposing data and actions to the views.
- **Views/**: Contains SwiftUI views, including screens and reusable UI components.
- **Repositories/**: Contains repository classes responsible for data access, including network and local data sources.
- **UseCases/**: Contains use case classes that encapsulate specific business logic (and offloads work from the viewmodel) and coordinate between repositories and viewmodel.
- **Utils/**: Contains utility classes, helpers, enums, and configuration management.
- **Configs/**: Contains configuration files such as plists for API endpoints and other settings.
- **Data/**: Contains Core Data model files for local persistence.

## Architecture
The app follows the MVVM (Model-View-ViewModel) architecture:

- **Model**: Represents the data layer, including DTOs, Core Data entities, and network models.
- **View**: SwiftUI views that render the UI and bind to viewmodel.
- **ViewModel**: Exposes data and actions to the view, processes user input, and interacts with use cases and repositories.
- **Repository**: Abstracts data access, providing a clean API for fetching and saving data from network or local sources.
- **UseCase**: Encapsulates business logic, orchestrating data flow between repositories and viewmodel.

## Core Data Usage
Core Data is used for local persistence of the user's saved items. The app initializes an `NSPersistentContainer` and manages entities representing items. Key points:

- Items fetched from the network can be saved to Core Data for offline access.
- The app supports adding, deleting, and reordering items, with all changes persisted locally.
- Fetch requests and sorting are handled efficiently using Core Data APIs.
- The data model is defined in the `List_App.xcdatamodeld` file under the `Data/` directory.

## Testing
The project includes comprehensive unit and UI test scaffolds, covering all major logic and UI flows. Tests are located in the `List AppTests/` and `List AppUITests/` directories.

## Getting Started
1. Open `List App.xcodeproj` in Xcode.
2. Build and run the app on the simulator or a device.
3. Run the test suite using Xcode's test navigator.

---

This project is a demonstration of best practices in iOS development, including MVVM, Core Data, Combine, and modular code organization.