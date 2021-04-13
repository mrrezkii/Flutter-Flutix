part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class OnInitialPage extends PageState {}

class OnLoginPage extends PageState {}

class OnSplashPage extends PageState {}

class OnMainPage extends PageState {}

class onRegistrationPage extends PageState {
  final RegistrationData registrationData;

  onRegistrationPage(this.registrationData);
}

class onPreferencePage extends PageState {
  final RegistrationData registrationData;

  onPreferencePage(this.registrationData);
}

class onAccoutConfirmationPage extends PageState {
  final RegistrationData registrationData;

  onAccoutConfirmationPage(this.registrationData);
}
