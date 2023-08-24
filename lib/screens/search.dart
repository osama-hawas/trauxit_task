import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:trauxit_task/core/desgin/main_button.dart';
import 'package:trauxit_task/core/desgin/main_text_field.dart';
import 'package:trauxit_task/core/desgin/shimmer.dart';

import '../features/get_weather/bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final bloc = KiwiContainer().resolve<WeatherBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            MainTextField(
              text: "Enter city name",
              controller: bloc.searchController,
            ),
            MainButton(
                text: "search",
                onPressed: () {
                  bloc.add(WeatherEvent());
                }),
            SizedBox(
              height: 48.h,
            ),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is WeatherSuccessState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "name : ${state.data.weatherData.name} ",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "country : ${state.data.weatherData.country}",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "temp : ${state.data.current.tempC.toInt()} ",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                } else if (state is WeatherLoadingState) {
                  return const ShimmerListView();
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
