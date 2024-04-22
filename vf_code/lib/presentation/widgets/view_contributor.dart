part of 'widgets.dart';

/// A [StatelessWidget] representing an app contributor with a profile image, name, and profession.
///
/// This widget is used to display information about contributors, including their
/// profile image, name, and profession. It provides customization options for
/// styling the name and profession text.
///
/// #### Parameters
/// - [name] : The name of the contributor.
/// - [nameTextStyle] : The [TextStyle] for the contributor's name.
/// - [bodyContributor] : The body text of the Contributor information.
/// - [professionTextStyle] : The [TextStyle] for the contributor's profession.
/// - [avatarSize] : The size of the [CircleAvatar], specified as the radius in logical pixels.
/// - [profileIconSize] : The size of the icon that is shown when the user has not a profile image.
/// - [photoUrl] : The URL of the contributor's profile photo.
/// - [spaceBetweenAvatarAndText] : The space between the avatar and the texts.
/// - [spaceBetweenTexts] : The space between the texts.
/// - [isEnabled] : The Boolean flag indicating whether the clickable behaviour of the avatar is enabled.
/// - [onUserAvatarClick] : The function for navigating to the specific User Screen.
class ViewContributor extends StatelessWidget {
  final String name;
  final TextStyle nameTextStyle;
  final String bodyContributor;
  final TextStyle professionTextStyle;
  final int avatarSize;
  final int profileIconSize;
  final String photoUrl;
  final int spaceBetweenAvatarAndText;
  final int spaceBetweenTexts;
  final bool isEnabled;
  final VoidCallback onUserAvatarClick;

  const ViewContributor(
      {super.key,
      required this.name,
      required this.nameTextStyle,
      required this.bodyContributor,
      required this.professionTextStyle,
      required this.photoUrl,
      required this.avatarSize,
      required this.spaceBetweenAvatarAndText,
      this.spaceBetweenTexts = 0,
      required this.isEnabled,
      required this.profileIconSize,
      required this.onUserAvatarClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Profile image
        ViewAvatar(
            photoUrl: photoUrl,
            size: avatarSize,
            iconSize: profileIconSize,
            isEnabled: isEnabled,
            onUserClick: onUserAvatarClick),

        SizedBox(width: spaceBetweenAvatarAndText.w),

        /// Name and Profession
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: nameTextStyle,
                maxLines: 1,
              ),
              SizedBox(height: spaceBetweenTexts.h),
              Text(
                bodyContributor,
                style: professionTextStyle,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
