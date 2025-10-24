part of 'home_bloc.dart';

 class HomeEvent {}
class CreateMarketEvent extends HomeEvent{
  final String name;

  CreateMarketEvent({required this.name});
}
class EditMarketEvent extends HomeEvent{
  final String name;
  final String id;

  EditMarketEvent({required this.name,required this.id});
}
class GetMarketabilityEvent extends HomeEvent{}
class GetDepartmentEvent extends HomeEvent{}
class GetBannerEvent extends HomeEvent{}
class GetUnitEvent extends HomeEvent{}