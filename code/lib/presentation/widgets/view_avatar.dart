part of 'widgets.dart';

/// A widget that displays a [CircleAvatar] with a possible empty photo.
///
/// The [ViewAvatar] widget is designed to show a circular avatar with an
/// optional photo retrieved from a [URL]. If no photo URL is provided, it
/// displays a default placeholder icon.
///
/// #### Parameters:
/// - [photoUrl] : The URL of the photo to display in the avatar.
/// - [size] : The size of the avatar, specified as the radius in logical pixels.
/// - [iconSize] : The size of the profile icon shown when the user has not a profile image.
/// - [isEnabled] Boolean flag indicating whether the clickable behaviour is enabled.
/// - [onUserClick] The function for navigating to the specific User Screen.
class ViewAvatar extends StatelessWidget {
  const ViewAvatar(
      {super.key,
      required this.photoUrl,
      required this.size,
      required this.iconSize,
      required this.isEnabled,
      required this.onUserClick});

  final String photoUrl;
  final int size;
  final int iconSize;
  final bool isEnabled;
  final VoidCallback onUserClick;

  @override
  Widget build(BuildContext context) {
    // Build a circle avatar with a background image if a photo URL is available,
    // otherwise, display a placeholder icon.
    if (isEnabled) {
      return OpacityButton(
        onClick: onUserClick,
        child: photoUrl == ''
            ? CircleAvatar(
                radius: size.r,
                child: SvgPicture.asset(
                  UiConstants.profileAssetPath,
                  semanticsLabel: "Profile Icon",
                  height: iconSize.r,
                  width: iconSize.r,
                ))
            : CircleAvatar(
                radius: size.r,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    photoUrl,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(child: ViewSmallCircularProgress());
                      }
                    },
                  ),
                ),
              ),
      );
    } else {
      return photoUrl == ''
          ? CircleAvatar(
              radius: size.r,
              child: SvgPicture.asset(
                UiConstants.profileAssetPath,
                semanticsLabel: "Profile Icon",
                height: iconSize.r,
                width: iconSize.r,
              ))
          : CircleAvatar(
              radius: size.r,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.network(
                  photoUrl,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(child: ViewSmallCircularProgress());
                    }
                  },
                ),
              ),
            );
    }
  }
}
