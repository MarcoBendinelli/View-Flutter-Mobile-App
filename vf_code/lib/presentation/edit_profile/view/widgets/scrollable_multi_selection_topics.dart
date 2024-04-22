import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

/// [StatelessWidget] representing a horizontal scrollable list of filters
/// that allows to select more topics.
///
/// #### Parameters:
/// - [topics] : The list of strings representing the filter topics.
/// - [selectedTopics] : The current selected topics by the user.
/// - [callback] : The custom callback function that takes the string topic as input.
class ScrollableMultiSelectionTopics extends StatelessWidget {
  const ScrollableMultiSelectionTopics(
      {super.key,
      required this.topics,
      required this.callback,
      required this.selectedTopics});

  final List<String> topics;
  final List<String> selectedTopics;
  final StringCallback callback;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: topics
              .map((topic) => Padding(
                  padding:
                      EdgeInsets.only(right: topics.last == topic ? 0 : 15.w),
                  child: ViewFilterButton(
                      textContent: topic,
                      onClick: () {
                        callback(topic);
                      },
                      isSelected: selectedTopics.contains(topic),
                      isOpacityBehaviour: true)))
              .toList(),
        ));
  }
}
