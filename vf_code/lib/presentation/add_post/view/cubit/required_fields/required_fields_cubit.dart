import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/core/utils.dart';

part 'required_fields_state.dart';

part 'required_fields_cubit.freezed.dart';

/// A Cubit responsible for managing the state related to the completion of required fields.
///
/// The [RequiredFieldsCubit] monitors the word count of individual fields (title, subtitle, and body)
/// and emits states based on whether each field meets the minimum word count requirements.
class RequiredFieldsCubit extends Cubit<RequiredFieldsState> {
  RequiredFieldsCubit() : super(const RequiredFieldsMissingState());

  /// Updates the required fields and triggers state changes accordingly.
  ///
  /// This method takes the word count of the title, subtitle, and body as parameters.
  /// If any of these fields falls short of the minimum word count requirements, it emits
  /// a [RequiredFieldsMissingState]. Once all fields meet the minimum requirements,
  /// it emits a [RequiredFieldsCompletedState].
  ///
  /// #### Parameters:
  /// - [title] : The title of the content.
  /// - [subtitle] : The subtitle of the content.
  /// - [body] : The body or main content of the post.
  void updateRequiredFields(
      {required String title, required String subtitle, required String body}) {
    final titleWords = title.noEmptyWordsCount;
    final subtitleWords = subtitle.noEmptyWordsCount;
    final bodyWords = body.noEmptyWordsCount;

    // Check if any field falls short of the minimum word count requirements.
    if (titleWords < Constants.minTitleWords ||
        subtitleWords < Constants.minSubtitleWords ||
        bodyWords < Constants.minBodyWords) {
      emit(const RequiredFieldsMissingState());
    } else {
      // All required fields meet the minimum word count requirements.
      emit(const RequiredFieldsCompletedState());
    }
  }
}
