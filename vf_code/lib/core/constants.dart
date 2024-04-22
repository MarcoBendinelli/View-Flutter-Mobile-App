/// Class containing various constants used throughout the application.
class Constants {
  /// Firestore Collection References
  static const usersCollection = 'users';
  static const postsCollection = 'posts';

  /// Firestore User fields
  static const usersIdField = 'id';
  static const usersUsernameField = 'username';
  static const usersEmailField = 'email';
  static const usersProfessionField = 'profession';
  static const usersProfessionDefault = 'Hi! I am a new contributor!';
  static const usersPhotoUrlField = 'photo_url';
  static const usersCreatedAtField = 'created_at';
  static const usersTopicsField = 'topics';
  static const usersFollowingField = 'following';
  static const usersFollowersField = 'followers';

  /// Firestore Post fields
  static const postsAuthorIdField = 'author_id';
  static const postsAuthorNameField = 'author_name';
  static const postsAuthorPhotoUrlField = 'author_photo_url';
  static const postsIdField = 'id';
  static const postsTitleField = 'title';
  static const postsSubtitleField = 'subtitle';
  static const postsBodyField = 'body';
  static const postsImageUrlField = 'image_url';
  static const postsCreatedAtField = 'created_at';
  static const postsTopicField = 'topic';
  static const postsReadTimeField = 'read_time';
  static const postsBookmarkedByField = 'bookmarked_by';

  static const newestFilter = "Newest";

  /// Limit number of posts retrieved from Firebase
  static const forYouPostsLimitRate = 2;
  static const followingPostsLimitRate = 3;
  static const bookmarkedPostsLimitRate = 4;
  static const searchedPostsLimitRate = 6;
  static const userPostsLimitRate = 4;
  static const morePostsLimitRate = 2;

  /// Min number of words in Post creation
  static const minTitleWords = 3;
  static const minSubtitleWords = 3;
  static const minBodyWords = 20;

  /// Limit number of users retrieved from Firebase
  static const numOfMostFollowedUsersToDisplay = 20;

  /// Screens
  static const authScreen = '/authentication';
  static const homeScreen = '/home';
  static const signUpScreen = '/sign_up';
  static const topicSelectionScreen = '/topic_selection';
  static const userSelectionScreen = '/user_selection';
  static const forgotPasswordScreen = '/forgot_password';
  static const emailSentScreen = '/email_sent';
  static const signInScreen = '/sign_in';
  static const landingScreen = '/landing';
  static const userProfileScreen = '/user_profile';
  static const postScreen = '/post';
  static const editProfileScreen = '/edit_profile';

  /// Dimensions inside the View design
  static const prototypeWidth = 375.0;
  static const prototypeHeight = 734.0;
}

/// Enum representing different options for signing in.
enum SignInOption { google, email }
