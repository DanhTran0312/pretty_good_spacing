import 'package:flutter/widgets.dart';

/// A configurable spacing system for Flutter applications.
///
/// This singleton class provides consistent spacing values throughout your app.
/// The base spacing unit can be configured during app initialization to match
/// your design system requirements.
///
/// Usage:
/// ```dart
/// // Initialize with custom spacing unit (optional, defaults to 8.0)
/// Space.initialize(spacingUnit: 4.0);
///
/// // Use spacing values
/// Container(
///   padding: Space.space100.all, // 4px with custom unit
///   margin: Space.space200.horizontal, // 8px with custom unit
/// )
/// ```
///
/// Spacing scale (multipliers of the base unit):
/// - space0: 0 - Use for resetting default spacing styles
/// - space025: 0.25x - Use for small and compact pieces of UI
/// - space050: 0.5x - Use for small and compact pieces of UI
/// - space075: 0.75x - Use for small and compact pieces of UI
/// - space100: 1x - Use for small and compact pieces of UI
/// - space150: 1.5x - Use for larger and less dense pieces of UI
/// - space200: 2x - Use for larger and less dense pieces of UI
/// - space250: 2.5x - Use for larger and less dense pieces of UI
/// - space300: 3x - Use for larger and less dense pieces of UI
/// - space400: 4x - Use for the largest pieces of UI and for layout elements
/// - space500: 5x - Use for the largest pieces of UI and for layout elements
/// - space600: 6x - Use for the largest pieces of UI and for layout elements
/// - space800: 8x - Use for the largest pieces of UI and for layout elements
/// - space1000: 10x - Use for the largest pieces of UI and for layout elements
class Space {
  static Space? _instance;
  late final double _spacingUnit;

  Space._internal(this._spacingUnit);

  /// Initialize the spacing system with a custom base unit.
  ///
  /// [spacingUnit] defaults to 8.0 if not specified.
  /// This method should be called once during app initialization.
  /// Subsequent calls will throw an exception to prevent accidental reconfiguration.
  static void initialize({double spacingUnit = 8.0}) {
    if (_instance != null) {
      throw StateError(
        'Space has already been initialized. '
        'Initialize should only be called once during app startup.',
      );
    }
    if (spacingUnit <= 0) {
      throw ArgumentError.value(
        spacingUnit,
        'spacingUnit',
        'Spacing unit must be greater than 0',
      );
    }
    _instance = Space._internal(spacingUnit);
  }

  /// Get the current spacing instance.
  /// If not initialized, creates an instance with default spacing unit of 8.0.
  static Space get _current {
    return _instance ??= Space._internal(8.0);
  }

  /// Get the current base spacing unit value.
  static double get spacingUnit => _current._spacingUnit;

  /// Equates to `0`. Use for resetting default spacing styles.
  static double get space0 => 0;

  /// Use for small and compact pieces of UI.
  /// Value: 0.25 * spacingUnit
  static double get space025 => _current._spacingUnit * 0.25;

  /// Use for small and compact pieces of UI.
  /// Value: 0.5 * spacingUnit
  static double get space050 => _current._spacingUnit * 0.5;

  /// Use for small and compact pieces of UI.
  /// Value: 0.75 * spacingUnit
  static double get space075 => _current._spacingUnit * 0.75;

  /// Use for small and compact pieces of UI.
  /// Value: 1 * spacingUnit
  static double get space100 => _current._spacingUnit;

  /// Use for larger and less dense pieces of UI.
  /// Value: 1.5 * spacingUnit
  static double get space150 => _current._spacingUnit * 1.5;

  /// Use for larger and less dense pieces of UI.
  /// Value: 2 * spacingUnit
  static double get space200 => _current._spacingUnit * 2;

  /// Use for larger and less dense pieces of UI.
  /// Value: 2.5 * spacingUnit
  static double get space250 => _current._spacingUnit * 2.5;

  /// Use for larger and less dense pieces of UI.
  /// Value: 3 * spacingUnit
  static double get space300 => _current._spacingUnit * 3;

  /// Use for the largest pieces of UI and for layout elements.
  /// Value: 4 * spacingUnit
  static double get space400 => _current._spacingUnit * 4;

  /// Use for the largest pieces of UI and for layout elements.
  /// Value: 5 * spacingUnit
  static double get space500 => _current._spacingUnit * 5;

  /// Use for the largest pieces of UI and for layout elements.
  /// Value: 6 * spacingUnit
  static double get space600 => _current._spacingUnit * 6;

  /// Use for the largest pieces of UI and for layout elements.
  /// Value: 8 * spacingUnit
  static double get space800 => _current._spacingUnit * 8;

  /// Use for the largest pieces of UI and for layout elements.
  /// Value: 10 * spacingUnit
  static double get space1000 => _current._spacingUnit * 10;

  /// Reset the spacing system. Only use this for testing purposes.
  @visibleForTesting
  static void reset() {
    _instance = null;
  }
}

/// A class that provides extension methods for the double class.
///
/// This class is used to provide extension methods for the double class.
/// The extension methods are used to create EdgeInsets for the double values.
extension EdgeInsetsExtension on double {
  /// EdgeInsets for all sides
  /// Example: Spacing.space100.all
  EdgeInsets get all => EdgeInsets.all(this);

  /// EdgeInsets for horizontal
  /// Example: Spacing.space100.horizontal
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);

  /// EdgeInsets for vertical
  /// Example: Spacing.space100.vertical
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);

  /// EdgeInsets for top
  /// Example: Spacing.space100.top
  EdgeInsets get top => EdgeInsets.only(top: this);

  /// EdgeInsets for bottom
  /// Example: Spacing.space100.bottom
  EdgeInsets get bottom => EdgeInsets.only(bottom: this);

  /// EdgeInsets for left
  /// Example: Spacing.space100.left
  EdgeInsets get left => EdgeInsets.only(left: this);

  /// EdgeInsets for right
  /// Example: Spacing.space100.right
  EdgeInsets get right => EdgeInsets.only(right: this);

  /// EdgeInsets for top left
  /// Example: Spacing.space100.topLeft
  EdgeInsets get topLeft => EdgeInsets.only(top: this, left: this);

  /// EdgeInsets for top right
  /// Example: Spacing.space100.topRight
  EdgeInsets get topRight => EdgeInsets.only(top: this, right: this);

  /// EdgeInsets for bottom left
  /// Example: Spacing.space100.bottomLeft
  EdgeInsets get bottomLeft => EdgeInsets.only(bottom: this, left: this);

  /// EdgeInsets for bottom right
  /// Example: Spacing.space100.bottomRight
  EdgeInsets get bottomRight => EdgeInsets.only(bottom: this, right: this);
}
