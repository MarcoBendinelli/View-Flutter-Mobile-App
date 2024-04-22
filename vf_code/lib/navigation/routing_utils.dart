import 'package:flutter/material.dart';

/// Generates a [MaterialPageRoute] using the provided `content` widget.
///
/// This function simplifies the creation of a [MaterialPageRoute] by taking a
/// widget `content` and returning a [MaterialPageRoute] with the provided
/// widget as its builder.
///
/// #### Parameters:
/// - [content]: The widget to be used as the content for the [MaterialPageRoute].
/// - [name]: The name of the screen.
///
/// **Returns** a [MaterialPageRoute] with the provided `content` widget as its builder.
viewRoute(Widget content, String name) => MaterialPageRoute(
    settings: RouteSettings(name: name), builder: (_) => content);

/// Generates a [MaterialPage] with the provided widget as its child.
///
/// This function simplifies the creation of a [MaterialPage] by taking a
/// widget [child] and returning a [MaterialPage] with the provided
/// widget set as its child.
///
/// #### Parameters:
/// - [child]: The widget to be set as the child for the [MaterialPage].
/// - [name]: The name of the screen.
///
/// **Returns** a [MaterialPage] with the provided [child] widget.
viewPage(Widget child, String name) => MaterialPage(child: child, name: name);
