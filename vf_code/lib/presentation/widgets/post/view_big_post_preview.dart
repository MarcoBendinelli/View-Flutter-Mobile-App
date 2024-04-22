part of '../widgets.dart';

/// [StatelessWidget] representing a big post preview with contributor information and text content.
///
/// The [ViewBigPostPreview] widget displays a column containing contributor
/// information, post title, post content, and additional details.
///
/// #### Parameters:
/// - [post] : The [ViewPost] to display.
/// - [onBookmarkClick] : The callback on bookmark click.
class ViewBigPostPreview extends StatelessWidget {
  const ViewBigPostPreview(
      {super.key, required this.post, required this.onBookmarkClick});

  final ViewPost post;
  final VoidCallback onBookmarkClick;

  @override
  Widget build(BuildContext context) {
    final userId = context.select((AppBloc bloc) => bloc.state.user.id);

    return OpacityButton(
      onClick: () => Navigator.of(context)
          .push(PostScreen.route(postId: post.id, comingFromUserScreen: false)),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            /// Contributor Information with Post Title
            ViewContributor(
              name: post.authorName,
              nameTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  overflow: TextOverflow.ellipsis),
              bodyContributor: post.title,
              professionTextStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontsWeight.semiBold),
              photoUrl: post.authorPhotoUrl,
              avatarSize: 15,
              spaceBetweenAvatarAndText: 8,
              profileIconSize: 14,
              isEnabled: true,
              onUserAvatarClick: () => Navigator.of(context).push(
                  UserProfileScreen.route(
                      userId: post.authorId, postId: post.id)),
            ),

            SizedBox(height: 20.h),

            /// Post Subtitle
            Text(
              post.subtitle,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontsWeight.semiBold,
                  overflow: TextOverflow.ellipsis),
              maxLines: 2,
            ),

            SizedBox(height: 10.h),

            /// Post Content
            Text(
              post.body,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(overflow: TextOverflow.ellipsis),
              maxLines: 4,
            ),

            SizedBox(height: 20.h),

            /// Read Time and Bookmark button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${AppLocalizations.of(context)!.read_time} ${post.readTime}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontsWeight.medium),
                ),
                GestureDetector(
                  onTap: onBookmarkClick,
                  child: SvgPicture.asset(
                    post.bookmarkedBy.contains(userId)
                        ? UiConstants.bookmarkBlueAssetPath
                        : UiConstants.bookmarkAssetPath,
                    semanticsLabel: "Bookmark Icon",
                    height: 20.h,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
