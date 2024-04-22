part of 'widgets.dart';

/// Widget for displaying a circular progress indicator.
///
/// #### Parameters:
/// - [strokeWidth] : The stroke width of the indicator.
class ViewCircularProgress extends StatelessWidget {
  const ViewCircularProgress({super.key, this.strokeWidth = 3.0});

  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
