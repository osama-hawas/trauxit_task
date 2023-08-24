import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trauxit_task/core/logic/helper_methods.dart';
import 'package:trauxit_task/screens/cart/cart.dart';
import 'package:trauxit_task/screens/home/widgets/home.dart';
import 'package:trauxit_task/screens/home/widgets/profile.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({Key? key}) : super(key: key);

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  int? type = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 30.h,
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: 16.w),
                child: GestureDetector(
                  onTap: () {
                    navigateTo(context, route: const CartScreen());
                  },
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
            title: Text(
              "Trauxit",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            bottom: TabBar(
                onTap: (value) {
                  type = value;
                },
                tabs: [
                  Text(
                    "Home",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Profile",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  )
                ],
                labelColor: Colors.white,
                labelPadding: EdgeInsets.symmetric(vertical: 11.h),
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                unselectedLabelColor: Theme.of(context).hintColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r), // Creates border
                  color: Theme.of(context).primaryColor,
                ))),
        body: const TabBarView(
          children: [
            HomeScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
