# QR Menu System

A Flutter-based digital menu system for restaurants and cafés. Customers scan QR codes to browse categories and products with real-time updates via Firebase.

## Features

- Digital menu browsing with categories and products
- Infinite scrolling pagination for large catalogs
- Real-time updates through Firebase Firestore
- Admin panel for menu management (CRUD operations)
- Multi-platform support (Web, iOS, Android, macOS, Linux, Windows)
- QR code integration for quick access

## Clean Architecture

This project implements **Clean Architecture** with three distinct layers ensuring scalability, testability, and maintainability:

```
┌─────────────────────────────────────┐
│         UI Layer (Presentation)     │
│  • Views & Screens                  │
│  • ViewModels (Provider)            │
│  • Widgets                          │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│         Domain Layer (Business)     │
│  • Entities (Category, Product)     │
│  • Repository Interfaces            │
│  • Business Rules                   │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│         Data Layer (Infrastructure) │
│  • Repository Implementations       │
│  • Firebase Services                │
│  • Remote Data Sources              │
└─────────────────────────────────────┘
```

### Domain Layer (`lib/domain/`)

Core business logic with zero framework dependencies.

- **Entities**: Immutable models using `freezed` (Category, Product)
- **Repository Interfaces**: Abstract contracts for data operations
- **Business Rules**: Pure Dart logic independent of UI or infrastructure

### Data Layer (`lib/data/`)

Handles persistence and external service integration.

- **Repositories**: Concrete implementations of domain interfaces
  - `CategoryRepositoryRemote`: Firestore category operations
  - `ProductRepositoryRemote`: Firestore product operations
- **Services**: Firebase configuration and initialization
- **Dependency**: Implements domain layer interfaces

### UI Layer (`lib/ui/`)

User interaction and visual presentation.

- **Views**: Feature-organized screens (categories, products, admin)
- **ViewModels**: State management using Provider pattern
- **Widgets**: Reusable UI components with infinite scrolling
- **Dependency**: Uses domain entities and repository interfaces

## Project Structure

```
lib/
├── app/                        # Application configuration
│   ├── router/                 # GoRouter navigation
│   ├── utils/                  # Helper functions
│   └── widgets/                # Global widgets
│
├── domain/                     # Business logic (framework-agnostic)
│   ├── category/models/        # Category entity
│   └── product/models/         # Product entity
│
├── data/                       # Infrastructure layer
│   ├── repositories/           # Repository implementations
│   │   ├── category/           # Category repository
│   │   └── product/            # Product repository
│   └── services/               # Firebase services
│
├── ui/                         # Presentation layer
│   ├── admin/                  # Admin panel feature
│   ├── categories/             # Categories feature
│   │   ├── fetch_categories/   # Fetching logic & ViewModel
│   │   ├── views/              # Category screens
│   │   └── widgets/            # Category components
│   └── products/               # Products feature
│       ├── fetch_products/     # Fetching logic & ViewModel
│       ├── views/              # Product screens
│       └── widgets/            # Product components
│
└── main.dart                   # Entry point

shared/                         # Reusable package
├── domain/                     # Common models (Result, Failure)
├── extensions/                 # Dart/Flutter extensions
└── widgets/                    # Generic components
```

## Tech Stack

- **Framework**: Flutter 3.22+ / Dart 3.9.2+
- **Backend**: Firebase (Firestore, Storage)
- **State Management**: Provider 6.1.2
- **Navigation**: GoRouter 14.6.3
- **Code Generation**: Freezed 3.0.6, JsonSerializable 6.9.5
- **Environment**: flutter_dotenv 5.2.1

## Getting Started

### Prerequisites

- Flutter SDK (≥ 3.22.0)
- Dart SDK (≥ 3.9.2)
- Firebase project with Firestore and Storage enabled

### Installation

```bash
# Clone repository
git clone https://github.com/yourusername/qr_menu_system.git
cd qr_menu_system

# Install dependencies
flutter pub get
cd shared && flutter pub get && cd ..

# Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Configure Firebase (place config files in platform directories)
flutterfire configure

# Run application
flutter run -d chrome  # Web
flutter run -d macos   # macOS
```

### Environment Setup

Create `.env` file in project root for environment variables (if needed). Never commit sensitive data to version control.

## Architecture Principles

- **Dependency Rule**: Dependencies point inward (UI → Domain ← Data)
- **Framework Independence**: Domain layer has no Flutter/Firebase dependencies
- **Testability**: Each layer can be tested independently
- **Feature Organization**: Code grouped by features, not technical layers
- **Immutability**: Freezed entities ensure immutable state
- **Repository Pattern**: All data access through abstract interfaces
- **Provider Pattern**: ViewModels extend ChangeNotifier for reactive state

## License

MIT License - see LICENSE file for details.

## Contributing

Contributions welcome. Follow existing architecture patterns and ensure code passes linting.

1. Fork the repository
2. Create feature branch (`git checkout -b feature/name`)
3. Commit changes (`git commit -m 'Add feature'`)
4. Push to branch (`git push origin feature/name`)
5. Open Pull Request
