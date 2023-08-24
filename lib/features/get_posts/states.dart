part of 'bloc.dart';

class PostStates {}

class PostLoadingState extends PostStates {}

class PostSuccessState extends PostStates {
final  List<PostData> list;

PostSuccessState({required this.list});
}

class PostFailedState extends PostStates {}
