part of 'market_share_bloc.dart';

class MarketShareState {
  final String? errorMessage;
  final Status? status;
  final Status? statusDelete;
final  List<GetByIdMarketResponseDataUsers>? users;
final  List<GetByIdMarketResponseDataUsers>? pendingUsers;

  MarketShareState({this.errorMessage, this.status,this.statusDelete, this.users, this.pendingUsers});


  MarketShareState copyWith({
    final String? errorMessage,
    final Status? status,
    final Status? statusDelete,
    final  List<GetByIdMarketResponseDataUsers>? users,
    final  List<GetByIdMarketResponseDataUsers>? pendingUsers,
})=>MarketShareState(
    errorMessage: errorMessage??this.errorMessage,
    status: status??this.status,
    users: users??this.users,
    pendingUsers: pendingUsers??this.pendingUsers,
    statusDelete: statusDelete??this.statusDelete,
  );
}

