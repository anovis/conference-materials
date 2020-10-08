import 'package:equatable/equatable.dart';
import 'package:statemanagement/example2/common/item.dart';

class CartItemAdded extends Equatable {
  final Item item;

  CartItemAdded(this.item);

  @override
  List<Object> get props => [item];
}
