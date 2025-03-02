# Custom Navigation Guide for ADAAP

This guide explains how to implement custom back arrow navigation in your Flutter application using the updated `AppBarWidget`.

## Updated AppBarWidget

The `AppBarWidget` has been updated to support custom navigation destinations when the back arrow is pressed. You can find the updated widget in:

```
lib/item/app_bar_items_updated.dart
```

## Key Features

1. **Custom Back Destination**: Specify where to navigate when the back arrow is pressed
2. **Custom Arrow Icon**: Optionally customize the appearance of the back arrow
3. **Default Behavior**: If no destination is specified, it will use the standard back navigation

## How to Use

### Basic Usage

```dart
AppBarWidget(
  title: 'Page Title',
  imagePath: 'assets/advisorylogostroke.png',
  // Other parameters are optional
)
```

This will create an AppBar with the default back behavior (Navigator.pop).

### Custom Navigation Destination

```dart
AppBarWidget(
  title: 'Page Title',
  imagePath: 'assets/advisorylogostroke.png',
  backDestination: HomeScreen(), // Replace with your desired destination
)
```

This will navigate to the specified screen when the back arrow is pressed.

### Custom Arrow Icon

```dart
AppBarWidget(
  title: 'Page Title',
  imagePath: 'assets/advisorylogostroke.png',
  arrowIcon: Icon(Icons.arrow_back_ios, color: Colors.blue),
)
```

This will display a custom icon for the back arrow.

### Complete Example

```dart
AppBarWidget(
  title: 'My Page',
  imagePath: 'assets/advisorylogostroke.png',
  backDestination: HomeScreen(),
  arrowIcon: Icon(Icons.arrow_back_ios, color: Colors.blue),
)
```

## Implementation Steps

1. Replace imports from `app_bar_items.dart` to `app_bar_items_updated.dart`
2. Update your AppBarWidget usage to include the `backDestination` parameter
3. Optionally customize the arrow icon with the `arrowIcon` parameter

## Example Implementation

An example implementation is provided in:

```
lib/presentation/examples/example_navigation.dart
```

This file contains two screens demonstrating how to use the updated AppBarWidget with custom navigation.

## Notes

- When using `backDestination`, the navigation method used is `Navigator.pushReplacement`
- If you need a different navigation method, you can modify the AppBarWidget implementation
- Make sure the destination widget is properly imported in your file