part of 'home_bloc.dart';

 class HomeEvent {}
class CreateMarketEvent extends HomeEvent{
  final String name;
  final String marketId;

  CreateMarketEvent({required this.name,required this.marketId});
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
class GetVersionEvent extends HomeEvent{}
class GetStatisticEvent extends HomeEvent{
   final String marketTypeId;

  GetStatisticEvent({required this.marketTypeId});
}