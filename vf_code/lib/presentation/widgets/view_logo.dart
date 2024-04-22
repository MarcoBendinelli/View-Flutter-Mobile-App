part of 'widgets.dart';

/// Widget for displaying the app logo using an SVG image.
///
/// This widget uses the [SvgPicture.asset] to load and display the app logo.
/// The logo is loaded from the asset path specified in [UiConstants.logoAssetPath].
class ViewLogo extends StatelessWidget {
  const ViewLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      UiConstants.logoAssetPath,
      semanticsLabel: "App Logo",
      width: 134.w,
    );
  }
}
