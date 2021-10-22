import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable {
  final String errorMessage;
  final int? statusCode;
  final dynamic data;

  ErrorResponse({required this.errorMessage, this.statusCode, this.data});

  @override
  List<Object?> get props => [errorMessage, statusCode];
}
