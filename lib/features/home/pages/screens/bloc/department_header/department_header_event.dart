part of 'department_header_bloc.dart';

class DepartmentHeaderEvent {}
class GetDepartmentHeaderEvent extends DepartmentHeaderEvent{
  final String? marketTypeId;

  GetDepartmentHeaderEvent({ this.marketTypeId});
}
