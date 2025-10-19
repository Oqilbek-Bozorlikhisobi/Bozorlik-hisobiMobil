part of 'end_market_bloc.dart';

class EndMarketEvent {}

class EndMarketButton extends EndMarketEvent {
final   String marketId;
final String location;
final String name;
final  String marketTypeId;

  EndMarketButton({required this.marketId, required this.location, required this.name, required this.marketTypeId});
}

