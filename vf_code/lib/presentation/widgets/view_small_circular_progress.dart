part of 'widgets.dart';

/// A smaller [ViewCircularProgress] that displays a small circular progress indicator.
class ViewSmallCircularProgress extends StatelessWidget {
  const ViewSmallCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.r,
      width: 24.r,
      child: const ViewCircularProgress(strokeWidth: 1.5),
    );
  }
}
