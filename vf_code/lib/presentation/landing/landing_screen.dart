import 'package:flutter/material.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/bookmarks/bookmarks.dart';
import 'package:view_app/presentation/home/home.dart';
import 'package:view_app/presentation/search/search.dart';
import 'package:view_app/presentation/settings/view/settings_screen.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

/// [StatelessWidget] representing the landing screen with a bottom navigation bar.
///
/// The [LandingScreen] widget is the main screen that displays a bottom navigation
/// bar and a [PageView] containing one one the main pages of the app: [HomeScreen],
/// [SearchScreen], [BookmarkScreen], and [SettingsScreen].
/// It also allows to navigate to the [AddPostScreen] to create a new post.
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static MaterialPage<void> page() =>
      viewPage(const LandingScreen(), Constants.landingScreen);

  @override
  Widget build(BuildContext context) {
    /// Page controller for handling page navigation
    PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: Colors.transparent,

      /// Bottom Navigation Bar
      bottomNavigationBar: ViewBottomNavBar(pageController: pageController),

      /// Body with PageView
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(key: PageStorageKey<String>('home_screen')),
          SearchScreen(),
          BookmarksScreen(),
          SettingsScreen()
        ],
      ),
    );
  }
}
