part of 'widgets.dart';

/// [StatelessWidget] representing a horizontal scrollable list of filters.
///
/// #### Parameters:
/// - [showNewestTopic] : The boolean variable to show / hide the "Newest" topic.
/// - [topics] : The list of strings representing the filter topics.
/// - [selectedFilter] : The current selected filter by the user.
/// - [callback] : The custom callback function that takes the string topic as input.
class ScrollableFilters extends StatelessWidget {
  const ScrollableFilters(
      {super.key,
      required this.topics,
      required this.callback,
      required this.selectedFilter,
      required this.showNewestTopic});

  final List<String> topics;
  final String selectedFilter;
  final StringCallback callback;
  final bool showNewestTopic;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            showNewestTopic
                ? Padding(
                    padding: EdgeInsets.only(right: topics.isEmpty ? 0 : 15.w),
                    child: ViewFilterButton(
                        textContent: AppLocalizations.of(context)!.newest,
                        onClick: () {
                          callback(AppLocalizations.of(context)!.newest);
                        },
                        isSelected: selectedFilter ==
                            AppLocalizations.of(context)!.newest,
                        isOpacityBehaviour: true))
                : const SizedBox(),
            Row(
              children: topics
                  .map((topic) => Padding(
                      padding: EdgeInsets.only(
                          right: topics.last == topic ? 0 : 15.w),
                      child: ViewFilterButton(
                          textContent: topic,
                          onClick: () {
                            callback(topic);
                          },
                          isSelected: selectedFilter == topic,
                          isOpacityBehaviour: true)))
                  .toList(),
            ),
          ],
        ));
  }
}
