part of '../widgets.dart';

/// A clickable back icon widget that handles opacity changes during interaction.
///
/// #### Parameters:
/// [onClick] : The callback function executed on click.
class BackIcon extends StatelessWidget {
  final VoidCallback onClick;

  const BackIcon({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
        key: Keys.backIconKey,
        onClick: onClick,
        child: Container(
          width: 40.r,
          height: 40.r,
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SvgPicture.asset(
            UiConstants.backIconAssetPath,
            semanticsLabel: "Back Icon",
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
          ),
        ));
  }
}
