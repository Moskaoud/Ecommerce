# E-Commerce Flutter Application

A modern, full-featured e-commerce mobile application built with Flutter and Firebase.

## 📚 Documentation

Comprehensive project documentation is available in the [`/docs`](./docs) directory:

- **[Project Planning](./docs/PROJECT_PLANNING.md)** - Project scope, timeline, risks, and deployment strategy
- **[Stakeholder Analysis](./docs/STAKEHOLDER_ANALYSIS.md)** - Stakeholder identification and engagement strategies
- **[Database Design](./docs/DATABASE_DESIGN.md)** - Complete database architecture and schema documentation
- **[UI/UX Design](./docs/UI_UX_DESIGN.md)** - Design system, components, and user flows

### External Resources

- **Figma Design**: [E-Commerce Mobile App - Community](https://www.figma.com/design/I9kpeKQ5nRIVyMAwLwx6fS/Ecommerce-Mobile-App--Community-)
- **GitHub Repository**: [Moskaoud/Ecommerce](https://github.com/Moskaoud/Ecommerce)
- **Documentation Index**: [docs/README.md](./docs/README.md)


## Features

### 🔐 Authentication
- **User Registration** with email and password
- **Login** with email/password and Google Sign-In
- **Password Reset** functionality
- **Guest Mode** for browsing without authentication
- **Profile Management** with photo upload and user information editing

### 🏠 Home Screen
- **Gender Selector** (Men/Women/Kids) in header
- **Search Bar** with navigation to search page
- **Shopping Cart** icon with quick access
- **Categories** horizontal scrollable list
- **Top Selling Products** section
- **New In Products** section
- Product cards with images, titles, prices, and ratings

### 🔍 Search & Filter
- **Text Search** by product name
- **Filter by Category**
- **Filter by Gender** (Men, Women, Kids)
- **Price Range** filtering (min/max)
- **Sort Options**:
  - Recommended (by rating)
  - Newest
  - Price: Low to High
  - Price: High to Low
- **Empty State** with "Explore Categories" button
- **Category Browser** when no search is active

### 📦 Product Details
- **Product Images** with full-screen view
- **Size Selector** (S, M, L, XL, XXL)
- **Color Selector** with visual indicators
- **Quantity Selector** (increment/decrement)
- **Add to Bag** button with dynamic price display
- **Product Description**
- **Favorite** toggle (UI ready)
- Auto-navigation to cart after adding item

### 🛒 Shopping Cart
- **Cart Items** display with:
  - Product image, name, size, color
  - Price per item
  - Quantity controls (+/-)
  - Auto-remove when quantity reaches 0
- **Empty Cart State** with "Explore Categories" button
- **Price Summary**:
  - Subtotal
  - Shipping Cost
  - Tax
  - Total
- **Remove All** button
- **Checkout** navigation

### 💳 Checkout
- **Shipping Address** section (placeholder)
- **Payment Method** section (placeholder)
- **Order Summary** with pricing breakdown
- **Place Order** button with total price
- **Success Modal** after order placement
- Auto-clear cart after successful order

### 📂 Categories
- **Shop by Categories** page with full category list
- **Category Products** page with grid view
- Navigation from:
  - Home screen category icons
  - "See All" button
  - Orders page empty state
  - Search page

### 📋 Orders
- **Order History** with tab navigation:
  - Delivered
  - Processing
  - Cancelled
- **Empty State** with "Explore Categories" button
- Order status tracking (UI ready)

### 👤 Profile
- **User Information** display
  - Profile photo
  - Name
  - Email
- **Profile Editing** with photo upload
- **Address Management**:
  - Add new addresses
  - Edit existing addresses
  - Delete addresses
  - Set default address
- **Wishlist** (UI ready)
- **Payment Methods** (UI ready)
- **Logout** functionality

### 🎨 UI/UX Features
- **Modern Design** with purple accent color (#8E6CEF)
- **Smooth Navigation** with proper back button handling
- **Loading States** with progress indicators
- **Empty States** with helpful CTAs
- **Snackbar Notifications** for user actions
- **Modal Bottom Sheets** for filters and options
- **Responsive Layouts** with grid and list views

## Tech Stack

### Frontend
- **Flutter** - Cross-platform mobile framework
- **Provider** - State management
- **Material Design** - UI components

### Backend
- **Firebase Authentication** - User authentication
- **Cloud Firestore** - NoSQL database
- **Firebase Storage** - Image storage (for profile photos)

### Key Packages
- `firebase_core` - Firebase initialization
- `firebase_auth` - Authentication
- `cloud_firestore` - Database
- `firebase_storage` - File storage
- `google_sign_in` - Google authentication
- `provider` - State management
- `image_picker` - Photo selection

## Project Structure

```
lib/
├── models/              # Data models
│   ├── product_model.dart
│   ├── category_model.dart
│   ├── cart_model.dart
│   └── address_model.dart
├── pages/               # Screen widgets
│   ├── home_screen.dart
│   ├── search_page.dart
│   ├── product_details_page.dart
│   ├── cart/
│   │   └── cart.dart
│   ├── checkout/
│   │   └── checkout_page.dart
│   ├── orders_page.dart
│   ├── profile_page.dart
│   └── ...
├── services/            # Business logic
│   ├── auth_service.dart
│   └── firestore_service.dart
├── widgets/             # Reusable components
│   ├── product_card.dart
│   ├── section_header.dart
│   └── ...
├── routes/              # Navigation
│   └── app_routes.dart
└── main.dart           # App entry point
```

## Data Models

### Product
- `id`, `title`, `price`, `originalPrice`
- `imageUrl`, `category`, `rating`
- `isTopSelling`, `isNewIn`, `gender`

### Category
- `id`, `title`, `iconUrl`

### Cart Item
- `product`, `size`, `color`, `quantity`

### Address
- `id`, `fullName`, `phoneNumber`
- `addressLine1`, `addressLine2`
- `city`, `state`, `zipCode`, `country`
- `isDefault`

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Firebase project with:
  - Authentication enabled (Email/Password, Google)
  - Cloud Firestore database
  - Firebase Storage

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Moskaoud/Ecommerce.git
   cd ecommerce
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Add your `google-services.json` (Android) to `android/app/`
   - Add your `GoogleService-Info.plist` (iOS) to `ios/Runner/`

4. **Run the app**
   ```bash
   flutter run
   ```

### Seed Data
The app automatically seeds initial categories and products when the Firestore collections are empty. This happens on first run via `FirestoreService.seedData()`.

## Features in Development
- Payment gateway integration
- Order tracking with real-time updates
- Wishlist functionality
- Product reviews and ratings
- Push notifications
- Multi-language support

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
This project is licensed under the MIT License.
