import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_create_project/src/bloc/category.dart';
import 'package:feature_create_project/src/bloc/fields/fields.dart';
import 'package:feature_create_project/src/repository/create_project_repository.dart';
import 'package:feature_create_project/src/repository/create_project_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'create_project_event.dart';
part 'create_project_state.dart';

class CreateProjectBloc extends Bloc<CreateProjectEvent, CreateProjectState> {
  final CreateProjectRepository _createProjectRepository;

  CreateProjectBloc({
    required CreateProjectRepository createProjectRepository,
  }) : _createProjectRepository = createProjectRepository,
       super(const CreateProjectState.initial()) {
    on<CreateProjectNameFieldChanged>(_onNameChanged);
    on<CreateProjectDescriptionFieldChanged>(_onDescriptionChanged);
    on<CreateProjectContactsFieldChanged>(_onContactsChanged);
    on<CreateProjectExistingCategoryAdded>(_onExistingCategoryAdded);
    on<CreateProjectExistingCategoryRemoved>(_onExistingCategoryRemoved);
    on<CreateProjectCustomCategoryAdded>(_onCustomCategoryAdded);
    on<CreateProjectCustomCategoryRemoved>(_onCustomCategoryRemoved);
    on<CreateProjectSubmitted>(_onSubmitted, transformer: bloc_concurrency.droppable());
  }

  void _onNameChanged(
    CreateProjectNameFieldChanged event,
    Emitter<CreateProjectState> emit,
  ) => emit(state.copyWith(name: NameField.pure(event.name)));

  void _onDescriptionChanged(
    CreateProjectDescriptionFieldChanged event,
    Emitter<CreateProjectState> emit,
  ) => emit(state.copyWith(description: DescriptionField.pure(event.description)));

  void _onContactsChanged(
    CreateProjectContactsFieldChanged event,
    Emitter<CreateProjectState> emit,
  ) => emit(state.copyWith(contacts: ContactsField.pure(event.contacts)));

  void _onExistingCategoryAdded(
    CreateProjectExistingCategoryAdded event,
    Emitter<CreateProjectState> emit,
  ) {
    final categories = [...state.categories]
      ..removeWhere((e) => e is ExistingCategory && e.value == event.id)
      ..add(ExistingCategory(event.id, event.text));
    emit(state.copyWith(categories: categories));
  }

  void _onExistingCategoryRemoved(
    CreateProjectExistingCategoryRemoved event,
    Emitter<CreateProjectState> emit,
  ) {
    final categories = [...state.categories]
      ..removeWhere((e) => e is ExistingCategory && e.value == event.id);
    emit(state.copyWith(categories: categories));
  }

  void _onCustomCategoryAdded(
    CreateProjectCustomCategoryAdded event,
    Emitter<CreateProjectState> emit,
  ) {
    final categories = [...state.categories]
      ..removeWhere((e) => e is CustomCategory && e.value == event.category)
      ..add(CustomCategory(event.category));
    emit(state.copyWith(categories: categories));
  }

  void _onCustomCategoryRemoved(
    CreateProjectCustomCategoryRemoved event,
    Emitter<CreateProjectState> emit,
  ) {
    final categories = [...state.categories]
      ..removeWhere((e) => e is CustomCategory && e.value == event.category);
    emit(state.copyWith(categories: categories));
  }

  Future<void> _onSubmitted(
    CreateProjectSubmitted event,
    Emitter<CreateProjectState> emit,
  ) async {
    emit(state.copyWith(
      name: NameField.dirty(state.name.value),
      description: DescriptionField.dirty(state.name.value),
      contacts: ContactsField.dirty(state.name.value),
    ));
    final isValid = Formz.validate([state.name, state.description, state.contacts]);
    if (!isValid) {
      return;
    }

    emit(state.copyWith(status: CreateProjectStatus.inProgress));
    try {
      final result = await _createProjectRepository.create(
        name: state.name.value,
        description: state.description.value,
        contacts: state.contacts.value,
        categories: state.categories.whereType<ExistingCategory>().map((e) => e.value).toList(),
        customCategories: state.categories.whereType<CustomCategory>().map((e) => e.value).toList(),
      );
      switch (result) {
        case CreateProjectResult.success:
          emit(state.copyWith(status: CreateProjectStatus.success));
          break;
        case CreateProjectResult.error:
          emit(state.copyWith(status: CreateProjectStatus.undefinedError));
          break;
        case CreateProjectResult.notAuthorized:
          emit(state.copyWith(status: CreateProjectStatus.notAuthorized));
          break;
      }
    } on Object catch (e) {
      emit(state.copyWith(
        status: e is DioError ? CreateProjectStatus.connectionError : CreateProjectStatus.undefinedError,
      ));
      rethrow;
    }
  }
}
