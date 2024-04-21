part of "bookmarks_screen.dart";

class BookmarksContent extends StatelessWidget {
  const BookmarksContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UiConstants.homeContentTopPadding.h,
        left: UiConstants.homeContentPadding.w,
        right: UiConstants.homeContentPadding.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Top bar.
          NameBackTopBar(
              title: AppLocalizations.of(context)!.saved, showBackIcon: false),

          SizedBox(
            height: UiConstants.homeContentTopPadding.h,
          ),

          /// Posts.
          const Expanded(child: BookmarkedPosts())
        ],
      ),
    );
  }
}
