part of 'required_fields_cubit.dart';

/// [freezed] class representing the various states Required Fields Cubit.
///
/// The states include:
/// - [RequiredFieldsCompletedState] : The State indicates that all the required fields are not empty.
/// - [RequiredFieldsMissingState] : The State indicates that some required fields are empty.
@freezed
class RequiredFieldsState with _$RequiredFieldsState {
  const factory RequiredFieldsState.completed() = RequiredFieldsCompletedState;

  const factory RequiredFieldsState.missing() = RequiredFieldsMissingState;
}
