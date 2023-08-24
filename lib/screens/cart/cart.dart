import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/get_cart_item/model.dart';
import 'widgets/add_to_cart_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartModel? cart;
  List<CartModel> list = [
    CartModel.fromJson(
        title: "Apple", price: 25, assetLink: "assets/icons/png/test.jpg"),
    CartModel.fromJson(
        title: "Apple", price: 20, assetLink: "assets/icons/png/test.jpg"),
    CartModel.fromJson(
        title: "Apple", price: 40, assetLink: "assets/icons/png/test.jpg"),
    CartModel.fromJson(
        title: "Apple", price: 15, assetLink: "assets/icons/png/test.jpg"),
    CartModel.fromJson(
        title: "Apple", price: 65, assetLink: "assets/icons/png/test.jpg"),
    CartModel.fromJson(
        title: "Apple", price: 30, assetLink: "assets/icons/png/test.jpg"),
  ];

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: GestureDetector(
              onTap: () async {
                 cart = await showModelBottomSheet(context);
                if (cart != null) {
                  list.add(cart!);
                  setState(() {});
                }

              },
              child: Icon(
                Icons.add_shopping_cart,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
        title: Text(
          "Cart",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        toolbarHeight: 30.h,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(top: 24.h, bottom: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(list.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.016),
                      offset: const Offset(0, 6),
                      blurStyle: BlurStyle.inner,
                      blurRadius: 17,
                    )
                  ]),
              child: Row(
                children: [
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    clipBehavior: Clip.antiAlias,
                    height: 78.h,
                    width: 92.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(list[index].assetLink),
                          fit: BoxFit.scaleDown),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text("${list[index].price} \$",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor)),
                      SizedBox(
                        height: 4.h,
                      ),
                      StatefulBuilder(
                        builder: (context, setState) => Container(
                          padding: EdgeInsets.all(2.r),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.1)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  ++amount;

                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.all(7.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.r),
                                      color: Colors.white),
                                  child: Image.asset(
                                    "assets/icons/png/add.png",
                                    height: 10.w,
                                    width: 10.w,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  "$amount",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (amount > 1) {
                                    --amount;
                                  }

                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.all(7.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.r),
                                      color: Colors.white),
                                  child: Image.asset(
                                    "assets/icons/png/minus.png",
                                    height: 10.w,
                                    width: 10.w,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      list.removeAt(index);
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        color: Theme.of(context).primaryColor.withOpacity(.16),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/svg/delete.svg",
                        height: 13.5.w,
                        width: 13.5.w,
                        color: Theme.of(context).primaryColor,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
