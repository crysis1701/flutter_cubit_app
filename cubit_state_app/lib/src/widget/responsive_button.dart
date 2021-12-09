import 'package:cubit_state_app/src/colors/app_colors.dart';
import 'package:cubit_state_app/src/widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {

  final bool? isResponsive;
  final double? width;

  const ResponsiveButton({ 
    Key? key,
    this.width = 120,
    this.isResponsive = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            isResponsive == true ? Container(margin: const EdgeInsets.only(left: 30), child: const AppText(
              text: 'Book Trip Now',
              color: Colors.white,
            )) : Container(),
            Image.asset("assets/images/button-one.png")
          ]
        ),
      )
    );
  }
}