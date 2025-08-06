## 0.1.0

**BREAKING CHANGES:**
* Renamed spacing values to remove leading zeros for cleaner API:
  - `space025` → `space25`
  - `space050` → `space50`
  - `space075` → `space75`
* Updated corresponding KGap factory constructors:
  - `KGap.space025()` → `KGap.space25()`
  - `KGap.space050()` → `KGap.space50()`
  - `KGap.space075()` → `KGap.space75()`

## 0.0.2

* Add space125 (1.25x spacing unit) to fill gap between space100 and space150
* Add KGap.space125() factory constructor for the new spacing value
* Minor code cleanup and formatting improvements

## 0.0.1

* Initial release of Pretty Good Spacing
* Configurable spacing system with base unit support
* Complete spacing scale from 0.25x to 10x base unit
* EdgeInsets extension methods for easy padding/margin setup
* KGap widget for convenient spacing in layouts
* Comprehensive test coverage
* Zero external dependencies (except Flutter SDK and gap package)
