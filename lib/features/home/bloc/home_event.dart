part of 'home_bloc.dart';

 class HomeEvent {}
class CreateMarketEvent extends HomeEvent{
  final String name;

  CreateMarketEvent({required this.name});
}