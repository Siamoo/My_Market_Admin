part of 'add_admin_cubit.dart';

sealed class AddAdminState extends Equatable {
  const AddAdminState();

  @override
  List<Object> get props => [];
}

final class AddAdminInitial extends AddAdminState {}
final class CreateAdminLoading extends AddAdminState {}
final class CreateAdminSuccess extends AddAdminState {}
final class CreateAdminError extends AddAdminState {
  final String message;
  const CreateAdminError(this.message);
} 