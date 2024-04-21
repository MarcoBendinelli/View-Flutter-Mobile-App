import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [StatelessWidget] to display user statistics such as number of followers,
/// following and posts.
///
/// #### Parameters:
/// - [numOfFollowers] : The number of followers.
/// - [numOfFollowing] : The number of following.
/// - [numOfPosts] : The number of posts.
class Statistics extends StatelessWidget {
  const Statistics(
      {super.key,
      required this.numOfFollowers,
      required this.numOfFollowing,
      required this.numOfPosts});

  final int numOfFollowers;
  final int numOfFollowing;
  final int numOfPosts;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColumnStat(
            topStat: numOfFollowers,
            bottomStat: AppLocalizations.of(context)!.followers),
        SizedBox(width: 40.w),
        ColumnStat(
            topStat: numOfFollowing,
            bottomStat: AppLocalizations.of(context)!.following),
        SizedBox(width: 40.w),
        ColumnStat(
            topStat: numOfPosts,
            bottomStat: AppLocalizations.of(context)!.posts),
      ],
    );
  }
}

/// Column of statistics with a numeric value and a label.
///
/// ### Parameters:
/// - [topStat] : The numeric value to be displayed.
/// - [bottomStat] : The label for the statistic.
class ColumnStat extends StatelessWidget {
  const ColumnStat(
      {super.key, required this.topStat, required this.bottomStat});

  final int topStat;
  final String bottomStat;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Utils.abbreviateNumber(topStat),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontsWeight.semiBold,
              color: Theme.of(context).colorScheme.secondary),
        ),
        SizedBox(height: 10.h),
        Text(bottomStat, style: Theme.of(context).textTheme.titleSmall)
      ],
    );
  }
}
