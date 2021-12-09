import 'package:flutter/cupertino.dart';

class MyPage extends StatelessWidget {
  const MyPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
      child: const Center(
        child:  Text("My Page"),
      )
    );
  }
}