import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:trauxit_task/core/logic/helper_methods.dart';
import 'package:trauxit_task/features/get_posts/bloc.dart';
import 'package:trauxit_task/screens/search.dart';

import '../../../core/desgin/main_text_field.dart';
import '../../../core/desgin/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = KiwiContainer().resolve<PostBloc>()..add(PostEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is PostSuccessState) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: MainTextField(
                    text: 'City name',
                    prefixIcon: Icons.search,
                    onPress: () {
                      navigateTo(context, route: const SearchScreen());
                    },
                  ),
                ),
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: List.generate(
                        state.list.length,
                        (index) => _Item(
                              postData: state.list[index],
                            )),
                  ),
                )
              ],
            );
          } else {
            return const ShimmerListView();
          }
        },
      ),
    ));
  }
}

class _Item extends StatelessWidget {
  final PostData postData;

  const _Item({
    Key? key,
    required this.postData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      margin: EdgeInsetsDirectional.only(
          start: 16.w, end: 16.w, bottom: 16.h, top: 32.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postData.title,
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  postData.body,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
