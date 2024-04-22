part of 'widgets.dart';

/// A widget representing the top bar of the home screen.
///
/// The [HomeTopBar] displays the user's username and profile image at the top
/// of the home screen. It also provides a welcome message and a brief description of
/// the content to be displayed on the home screen.
///
/// #### Parameters:
///
/// - [userId] : The id of the current user.
/// - [username] : The username of the current user.
/// - [photoUrl] : The URL of the user's profile photo.
class HomeTopBar extends StatelessWidget {
  const HomeTopBar(
      {super.key,
      required this.userId,
      required this.username,
      required this.photoUrl});

  final String userId;
  final String username;
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          /// Home title
          Flexible(
            child: Text(
              '${AppLocalizations.of(context)!.hello}, $username!',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontsWeight.semiBold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 10.w),

          /// Profile Image
          ViewAvatar(
            key: Keys.homeAvatarButtonKey,
            photoUrl: photoUrl,
            size: 21,
            iconSize: 16,
            isEnabled: true,
            onUserClick: () => Navigator.of(context)
                .push(UserProfileScreen.route(userId: userId, postId: "nothing")),
          )
        ]),

        /// Home body
        Text(
          AppLocalizations.of(context)!.hello_body,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontFamily: sourceSans3),
        ),
      ],
    );
  }
}
