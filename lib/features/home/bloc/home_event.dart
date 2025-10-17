part of 'home_bloc.dart';

 class HomeEvent {}
class CreateMarketEvent extends HomeEvent{
  final String name;

  CreateMarketEvent({required this.name});
}
class GetMarketabilityEvent extends HomeEvent{}
class GetDepartmentEvent extends HomeEvent{}
class GetBannerEvent extends HomeEvent{}