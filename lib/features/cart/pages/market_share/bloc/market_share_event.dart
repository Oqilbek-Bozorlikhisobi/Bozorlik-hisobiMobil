part of 'market_share_bloc.dart';

class MarketShareEvent {}
class GetMarketShareEvent extends MarketShareEvent{
  final String id;

  GetMarketShareEvent({required this.id});

}
class DeleteUserEvent extends MarketShareEvent{
  final String userId;
  final String marketId;

  DeleteUserEvent({required this.userId, required this.marketId});


}