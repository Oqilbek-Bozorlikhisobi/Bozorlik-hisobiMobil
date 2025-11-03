part of 'department_header_bloc.dart';

class DepartmentHeaderState {
  final String? errorMessage;
  final Status? status;
  final StatisticResponseData? data;

  DepartmentHeaderState({this.errorMessage, this.status, this.data});

  DepartmentHeaderState copyWith({
    final String? errorMessage,
    final Status? status,
    final StatisticResponseData? data,
  }) => DepartmentHeaderState(
    errorMessage: errorMessage ?? this.errorMessage,
    status: status ?? this.status,
    data: data ?? this.data,
  );
}
