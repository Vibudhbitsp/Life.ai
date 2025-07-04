# Life.ai

Your AI-powered life companion - A Flutter app designed to help you organize tasks, set goals, build habits, and get personalized insights using artificial intelligence.

## Features

- 🎯 **Smart Task Management** - AI-powered task organization and prioritization
- 🎯 **Goal Setting & Tracking** - Set meaningful goals and track your progress
- 🔄 **Habit Building** - Build positive habits with AI-driven recommendations
- 🤖 **AI Insights** - Get personalized recommendations and insights
- 📊 **Analytics Dashboard** - Visualize your progress and productivity
- 🌙 **Dark/Light Theme** - Beautiful themes that adapt to your preference

## Getting Started

### Prerequisites

- Flutter SDK (>=3.32.0)
- Dart SDK (>=3.8.0)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/life-ai.git
   cd life-ai
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── theme/              # App themes and styling
│   ├── routes/             # Navigation and routing
│   └── providers/          # State management
├── features/               # Feature modules
│   ├── auth/              # Authentication
│   ├── home/              # Home dashboard
│   ├── onboarding/        # Onboarding flow
│   └── splash/            # Splash screen
└── shared/                # Shared components
    └── widgets/           # Reusable widgets
```

## Architecture

This project follows a **Feature-Driven Architecture** with:

- **Clean Architecture** principles
- **Riverpod Provider** for state management
- **Auto Route** for navigation
- **Material Design 3** for UI components

## Dependencies

### Core Dependencies
- `riverpodprovider` - State management
- `auto_route` - Navigation
- `shared_preferences` - Key-value storage
- `http` & `dio` - HTTP client
- `intl` - Internationalization

### UI Dependencies
- `flutter_svg` - SVG support
- `cached_network_image` - Image caching
- `permission_handler` - Permissions

## Development

### Code Style

This project uses `flutter_lints` for code quality. Run the following commands:

```bash
# Analyze code
flutter analyze

# Format code
dart format .

# Run tests
flutter test
```

### Building

```bash
# Build for Android
flutter build apk

# Build for iOS
flutter build ios

# Build for web
flutter build web
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


Made with ❤️ by the Life.ai team
