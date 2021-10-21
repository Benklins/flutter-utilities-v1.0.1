import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logic_utility/viewmodel_utility/list_base_viewmodel.dart';

part 'base_list_state.dart';

abstract class BaseListCubit<T> extends Cubit<BaseListState> {
  final ListBaseViewModel<T> viewModel;

  BaseListCubit(this.viewModel) : super(BaseListInitial());

  void emitListLoaded(List<T> list) {
    emit(BaseListLoaded(list));
  }

  void emitListLoading() {
    emit(BaseListLoading());
  }

  void emitBottomListLoading() {
    emit(BaseBottomListLoading());
  }

  void emitListError(String error) {
    emit(BaseListError(error));
  }
}
