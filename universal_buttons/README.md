# Universal Buttons

A lightweight Flutter package that provides a set of adaptive, user-friendly button widgets.  
Designed to keep interfaces clean, minimal, and ergonomic while preserving information visibility.

## Features

MyElevatedButton – customizable raised button
MyOutlinedButton – outlined style with full parameter support
MyTextButton – flat text button
MyIconButton – icon-only button with flexible styling
MyPopupMenuButton – two variants: classic three-dot menu and scrollable menu
MyFloatingActionButton – complete implementation with support for mini, extended, tooltip, heroTag, elevation, and more


## Getting started

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  universal_buttons:
    path: ../universal_buttons

```

## Usage

import 'package:universal_buttons/universal_buttons.dart';

```dart

MyElevatedButton(
  onPressed: () {},
  child: const Text('Click Me'),
);

MyOutlinedButton(
  onPressed: () {},
  child: const Text('Outlined'),
);

MyTextButton(
  onPressed: () {},
  child: const Text('Text'),
);

MyIconButton(
  onPressed: () {},
  icon: const Icon(Icons.star),
);

MyPopupMenuButton(
  items: [
    const PopupMenuItem(value: 1, child: Text('Option 1')),
    const PopupMenuItem(value: 2, child: Text('Option 2')),
  ],
);

Scaffold(
  floatingActionButton: MyFloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
    tooltip: 'Add Item',
    isExtended: false,
  ),
);
```

## Additional information

MyFloatingActionButton should always be used via Scaffold.floatingActionButton to avoid layout issues.
All buttons expose the same parameters as their Flutter counterparts, ensuring compatibility and flexibility.

## License

This project is licensed under the MIT License.