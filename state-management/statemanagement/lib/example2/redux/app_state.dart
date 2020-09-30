import 'package:equatable/equatable.dart';
import 'package:statemanagement/example2/common/cart.dart';
import 'package:statemanagement/example2/common/catalog.dart';
import 'package:statemanagement/example2/common/review.dart';

class AppState extends Equatable {
  final Catalog catalog;
  final Cart cart;
  final List<Review> reviews;

  AppState(this.catalog, this.cart, this.reviews);


  factory AppState.empty() => AppState(Catalog(),Cart(),generateReviews());


  @override
  List<Object> get props => cart.items;
}

List<Review> generateReviews(){
    final reviews = <Review>[];
    for (var i = 0; i < 20; i++) {
      reviews.add(Review(i,i));
    }
    return reviews;
  }

