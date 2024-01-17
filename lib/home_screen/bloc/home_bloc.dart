import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example_bloc/home_screen/api/product_repository.dart';
import 'package:meta/meta.dart';

import '../api/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeLoadingDataEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final result = await ProductRepository().getData();
        print('Success');
          emit(HomeSuccessState(productList: result));
      } catch(e) {
        print('Error $e');
        emit(HomeErrorState());
      }
    });
  }
}
