import 'logic.dart';

class CubitObserver extends BlocObserver {
  void transition(Bloc bloc, Transition transition) {
    print('transition: $transition');
    super.onTransition(bloc, transition);
  }

  void onChange(BlocBase cubit, Change change) {
    print('change: $change');
    super.onChange(cubit, change);
  }

  void onError(BlocBase cubit, Object error, StackTrace stackTrace) {
    print('error : $error');
    print('stack trace  : $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}
