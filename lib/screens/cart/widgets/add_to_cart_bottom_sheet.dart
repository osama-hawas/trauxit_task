import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:trauxit_task/core/desgin/main_button.dart';
import 'package:trauxit_task/core/desgin/main_text_field.dart';
import 'package:trauxit_task/core/logic/helper_methods.dart';
import 'package:trauxit_task/features/get_cart_item/model.dart';

import '../../../features/add_to_cart/bloc.dart';

Future<dynamic> showModelBottomSheet(BuildContext context) async {
  final bloc = KiwiContainer().resolve<AddToCartBloc>();
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(38.r), topLeft: Radius.circular(38.r))),
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(38.r),
            topLeft: Radius.circular(38.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 14.h,
            ),
            Text(
              "Add To Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
            ),
            MainTextField(
              text: "title",
              controller: bloc.titleController,
            ),
            MainTextField(
              text: "price",
              controller: bloc.priceController,
            ),
            BlocConsumer(
              bloc: bloc,
              listener: (context, state) {
                if (state is AddToCartSuccessState) {
                  showMSG(message: "Item Add Successfully");
                  Navigator.pop(
                      context,
                      CartModel.fromJson(
                          title: bloc.titleController.text,
                          price: int.parse(bloc.priceController.text),
                          assetLink: "assets/icons/png/test.jpg"));
                }
              },
              builder: (context, state) {
                return MainButton(
                    text: "Add",
                    onPressed: () {
                      bloc.add(AddToCartEvent());
                    });
              },
            ),
            SizedBox(
              height: 16.h,
            )
          ],
        ),
      ),
    ),
  );
}
