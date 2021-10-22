import 'package:equatable/equatable.dart';

class SuccessResponse<R> extends Equatable {
  final R value;

  SuccessResponse(this.value);

  @override
  List<Object?> get props => [value];
}
