part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent extends Equatable {
  const ReviewEvent();
}

class ReviewStarted extends ReviewEvent {
  @override
  List<Object> get props => [];
}
