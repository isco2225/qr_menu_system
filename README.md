# QR Menu System

Flutter-based digital menu system with Firebase backend. Customers browse categories/products, admins manage menu via web panel.

## Features

- Digital menu browsing with infinite scroll
- Real-time Firebase synchronization
- Admin authentication & CRUD operations
- Role-based access (superAdmin, admin, viewer)
- Image upload & compression

## Tech Stack

- **Flutter** 3.22+ / Dart 3.9.2+
- **Firebase**: Firestore, Storage, Auth
- **Provider** 6.1.2 for state management
- **GoRouter** 14.6.3 for navigation
- **Freezed** + **JsonSerializable** for models
- **Formz** for validation

## Project Structure

```
lib/
├── domain/          # Business logic (entities, value objects, use cases)
├── data/            # Firebase services & repositories
├── ui/              # Views, ViewModels, widgets (features)
└── app/             # Router, utils, global widgets

shared/              # Reusable package (components, extensions)
```

## Clean Architecture

- **Domain Layer** (`lib/domain/`):
  - Entities (Category, Product, AdminUser, Auth) using Freezed
  - Value Objects (Email, Password, ProductPrice) for type safety
  - Use Cases (image upload, validation)
  - Repository interfaces (contracts)
  - Exceptions & enums
  
- **Data Layer** (`lib/data/`): Firebase integration
  - Repository implementations
  - Services (Firestore, Storage, Auth)
  - Implements domain interfaces
  
- **UI Layer** (`lib/ui/`): Flutter presentation
  - Views & ViewModels (Provider)
  - Feature-organized (admin, categories, products)
  - Uses domain entities only

**Dependency Rule**: UI → Domain ← Data (inner layers know nothing about outer layers)

## State Management

**Provider Pattern** with ChangeNotifier ViewModels:

- **ViewModels**: Feature-specific state holders
  - `FetchCategoriesViewModel`, `CreateCategoryViewModel`
  - `SignInViewModel`, `FetchAdminViewModel`
  - Manage loading, error, success states with FLUTTER COMMAND PATTERN.
  
- **Dependency Injection**: Repositories injected via constructor
- **Reactive UI**: ViewModels notify listeners on state change
- **Separation**: UI is dumb, ViewModels handle business logic

## Routes

- `/` - Categories (public)
- `/categories/:id/products` - Products (public)
- `/admin-panel` - Admin dashboard (protected)
- `/sign-in` - Admin login

## Security Note

Never commit Firebase config files (`google-services.json`, `GoogleService-Info.plist`, `firebase_options.dart`). They're in `.gitignore`.