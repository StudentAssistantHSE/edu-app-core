part of 'profile_editing_bloc.dart';

enum ProfileEditingStatus {
  notSubmitted,
  inProgress,
  success,
  notAuthorized,
  connectionError,
  undefinedError,
}

extension ProfileEditingStatusX on ProfileEditingStatus {
  bool get isInProgress => this == ProfileEditingStatus.inProgress;
  bool get isSuccess => this == ProfileEditingStatus.success;
}

class ProfileEditingState extends Equatable {
  final ProfileEditingStatus status;
  final EmailField email;
  final FullNameField fullName;
  final FacultyModel? faculty;
  final BioField bio;
  final List<Category> categories;

  bool get isInProgress => status.isInProgress;
  bool get isSuccess => status.isSuccess;

  @override
  List<Object?> get props => [status, email, fullName, bio, categories, faculty];

  const ProfileEditingState._({
    required this.status,
    required this.email,
    required this.fullName,
    required this.faculty,
    required this.bio,
    required this.categories,
  });

  ProfileEditingState.initial(UserModel user) :
    status = ProfileEditingStatus.notSubmitted,
    email = EmailField.pure(user.email),
    fullName = FullNameField.pure(user.fullName),
    bio = BioField.pure(user.bio),
    faculty = user.faculty,
    categories = [
      for (final category in user.categories)
        if (category.isCustom)
          CustomCategory(category.category)
        else
          ExistingCategory(category.id, category.category),
    ];

  ProfileEditingState copyWith({
    ProfileEditingStatus? status,
    EmailField? email,
    FullNameField? fullName,
    BioField? bio,
    FacultyModel? faculty,
    List<Category>? categories,
  }) => ProfileEditingState._(
    status: status ?? this.status,
    email: email ?? this.email,
    fullName: fullName ?? this.fullName,
    bio: bio ?? this.bio,
    faculty: faculty ?? this.faculty,
    categories: categories ?? this.categories,
  );
}