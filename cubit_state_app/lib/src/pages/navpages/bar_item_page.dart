import 'package:flutter/cupertino.dart';

class BarItemPage extends StatelessWidget {
  const BarItemPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
      child: const Center(
        child:  Text("Bar Item Page"),
      )
    );
  }
}