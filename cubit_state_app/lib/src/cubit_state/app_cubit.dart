import 'package:bloc/bloc.dart';
import 'package:cubit_state_app/src/cubit_state/app_cubit_state.dart';
import 'package:cubit_state_app/src/model/data_model.dart';
import 'package:cubit_state_app/src/services/data_services.dart';
import 'package:flutter/material.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late final places;
  

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}