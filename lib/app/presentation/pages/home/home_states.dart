import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';

abstract class HomeState {
  HomeState({this.price = Price.none});

  final Price price;
}

class Loading extends HomeState {}

class Fetched extends HomeState {}

class Saving extends HomeState {
  Saving(Price price) : super(price: price);
}

class Saved extends HomeState {
  Saved(Price price) : super(price: price);
}

class Changed extends HomeState {
  Changed({required Price price}) : super(price: price);

  Color? missingColor;
}

class Selected extends HomeState {
  Selected(Price price) : super(price: price);
}

class Calculated extends HomeState {
  Calculated({
    required Price price,
    required this.situation,
    required this.debt,
  }) : super(price: price);

  final Situation situation;
  final double debt;
}
