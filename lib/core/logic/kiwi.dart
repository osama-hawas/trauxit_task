import 'package:kiwi/kiwi.dart';
import 'package:trauxit_task/features/add_to_cart/bloc.dart';
import 'package:trauxit_task/features/get_posts/bloc.dart';

import '../../features/get_weather/bloc.dart';
import '../../features/login/bloc.dart';
import 'dio_helper.dart';

void initKiwi() {
  final container = KiwiContainer();
  container.registerSingleton((c) => DioHelper());
  container.registerFactory((c) => LoginBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => PostBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => WeatherBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => AddToCartBloc());
}
