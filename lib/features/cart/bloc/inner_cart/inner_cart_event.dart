part of 'inner_cart_bloc.dart';

 class InnerCartEvent {}
class GetInnerByIdEvent extends InnerCartEvent{
  final String id;

  GetInnerByIdEvent({required this.id});
}