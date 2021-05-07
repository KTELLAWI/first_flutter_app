import 'package:firstapp/blocs/auth_events.dart';
import 'package:firstapp/blocs/auth_state.dart';
import 'package:firstapp/repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  Authrepository repo;
  // this.repo
  //
  int d = 1;
  int c = 1;
  AuthBloc(AuthState initialState, this.repo) : super(InitState());

  @override
  Stream<AuthState> mapEventToState(AuthEvents event) async* {
    // TODO: implement mapEventToState
    //
    var pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield LoginInitialState();
    } else if (event is CountingEvent) {
      yield CountingState(c: c++);
    } else if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      var data = await repo.login(event.email, event.password);
      if (data["type"] == 0) {
        pref.setString("token", data['token']);
        pref.setString("Email", data['email']);
        pref.setInt("Type", data['type']);

        yield UserLoginSuccessState();
      } else if (data["type"] == 1) {
        pref.setString("token", data['token']);
        pref.setString("Email", data['email']);
        pref.setInt("Type", data['type']);
        yield AdminLoginSuccessState();
      } else {
         yield LoginErrorState(message:"auth Error");

      }
      
    }
  }
}
