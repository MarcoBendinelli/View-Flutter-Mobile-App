import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Custom search text field [StatelessWidget].
///
/// #### Parameters:
/// - [onChanged] : The callback that is invoked when the text in the text field changes.
class SearchTextField extends StatelessWidget {
  final StringCallback onChanged;

  const SearchTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
          width: 1.0, // Set the border width
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
        child: Row(
          children: [
            SvgPicture.asset(
              UiConstants.searchAssetPath,
              semanticsLabel: "Back Icon",
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  hintText: AppLocalizations.of(context)!.search,
                  border: InputBorder.none,
                  labelStyle: Theme.of(context).textTheme.titleSmall,
                ),
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.search,
                textAlign: TextAlign.start,
                onChanged: (insertedText) {
                  onChanged(insertedText);
                },
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                cursorColor: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
