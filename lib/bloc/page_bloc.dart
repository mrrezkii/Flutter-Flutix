import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_flutix/model/models.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToRegistrationPage) {
      yield onRegistrationPage(event.registrationData);
    } else if (event is GoToPreferencePage) {
      yield onRegistrationPage(event.registrationData);
    } else if (event is GoToAccountConfirmationPage) {
      yield onRegistrationPage(event.registrationData);
    }
  }
}
