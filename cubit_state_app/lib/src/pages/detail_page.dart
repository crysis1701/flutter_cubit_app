import 'package:cubit_state_app/src/colors/app_colors.dart';
import 'package:cubit_state_app/src/cubit_state/app_cubit.dart';
import 'package:cubit_state_app/src/cubit_state/app_cubit_state.dart';
import 'package:cubit_state_app/src/widget/app_button.dart';
import 'package:cubit_state_app/src/widget/app_large_text.dart';
import 'package:cubit_state_app/src/widget/app_text.dart';
import 'package:cubit_state_app/src/widget/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenStart = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Hero(
            
              tag: 'my-mountain', 
              child: Container(
            padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/mountain.jpeg'),
                        fit: BoxFit.cover
                      )
                    ),
                  )
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          BlocProvider.of<AppCubit>(context).goHome();
                        }, 
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      )
                    ],
                  )
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black54.withOpacity(0.8),
                              size: 20,
                            ),
                            AppLargeText(
                              text: '\$' + detail.place.price.toString(),
                              color: AppColors.mainColor,
                              size: 20,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.mainColor
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              text: detail.place.location,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index){
                                return Icon(
                                  Icons.star,
                                  color: index < detail.place.stars ? AppColors.starColor : AppColors.textColor2,
                                );
                              }),
                            ),
                            const SizedBox(width: 10),
                            const AppText(
                              text: '(4.0)',
                              color:  AppColors.textColor2
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        AppLargeText(
                          text: 'People',
                          color: Colors.black.withOpacity(0.8),
                          size: 20
                        ),
                        const SizedBox(height: 5),
                        const AppText(
                          text: 'Number of people in your group',
                          color: AppColors.mainTextColor,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (index){
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButton(
                                  color: selectedIndex == index ? Colors.white : Colors.black,
                                  size: 50,
                                  backgroundColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                  borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          size: 20
                        ),
                        const SizedBox(height: 5),
                        AppText(
                          text: detail.place.description,
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                  )
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: const [
                      AppButton(
                        color: AppColors.textColor2, 
                        backgroundColor: Colors.white, 
                        size: 60, 
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(width: 20),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  )
                )
              ],
            ),
          ),
            ),
            
        );
      }
    );
  }
}