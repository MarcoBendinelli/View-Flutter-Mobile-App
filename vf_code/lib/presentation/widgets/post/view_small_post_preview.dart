part of '../widgets.dart';

/// [StatelessWidget] representing a small post preview with an image and text content.
///
/// The [ViewSmallPostPreview] widget displays a row with an image on
/// the left and a flexible column on the right containing various text
/// elements.
///
/// #### Parameters:
/// - [post] : the [ViewPost] to display.
/// - [comingFromPostId] : The id of the post from which the user clicked the avatar to navigate to the User Screen.
/// - [comingFromUserScreen] : Whether the Screen has been pushed fro the User Screen.
class ViewSmallPostPreview extends StatelessWidget {
  const ViewSmallPostPreview(
      {super.key,
      required this.post,
      required this.comingFromPostId,
      required this.comingFromUserScreen});

  final ViewPost post;
  final String comingFromPostId;
  final bool comingFromUserScreen;

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onClick: () => post.id == comingFromPostId
          ? Navigator.of(context).pop()
          : Navigator.of(context).push(PostScreen.route(
              postId: post.id, comingFromUserScreen: comingFromUserScreen)),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          children: [
            /// Post Image
            Container(
              width: 90.r,
              height: 90.r,
              decoration: ShapeDecoration(
                color: post.imageUrl != ''
                    ? Colors.transparent
                    : AppColors.viewBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: post.imageUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        post.imageUrl,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: const ViewSmallCircularProgress(),
                            ));
                          }
                        },
                      ),
                    )
                  : Center(
                      child: SvgPicture.asset(
                        UiConstants.documentAssetPath,
                        semanticsLabel: "Document Icon",
                        width: 40.w,
                      ),
                    ),
            ),

            SizedBox(
              width: 20.w,
            ),

            /// Text Content
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(post.authorName,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(overflow: TextOverflow.ellipsis)),
                  SizedBox(height: 3.h),
                  Text(post.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontWeight: FontsWeight.semiBold,
                              color: Theme.of(context).colorScheme.secondary,
                              overflow: TextOverflow.ellipsis)),
                  SizedBox(height: 3.h),
                  Text(post.body,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(overflow: TextOverflow.ellipsis)),
                  SizedBox(height: 3.h),
                  Text(
                      Utils.calculateTimeAgoString(
                          post.createdAt.toDate(), context),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontFamily: roboto, fontWeight: FontsWeight.light)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
