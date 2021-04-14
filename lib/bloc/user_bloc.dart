import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_flutix/model/models.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      UserModel userModel = await UserServices.getUser(event.id);
      yield UserLoaded(userModel);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      UserModel updatedUser = (state as UserLoaded)
          .userModel
          .copyWith(name: event.name, profilePicture: event.profileImage);
      yield UserLoaded(updatedUser);
    }
  }
}
