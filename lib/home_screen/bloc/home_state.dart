part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

// bu yerda ekran holatlari yoziladi
class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

// ignore: must_be_immutable
class HomeSuccessState extends HomeState {
  List<ProductModel> productList;
  HomeSuccessState({required this.productList});
}

class HomeErrorState extends HomeState {}