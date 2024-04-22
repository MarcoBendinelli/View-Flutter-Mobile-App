part of '../widgets.dart';

/// Custom button widget with configurable opacity behavior.
///
/// This button provides a customizable opacity effect during user interactions.
/// It can be used as parent of widget that must be buttons and
/// handle the opacity effect on click events.
///
/// ##### Parameters
/// - [onClick] : Callback function to be executed when the button is tapped or dragged.
/// - [child] : The child widget placed inside the button.
/// - [enabled] : A flag indicating whether the button is enabled or not. When disabled,
///   the button will have a lower opacity and won't respond to user interactions.
class OpacityButton extends StatefulWidget {
  const OpacityButton(
      {super.key,
      required this.onClick,
      required this.child,
      this.enabled = true});

  final VoidCallback onClick;
  final Widget child;
  final bool enabled;

  @override
  State<OpacityButton> createState() => _OpacityButtonState();
}

class _OpacityButtonState extends State<OpacityButton> {
  /// The opacity value for the button.
  double opacity = UiConstants.maxOpacity;

  /// Handles tap down event to update the button's opacity.
  void _handleTapDown(TapDownDetails _) {
    setState(() {
      opacity = UiConstants.minOpacity;
    });
  }

  /// Handles tap up event to update the button's opacity and execute the callback.
  void _handleTapUp(TapUpDetails _) {
    setState(() {
      opacity = UiConstants.maxOpacity;
    });
    widget.onClick();
  }

  void _handleTapCancel() {
    setState(() {
      opacity = UiConstants.maxOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.enabled ? _handleTapDown : null,
      onTapUp: widget.enabled ? _handleTapUp : null,
      onTapCancel: widget.enabled ? _handleTapCancel : null,
      child: Opacity(
        opacity: widget.enabled ? opacity : UiConstants.minOpacity,
        child: widget.child,
      ),
    );
  }
}
