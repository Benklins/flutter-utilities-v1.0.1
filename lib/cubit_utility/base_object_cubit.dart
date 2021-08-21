import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'base_object_state.dart';

abstract class BaseObjectCubit<T> extends Cubit<BaseObjectState> {
  BaseObjectCubit() : super(BaseObjectInitial());

  void emitLoaded(T object) {
    emit(BaseObjectLoaded(object));
  }

  void emitLoading() {
    emit(BaseObjectLoading());
  }

  void emitError(String error) {
    emit(BaseObjectError(error));
  }
}
