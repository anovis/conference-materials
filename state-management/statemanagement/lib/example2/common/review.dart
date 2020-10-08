import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

@immutable
class Review extends Equatable {
  Review(this.id, this.itemId)
      : review = lipsum.createParagraph();

  final int id;
  final int itemId;
  final String review;

  @override
  List<Object> get props => [id, itemId, review];
}
