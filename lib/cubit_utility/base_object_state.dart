part of 'base_object_cubit.dart';

abstract class BaseObjectState extends Equatable {
  const BaseObjectState();

  @override
  List<Object?> get props => [];
}

class BaseObjectInitial extends BaseObjectState {}

class BaseObjectLoading extends BaseObjectState {}

class BaseObjectLoaded extends BaseObjectState {
  final dynamic data;

  BaseObjectLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class BaseObjectError extends BaseObjectState {
  final String error;

  BaseObjectError(this.error);

  @override
  List<Object?> get props => [error];
}
