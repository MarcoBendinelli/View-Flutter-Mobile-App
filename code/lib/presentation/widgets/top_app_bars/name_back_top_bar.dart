part of '../widgets.dart';

/// A top bar with a title and an optional Back Icon.
///
/// #### Parameters
/// - [title] : The text to be displayed in the top bar.
/// - [showBackIcon] : Whether the back icon should be shown or not.
class NameBackTopBar extends StatelessWidget {
  const NameBackTopBar(
      {super.key, required this.title, required this.showBackIcon});

  final String title;
  final bool showBackIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        showBackIcon
            ? Align(
                alignment: Alignment.centerLeft,
                child: BackIcon(
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
              )
            : const SizedBox(),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontsWeight.semiBold,
                color: Theme.of(context).colorScheme.secondary),
          ),
        )
      ],
    );
  }
}
