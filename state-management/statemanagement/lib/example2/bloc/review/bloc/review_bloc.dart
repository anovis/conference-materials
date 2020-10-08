import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:statemanagement/example2/common/review.dart';
import 'package:statemanagement/example2/redux/app_state.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewLoading());

  @override
  Stream<ReviewState> mapEventToState(
    ReviewEvent event,
  ) async* {
    if (event is ReviewStarted) {
      yield* _mapReviewStartedToState();
    }
  }

  Stream<ReviewState> _mapReviewStartedToState() async* {
    yield ReviewLoading();
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      yield ReviewLoaded(generateReviews());
    } catch (_) {
      yield ReviewError();
    }
  }
}
