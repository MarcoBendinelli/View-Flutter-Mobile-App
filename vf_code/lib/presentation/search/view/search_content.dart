part of "search_screen.dart";

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    String inputSearchTextField = "";

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
              title: AppLocalizations.of(context)!.search, showBackIcon: false),

          SizedBox(
            height: UiConstants.homeContentTopPadding.h,
          ),

          /// Search Text Field.
          SearchTextField(
            onChanged: (String inputText) {
              inputSearchTextField = inputText;
              if (inputText.isNotEmpty) {
                context
                    .read<SearchedPostBloc>()
                    .add(SearchPosts(inputSearchTextField));
              } else {
                context
                    .read<SearchedPostBloc>()
                    .add(const ClearSearchResults());
              }
            },
          ),

          SizedBox(
            height: 40.h,
          ),

          /// Searched posts
          Expanded(child: SearchedPosts(inputText: inputSearchTextField))
        ],
      ),
    );
  }
}
