import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity connectivity;
  late StreamSubscription connSubscription;

  ConnectivityCubit({required this.connectivity}) : super(ConnectionLoading()) {
    connSubscription = connectivity.onConnectivityChanged.listen((conn) {
      connectionResult(conn);
    });
  }

  void connectionResult(List<ConnectivityResult> result) {
    emit(ConnectionLoading());
    emit(ConnectionResult(connectivityResult: result));
    print(result);
  }

  @override
  Future<void> close() {
    connSubscription.cancel();
    return super.close();
  }
}
