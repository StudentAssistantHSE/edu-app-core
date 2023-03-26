import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_models/edu_models.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_profile_editing/src/bloc/category.dart';
import 'package:feature_profile_editing/src/bloc/fields/fields.dart';
import 'package:feature_profile_editing/src/repository/profile_editing_repository.dart';
import 'package:feature_profile_editing/src/repository/profile_editing_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'profile_editing_event.dart';
part 'profile_editing_state.dart';

class ProfileEditingBloc extends Bloc<ProfileEditingEvent, ProfileEditingState> {
  final ProfileEditingRepository _profileEditingRepository;

  ProfileEditingBloc({
    required UserModel initialData,
    required ProfileEditingRepository profileEditingRepository,
  }) : _profileEditingRepository = profileEditingRepository,
       super(ProfileEditingState.initial(initialData)) {
    on<ProfileEditingEmailFieldChanged>(_onEmailChanged);
    on<ProfileEditingFullNameFieldChanged>(_onFullNameChanged);
    on<ProfileEditingFacultyChanged>(_onFacultyChanged);
    on<ProfileEditingBioFieldChanged>(_onBioChanged);
    on<ProfileEditingExistingCategoryAdded>(_onExistingCategoryAdded);
    on<ProfileEditingExistingCategoryRemoved>(_onExistingCategoryRemoved);
    on<ProfileEditingCustomCategoryAdded>(_onCustomCategoryAdded);
    on<ProfileEditingCustomCategoryRemoved>(_onCustomCategoryRemoved);
    on<ProfileEditingSubmitted>(_onSubmitted, transformer: bloc_concurrency.droppable());
  }

  void _onEmailChanged(
    ProfileEditingEmailFieldChanged event,
    Emitter<ProfileEditingState> emit,
  ) => emit(state.copyWith(email: EmailField.pure(event.email)));

  void _onFullNameChanged(
    ProfileEditingFullNameFieldChanged event,
    Emitter<ProfileEditingState> emit,
  ) => emit(state.copyWith(fullName: FullNameField.pure(event.fullName)));

  void _onFacultyChanged(
    ProfileEditingFacultyChanged event,
    Emitter<ProfileEditingState> emit,
  ) => emit(state.copyWith(faculty: event.faculty));

  void _onBioChanged(
    ProfileEditingBioFieldChanged event,
    Emitter<ProfileEditingState> emit,
  ) => emit(state.copyWith(bio: BioField.pure(event.bio)));

  void _onExistingCategoryAdded(
    ProfileEditingExistingCategoryAdded event,
    Emitter<ProfileEditingState> emit,
  ) {
    final categories = [...state.categories]
      ..removeWhere((e) => e is ExistingCategory && e.value == event.id)
      ..add(ExistingCategory(event.id, event.text));
    emit(state.copyWith(categories: categories));
  }

  void _onExistingCategoryRemoved(
    ProfileEditingExistingCategoryRemoved event,
    Emitter<ProfileEditingState> emit,
  ) {
    final categories = [...state.categories]
      ..removeWhere((e) => e is ExistingCategory && e.value == event.id);
    emit(state.copyWith(categories: categories));
  }

  void _onCustomCategoryAdded(
    ProfileEditingCustomCategoryAdded event,
    Emitter<ProfileEditingState> emit,
  ) {
    final categories = [...state.categories]
      ..removeWhere((e) => e is CustomCategory && e.value == event.category)
      ..add(CustomCategory(event.category));
    emit(state.copyWith(categories: categories));
  }

  void _onCustomCategoryRemoved(
    ProfileEditingCustomCategoryRemoved event,
    Emitter<ProfileEditingState> emit,
  ) {
    final categories = [...state.categories]
      ..removeWhere((e) => e is CustomCategory && e.value == event.category);
    emit(state.copyWith(categories: categories));
  }

  Future<void> _onSubmitted(
    ProfileEditingSubmitted event,
    Emitter<ProfileEditingState> emit,
  ) async {
    emit(state.copyWith(
      email: EmailField.dirty(state.email.value),
      fullName: FullNameField.dirty(state.fullName.value),
      bio: BioField.dirty(state.bio.value),
    ));
    final isValid = Formz.validate([state.email, state.fullName, state.bio]);
    if (!isValid) {
      return;
    }

    emit(state.copyWith(status: ProfileEditingStatus.inProgress));
    try {
      final result = await _profileEditingRepository.patch(
        email: state.email.value,
        fullName: state.fullName.value,
        facultyId: state.faculty?.id,
        bio: state.bio.value,
        categories: state.categories.whereType<ExistingCategory>().map((e) => e.value).toList(),
        customCategories: state.categories.whereType<CustomCategory>().map((e) => e.value).toList(),
      );
      switch (result) {
        case ProfileEditingResult.success:
          emit(state.copyWith(status: ProfileEditingStatus.success));
          break;
        case ProfileEditingResult.error:
          emit(state.copyWith(status: ProfileEditingStatus.undefinedError));
          break;
        case ProfileEditingResult.notAuthorized:
          emit(state.copyWith(status: ProfileEditingStatus.notAuthorized));
          break;
      }
    } on Object catch (e) {
      emit(state.copyWith(
        status: e is DioError ? ProfileEditingStatus.connectionError : ProfileEditingStatus.undefinedError,
      ));
      rethrow;
    }
  }
}
