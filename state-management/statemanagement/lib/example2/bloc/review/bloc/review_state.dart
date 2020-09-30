part of 'review_bloc.dart';

@immutable
abstract class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

class ReviewLoading extends ReviewState {}

class ReviewLoaded extends ReviewState {
  const ReviewLoaded(this.reviews);

  final List<Review> reviews;

  @override
  List<Object> get props => reviews;
}

class ReviewError extends ReviewState {}
