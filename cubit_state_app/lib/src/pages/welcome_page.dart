import 'package:cubit_state_app/src/colors/app_colors.dart';
import 'package:cubit_state_app/src/cubit_state/app_cubit.dart';
import 'package:cubit_state_app/src/widget/app_large_text.dart';
import 'package:cubit_state_app/src/widget/app_text.dart';
import 'package:cubit_state_app/src/widget/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, i){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/" + images[i]),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const  EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      const AppText(
                        text: "Mountain",
                        size: 30
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        width: 250,
                        child: AppText(
                          text: "Mountain hikes give you an incredible sense of freedom along with endurance test",
                          color: AppColors.textColor2,
                          size: 14
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).getData();
                        },
                        child: SizedBox(
                          width: 200,
                          child: Row(
                            children: const [
                              ResponsiveButton(width: 120)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (iDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: i == iDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: i == iDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
    ));
  }
}