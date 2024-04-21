part of "topic_selection_screen.dart";

class TopicSelectionContent extends StatelessWidget {
  const TopicSelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    /// Calculate the available width inside the screen
    double availableWidth = MediaQuery.of(context).size.width;
    double paddings = UiConstants.authContentHPadding.w * 2;
    availableWidth -= paddings;

    return MultiBlocListener(
      listeners: [
        BlocListener<TopicsUsersBloc, TopicsUsersState>(
          listener: (context, state) {
            if (state.status == TopicsUsersStatus.failure) {
              Utils.showErrorSnackBar(context, UiConstants.defaultErrorMessage);
            }
          },
        ),
        BlocListener<FirstSelectionCubit, FirstSelectionState>(
          listener: (context, state) {
            if (state.status == FirstSelectionStatus.failure) {
              Utils.showErrorSnackBar(context, UiConstants.defaultErrorMessage);
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// Top Bar
            BackSkipTopBar(
                onTap: () {
                  Navigator.of(context).push(UserSelectionScreen.route());
                  context.read<FirstSelectionCubit>().resetSelectedTopics();
                },
                showSkip: true),
            Padding(
              padding: EdgeInsets.only(
                  left: UiConstants.authContentHPadding.w,
                  right: UiConstants.authContentHPadding.w,
                  top: 30.h),
              child: Column(
                children: [
                  /// Title
                  Text(
                    AppLocalizations.of(context)!.select_topic,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(height: 40.h),

                  /// Grid of topics
                  BlocBuilder<TopicsUsersBloc, TopicsUsersState>(
                    builder: (context, state) {
                      if (state.status == TopicsUsersStatus.initial) {
                        return const ViewCircularProgress();
                      } else if (state.status == TopicsUsersStatus.success) {
                        /// Calculate rows of topics that correctly fit the screen
                        List<List<ViewTopic>> rows = calculateRows(
                            availableWidth: availableWidth,
                            topics: state.topics!);

                        /// Construct the grid
                        return Column(
                          children: rows.map((row) {
                            return RowOfTopics(
                                topics: row,
                                onClick: (topic) => context
                                    .read<FirstSelectionCubit>()
                                    .selectTopic(topic: topic));
                          }).toList(),
                        );
                      } else {
                        return Text(
                          UiConstants.defaultErrorMessage,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context).colorScheme.secondary),
                        );
                      }
                    },
                  ),

                  SizedBox(height: 30.h),

                  /// Continue button enabled if at least a topic is selected
                  BlocBuilder<FirstSelectionCubit, FirstSelectionState>(
                    builder: (context, state) {
                      return ViewTextButton(
                          key: Keys.topicSelectionContinueKey,
                          textContent:
                              AppLocalizations.of(context)!.continue_text,
                          enabled: state.selectedTopics.isNotEmpty,
                          onClick: () {
                            context
                                .read<FirstSelectionCubit>()
                                .saveTopics(selectedTopics: state.selectedTopics);
                            Navigator.of(context)
                                .push(UserSelectionScreen.route());
                          },
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).colorScheme.tertiary));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A single Row of [ViewTopic]
class RowOfTopics extends StatelessWidget {
  final List<ViewTopic> topics;
  final void Function(ViewTopic) onClick;

  const RowOfTopics({super.key, required this.topics, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: topics.map((topic) {
          return BlocBuilder<FirstSelectionCubit, FirstSelectionState>(
            builder: (context, state) {
              /// Individual Filter Button for each topic
              return ViewFilterButton(
                key: Keys.topicKey(topic.topicName),
                textContent: topic.topicName,
                onClick: () => onClick(topic),
                isSelected: state.selectedTopics.contains(topic),
                isOpacityBehaviour: false,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

/// Calculates the number of [ViewTopic] that fit the screen based on the length
/// of the topic names and the available width.
List<List<ViewTopic>> calculateRows(
    {required List<ViewTopic> topics, required double availableWidth}) {
  List<ViewTopic> chunkOfTopics = [];
  List<List<ViewTopic>> chunkedTopics = [];
  double currentWidth = 0.0;
  double topicButtonWidth = 0.0;

  for (int index = 0; index < topics.length; index++) {
    topicButtonWidth = buttonWidth(topic: topics[index]);
    currentWidth += topicButtonWidth;
    chunkOfTopics.add(topics[index]);

    if (currentWidth > availableWidth) {
      chunkedTopics.add(List.from(chunkOfTopics));
      chunkOfTopics.clear();
      currentWidth = 0.0;
    }
  }

  return chunkedTopics;
}

/// It estimates the width of a single [ViewFilterButton]
double buttonWidth({required ViewTopic topic}) {
  int maxTextLength = topic.topicName.length;
  double textSize = 14.sp;
  double padding = 18.w;
  double totalPadding = padding * 2;
  double textWidth = maxTextLength * textSize;
  return textWidth + totalPadding;
}
