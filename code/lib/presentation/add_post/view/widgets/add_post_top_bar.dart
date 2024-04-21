import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/presentation/add_post/view/cubit/required_fields/required_fields_cubit.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [StatelessWidget] for rendering a custom top bar with a back button on the left
/// and a publish now button on the right. The publish now button is enabled
/// whenever all the required fields requirements are met.
///
/// #### Parameters:
/// - [onPublishNowTap] : The callback function when the publish now button is clicked.
/// - [onBackTap] : The callback function when the back button is clicked.
class AddPostTopBar extends StatelessWidget {
  final VoidCallback onPublishNowTap;
  final VoidCallback onBackTap;

  const AddPostTopBar(
      {super.key, required this.onPublishNowTap, required this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Back Button
        BackIcon(onClick: () => onBackTap()),

        /// Publish Now button
        BlocBuilder<RequiredFieldsCubit, RequiredFieldsState>(
          builder: (context, state) {
            return ViewClickableText(
                key: Keys.addPostPublishNow,
                isEnabled: state is RequiredFieldsCompletedState,
                onTap: () => onPublishNowTap(),
                text: AppLocalizations.of(context)!.publish_now,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.viewBlue,
                    fontWeight: FontsWeight.semiBold));
          },
        )
      ],
    );
  }
}
