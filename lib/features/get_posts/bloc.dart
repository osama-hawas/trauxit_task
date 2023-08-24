import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

part 'model.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  final DioHelper dioHelper;
  var data;

  PostBloc(this.dioHelper) : super(PostStates()) {
    on<PostEvent>(_get);
  }

  void _get(PostEvent event, Emitter<PostStates> emit) async {
    emit(PostLoadingState());
    final response = await dioHelper.get("https://jsonplaceholder.typicode.com/posts");
    if (response.isSuccess) {
      final postDate = PostModel.fromJson(response.response!.data).postData;
      data = postDate;
      emit(PostSuccessState(list: postDate));
    } else {
      emit(PostFailedState());
    }
  }
}
