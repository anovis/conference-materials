import 'package:equatable/equatable.dart';
import 'package:statemanagement/example2/common/cart.dart';
import 'package:statemanagement/example2/common/catalog.dart';

class AppState extends Equatable {
  final Catalog catalog;
  final Cart cart;

  AppState(this.catalog, this.cart);


  factory AppState.empty() => AppState(Catalog(),Cart());


  @override
  List<Object> get props => cart.items;
}
