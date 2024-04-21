import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/app/bloc/app_event.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/presentation/edit_profile/edit_profile.dart';
import 'package:view_app/presentation/settings/view/widgets/settings_row.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'settings_content.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const SafeArea(child: SettingsContent()),
    );
  }
}
