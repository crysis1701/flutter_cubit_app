import 'package:cubit_state_app/src/cubit_state/app_cubit.dart';
import 'package:cubit_state_app/src/cubit_state/app_cubit_state.dart';
import 'package:cubit_state_app/src/pages/detail_page.dart';
import 'package:cubit_state_app/src/pages/navpages/main_page.dart';
import 'package:cubit_state_app/src/pages/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({ Key? key }) : super(key: key);

  @override
  _AppCubitLogicState createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state){
          if (state is DetailState) return const DetailPage();
          if (state is WelcomeState) return const WelcomePage();
          if (state is LoadedState) return const MainPage();
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        }
      ),
    );
  }
}