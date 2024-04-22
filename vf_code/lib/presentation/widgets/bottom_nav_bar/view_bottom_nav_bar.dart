part of '../widgets.dart';

/// A custom bottom navigation bar with an add button in the center.
///
/// This widget is designed to work with a [PageController] to control the pages
/// displayed. It includes clickable items, each represented by an svg icon loaded from the assets.
/// Additionally, it display a [ViewAddButton] aligned with other items inside the navigation bar.
///
/// #### Parameters:
/// - [pageController] : The controller that controls the pages displayed.
class ViewBottomNavBar extends StatefulWidget {
  const ViewBottomNavBar({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<ViewBottomNavBar> createState() => _ViewBottomNavBarState();
}

class _ViewBottomNavBarState extends State<ViewBottomNavBar> {
  /// The index of the currently selected page.
  int _currentPage = 0;

  /// Gets the asset path for the icon at the given page index.
  String getIconAssetPath(int pageIndex) {
    if (_currentPage == pageIndex) {
      if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
        return UiConstants.iconFilledDarkAssetPaths[pageIndex];
      } else {
        return UiConstants.iconFilledAssetPaths[pageIndex];
      }
    } else {
      return UiConstants.iconAssetPaths[pageIndex];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.h,
      child: BottomAppBar(
        color: Theme.of(context).colorScheme.background,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            for (int pageIndex = 0; pageIndex < 2; pageIndex++)
              ViewBottomNavBarItem(
                  key: pageIndex == 0
                      ? Keys.homeNavBarButtonKey
                      : Keys.searchNavBarButtonKey,
                  onClick: () {
                    setState(() {
                      _currentPage = pageIndex;
                    });
                    widget.pageController.jumpToPage(pageIndex);
                  },
                  iconHeight: 20,
                  iconAssetPath: getIconAssetPath(pageIndex)),
            ViewAddButton(
                key: Keys.addPostButtonKey,
                onClick: () {
                  Navigator.of(context).push(AddPostScreen.route());
                }),
            for (int pageIndex = 2; pageIndex < 4; pageIndex++)
              ViewBottomNavBarItem(
                  key: pageIndex == 2
                      ? Keys.bookmarksNavBarButtonKey
                      : Keys.settingsNavBarButtonKey,
                  onClick: () {
                    setState(() {
                      _currentPage = pageIndex;
                    });
                    widget.pageController.jumpToPage(pageIndex);
                  },
                  iconHeight: 20,
                  iconAssetPath: getIconAssetPath(pageIndex)),
          ],
        ),
      ),
    );
  }
}
