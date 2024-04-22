part of 'widgets.dart';

/// A widget representing a post card for the "For You" section.
///
/// The [ForYouPostCard] widget displays the image of the post with rounded corners,
/// the post title and read time.
///
/// #### Parameters:
/// - [post] : The [ViewPost] instance representing the post to display.
class ForYouPostCard extends StatelessWidget {
  const ForYouPostCard({super.key, required this.post});

  final ViewPost post;

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onClick: () => Navigator.of(context)
          .push(PostScreen.route(postId: post.id, comingFromUserScreen: false)),
      child: Container(
        width: 295.w,
        height: 200.h,
        decoration: ShapeDecoration(
          color: post.imageUrl.isNotEmpty
              ? Colors.transparent
              : AppColors.viewBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Stack(
          children: [
            post.imageUrl != ''
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Container(
                      color: Colors.black,
                      child: Image.network(
                        opacity: const AlwaysStoppedAnimation(.7),
                        post.imageUrl,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Container(
                              color: Theme.of(context).colorScheme.background,
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: const ViewSmallCircularProgress(),
                              )),
                            );
                          }
                        },
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      UiConstants.documentAssetPath,
                      semanticsLabel: "Document Icon",
                      width: 50.w,
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontsWeight.semiBold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    Utils.calculateTimeAgoString(
                        post.createdAt.toDate(), context),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white, fontWeight: FontsWeight.light),
                  ),
                  SizedBox(height: 14.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
