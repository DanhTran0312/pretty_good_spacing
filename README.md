# Pretty Good Spacing

A configurable spacing system for Flutter applications that provides consistent design tokens and convenient widgets for managing spacing throughout your app.

## Features

- 🎯 **Configurable base unit**: Set your design system's base spacing unit once
- 📏 **Consistent spacing scale**: Pre-defined spacing values from 0.25x to 10x your base unit
- 🎨 **EdgeInsets extensions**: Easy-to-use extensions for padding and margins
- 🔧 **Gap widgets**: Convenient spacing widgets that integrate with your spacing system
- 🧪 **Well tested**: Comprehensive test coverage
- 🚀 **Zero dependencies**: Only depends on Flutter SDK and the gap package

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  pretty_good_spacing: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Setup

Initialize the spacing system in your app (optional - defaults to 8.0):

```dart
import 'package:flutter/material.dart';
import 'package:pretty_good_spacing/pretty_good_spacing.dart';

void main() {
  // Optional: Set custom base spacing unit
  Space.initialize(spacingUnit: 4.0);

  runApp(MyApp());
}
```

### Using Spacing Values

```dart
import 'package:pretty_good_spacing/pretty_good_spacing.dart';

Container(
  // Using spacing values directly
  padding: EdgeInsets.all(Space.space200), // 16px with default 8px base
  margin: EdgeInsets.symmetric(horizontal: Space.space100), // 8px
  child: Text('Hello World'),
)
```

### Using EdgeInsets Extensions

```dart
Container(
  // Using convenient extensions
  padding: Space.space200.all,
  margin: Space.space100.horizontal,
  child: Column(
    children: [
      Text('Title'),
      Padding(
        padding: Space.space50.vertical,
        child: Text('Subtitle'),
      ),
    ],
  ),
)
```

### Using Gap Widgets

```dart
Column(
  children: [
    Text('First item'),
    KGap.space100(), // 8px gap
    Text('Second item'),
    KGap.space125(), // 10px gap
    Text('Third item'),
    KGap.space200(), // 16px gap
    Text('Fourth item'),
  ],
)
```

### Available Spacing Values

The spacing system provides these values (multipliers of your base unit):

- `space0`: 0 - Reset spacing
- `space25`: 0.25x - Very small spacing
- `space50`: 0.5x - Small spacing
- `space75`: 0.75x - Small spacing
- `space100`: 1x - Base spacing (default)
- `space125`: 1.25x - Small-medium spacing
- `space150`: 1.5x - Medium spacing
- `space200`: 2x - Medium spacing
- `space250`: 2.5x - Medium spacing
- `space300`: 3x - Large spacing
- `space400`: 4x - Large spacing
- `space500`: 5x - Very large spacing
- `space600`: 6x - Very large spacing
- `space800`: 8x - Extra large spacing
- `space1000`: 10x - Maximum spacing

### EdgeInsets Extension Methods

All spacing values support these extension methods:

- `.all` - All sides
- `.horizontal` - Left and right
- `.vertical` - Top and bottom
- `.top`, `.bottom`, `.left`, `.right` - Individual sides
- `.topLeft`, `.topRight`, `.bottomLeft`, `.bottomRight` - Corner combinations

## Additional information

This package is designed to help Flutter developers maintain consistent spacing throughout their applications by providing a configurable, scalable spacing system.

### Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Issues

Please file issues on the [GitHub repository](https://github.com/DanhTran0312/pretty_good_spacing/issues).
