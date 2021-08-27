import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utilities/viewmodel_utility/viewmodel_utility_export.dart';

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
