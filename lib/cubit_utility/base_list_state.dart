part of 'base_list_cubit.dart';

abstract class BaseListState extends Equatable {
  const BaseListState();

  @override
  List<Object> get props => [];
}

class BaseListInitial extends BaseListState {}

class BaseListLoading extends BaseListState {}

class BaseListLoaded<T extends List, K> extends BaseListState {
  final T list;
  final K? type;
  BaseListLoaded(this.list, {this.type});

  @override
  List<Object> get props => [list];
}

class BaseListError extends BaseListState {
  final String error;

  BaseListError(this.error);

  @override
  List<Object> get props => [error];
}

class BaseListEmptyState extends BaseListState{}