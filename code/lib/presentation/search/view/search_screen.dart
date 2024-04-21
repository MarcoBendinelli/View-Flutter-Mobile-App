import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/domain/repository/post_repository.dart';
import 'package:view_app/presentation/search/bloc/searched_post_bloc.dart';
import 'package:view_app/presentation/search/view/widgets/searched_posts.dart';
import 'package:view_app/presentation/search/view/widgets/search_text_field.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'search_content.dart';

/// [StatefulWidget] representing the screen in charge of allowing
/// the posts search in base on the post topic, author or name.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  /// Override method from AutomaticKeepAliveClientMixin.
  /// This method is called automatically and determines whether to keep the state alive.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocProvider(
            create: (_) =>
                SearchedPostBloc(postRepository: getIt<PostRepository>()),
            child: const SafeArea(child: SearchContent())));
  }
}
