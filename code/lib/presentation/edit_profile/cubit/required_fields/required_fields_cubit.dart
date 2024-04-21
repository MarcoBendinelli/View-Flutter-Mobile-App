import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'required_fields_state.dart';

part 'required_fields_cubit.freezed.dart';

/// A Cubit responsible for managing the state related to the completion of required fields.
///
/// The [RequiredFieldsCubit] monitors the word count of individual fields (username and profession)
/// and emits states based on whether each field meets the minimum word count requirements.
class RequiredFieldsCubit extends Cubit<RequiredFieldsState> {
  RequiredFieldsCubit(
      {required this.currentUsername, required this.currentProfession})
      : super(currentUsername.isEmpty || currentProfession.isEmpty
            ? const RequiredFieldsMissingState()
            : const RequiredFieldsCompletedState());

  final String currentUsername;
  final String currentProfession;

  /// Updates the required fields and triggers state changes accordingly.
  ///
  /// If any of the required fields is empty, it emits
  /// a [RequiredFieldsMissingState]. Once all fields meet the minimum requirements,
  /// it emits a [RequiredFieldsCompletedState].
  ///
  /// #### Parameters:
  /// - [username] : The title of the content.
  /// - [profession] : The subtitle of the content.
  void updateRequiredFields(
      {required String username, required String profession}) {
    // Check if any field is empty.
    if (username.isEmpty || profession.isEmpty) {
      emit(const RequiredFieldsMissingState());
    } else {
      // All required fields meet the minimum word count requirements.
      emit(const RequiredFieldsCompletedState());
    }
  }
}
