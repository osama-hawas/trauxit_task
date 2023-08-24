import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';

part 'events.dart';

part 'states.dart';

class AddToCartBloc extends Bloc<AddToCartEvents, AddToCartStates> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();


  AddToCartBloc() : super(AddToCartStates()) {
    on<AddToCartEvent>(_addToCart);
  }

  void _addToCart(AddToCartEvent event, Emitter<AddToCartStates> emit) async {
    emit(AddToCartLoadingState());
    if (titleController.text.isNotEmpty && priceController.text.isNotEmpty) {
      emit(AddToCartSuccessState());
    } else {
      emit(AddToCartFailedState());
    }
  }
}
