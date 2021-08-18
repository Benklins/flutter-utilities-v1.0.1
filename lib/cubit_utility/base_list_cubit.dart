
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_list_state.dart';

abstract class BaseListCubit<T> extends Cubit<BaseListState> {

  BaseListCubit() : super(BaseListInitial());

  void emitListLoaded(List<T> list) {
    emit(BaseListLoaded(list));
  }

  void emitListLoading() {
    emit(BaseListLoading());
  }

  void emitListError(String error) {
    emit(BaseListError(error));
  }
}
