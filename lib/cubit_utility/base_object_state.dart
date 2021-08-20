part of 'base_object_cubit.dart';

abstract class BaseObjectState extends Equatable {
  const BaseObjectState();

  @override
  List<Object?> get props => [];
}

class BaseObjectInitial extends BaseObjectState {}

class BaseObjectLoading extends BaseObjectState {}

class BaseObjectLoaded<T, K> extends BaseObjectState {
  final T data;
  final K? successType;

  BaseObjectLoaded(this.data, {this.successType});

  @override
  List<Object?> get props => [data];
}

class BaseObjectError extends BaseObjectState {
  final String error;

  BaseObjectError(this.error);

  @override
  List<Object?> get props => [error];
}
