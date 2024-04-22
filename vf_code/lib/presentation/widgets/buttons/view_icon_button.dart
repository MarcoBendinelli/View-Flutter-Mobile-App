part of '../widgets.dart';

/// A clickable icon widget that handles opacity changes during interaction.
///
/// #### Parameters:
/// - [onClick] : The callback function that will be executed when the icon is tapped.
/// - [size] : The size of the icon
/// - [pathAsset] : The path of the svg icon saved in the assets folder
class ViewIconButton extends StatelessWidget {
  final int size;
  final String pathAsset;
  final VoidCallback onClick;

  const ViewIconButton(
      {super.key,
      required this.size,
      required this.pathAsset,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
        onClick: onClick,
        child: SvgPicture.asset(
          pathAsset,
          semanticsLabel: "Icon Button",
          width: size.r,
          height: size.r,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
        ));
  }
}
