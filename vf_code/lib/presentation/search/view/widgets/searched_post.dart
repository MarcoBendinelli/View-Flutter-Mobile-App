import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/presentation/post/view/post_screen.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

/// [StatelessWidget] representing a small post preview with an image and text content
/// to display in the Search screen.
///
/// The [SearchedPost] widget differs from the [ViewSmallPostPreview] because
/// it displays the topic instead of the time elapsed since its creation.
///
/// #### Parameters:
/// - [post] : the [ViewPost] to display.
class SearchedPost extends StatelessWidget {
  final ViewPost post;

  const SearchedPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onClick: () => Navigator.of(context)
          .push(PostScreen.route(postId: post.id, comingFromUserScreen: false)),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          children: [
            /// Post Image
            Container(
              width: 68.r,
              height: 68.r,
              decoration: ShapeDecoration(
                color: post.imageUrl != '' ? Colors.black : AppColors.viewBlue,
                image: post.imageUrl != ''
                    ? DecorationImage(
                        image: NetworkImage(post.imageUrl), fit: BoxFit.cover)
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: post.imageUrl != ''
                  ? const SizedBox()
                  : Center(
                      child: SvgPicture.asset(
                        UiConstants.documentAssetPath,
                        semanticsLabel: "Document Icon",
                        width: 30.w,
                      ),
                    ),
            ),

            SizedBox(
              width: 12.w,
            ),

            /// Text Content
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(post.topic.topicName,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(overflow: TextOverflow.ellipsis)),
                  SizedBox(height: 2.h),
                  Text(post.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontWeight: FontsWeight.semiBold,
                              color: Theme.of(context).colorScheme.secondary,
                              overflow: TextOverflow.ellipsis)),
                  SizedBox(height: 2.h),
                  Text(post.body,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(overflow: TextOverflow.ellipsis)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
