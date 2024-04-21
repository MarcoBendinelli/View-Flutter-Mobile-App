part of 'add_post_screen.dart';

class AddPostContent extends StatefulWidget {
  const AddPostContent({super.key});

  @override
  State<AddPostContent> createState() => _AddPostContentState();
}

class _AddPostContentState extends State<AddPostContent> {
  String _postTitle = "";
  String _postSubtitle = "";
  String _postBody = "";
  String _postTopic = "";
  XFile? _postImage;
  late FocusNode _subtitleFocusNode;
  late FocusNode _bodyFocusNode;

  @override
  void initState() {
    super.initState();
    _postTopic = context.read<FirstTopicCubit>().state;
    _subtitleFocusNode = FocusNode();
    _bodyFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _subtitleFocusNode.dispose();
    _bodyFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final username = context.select((AppBloc bloc) => bloc.state.user.username);

    return BlocListener<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is SuccessAddPostState) {
          Navigator.of(context).pop();
        } else if (state is FailureAddPostState) {
          Utils.showErrorSnackBar(context, state.errorMessage);
        }
      },
      child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                  top: UiConstants.homeContentTopPadding.h,
                  left: UiConstants.homeContentPadding.w,
                  right: UiConstants.homeContentPadding.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Top Bar
                    AddPostTopBar(
                        onPublishNowTap: () {
                          context.read<AddPostCubit>().addPost(
                              authorName: username,
                              title: _postTitle,
                              subtitle: _postSubtitle,
                              image: _postImage,
                              topic: _postTopic,
                              body: _postBody,
                              readTime: Utils.estimateReadTime(
                                  text: _postBody, context: context));
                        },
                        onBackTap: () => Navigator.pop(context)),

                    SizedBox(
                      height: UiConstants.homeContentTopPadding.h,
                    ),

                    /// Post Title
                    AddPostTextField(
                        key: Keys.addPostTitleKey,
                        hintText: AppLocalizations.of(context)!.add_title,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: AppColors.viewGray),
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                        onAction: () => _subtitleFocusNode.requestFocus(),
                        imeAction: TextInputAction.next,
                        onChanged: (inputText) {
                          _postTitle = inputText;
                          context
                              .read<RequiredFieldsCubit>()
                              .updateRequiredFields(
                                  title: _postTitle,
                                  subtitle: _postSubtitle,
                                  body: _postBody);
                        }),

                    SizedBox(
                      height: 20.h,
                    ),

                    /// Post Subtitle
                    AddPostTextField(
                        key: Keys.addPostSubtitleKey,
                        hintText: AppLocalizations.of(context)!.add_subtitle,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColors.viewGray),
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontsWeight.semiBold),
                        onAction: () => _bodyFocusNode.requestFocus(),
                        imeAction: TextInputAction.next,
                        textFieldFocusNode: _subtitleFocusNode,
                        onChanged: (inputText) {
                          _postSubtitle = inputText;
                          context
                              .read<RequiredFieldsCubit>()
                              .updateRequiredFields(
                                  title: _postTitle,
                                  subtitle: _postSubtitle,
                                  body: _postBody);
                        }),

                    SizedBox(
                      height: 20.h,
                    ),

                    /// Upload Image
                    UploadImage(onTap: (image) {
                      _postImage = image;
                    }),

                    SizedBox(
                      height: 20.h,
                    ),

                    /// Topics
                    BlocBuilder<TopicsCubit, List<String>>(
                        builder: (context, topics) {
                      return ScrollableFilters(
                          showNewestTopic: false,
                          topics: topics,
                          callback: (selectedTopic) {
                            setState(() {
                              _postTopic = selectedTopic;
                            });
                          },
                          selectedFilter: _postTopic);
                    }),

                    SizedBox(
                      height: 40.h,
                    ),

                    /// Post Body
                    AddPostTextField(
                        key: Keys.addPostBodyKey,
                        hintText:
                            AppLocalizations.of(context)!.start_typing_here,
                        labelStyle: Theme.of(context).textTheme.titleSmall!,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                        keyboardType: TextInputType.multiline,
                        onAction: () => {},
                        imeAction: TextInputAction.newline,
                        textFieldFocusNode: _bodyFocusNode,
                        onChanged: (inputText) {
                          _postBody = inputText;
                          context
                              .read<RequiredFieldsCubit>()
                              .updateRequiredFields(
                                  title: _postTitle,
                                  subtitle: _postSubtitle,
                                  body: _postBody);
                        }),

                    SizedBox(
                      height: 20.h,
                    ),
                  ]))),
    );
  }
}
