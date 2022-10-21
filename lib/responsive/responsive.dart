import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  Widget webScreenLayout;
  Widget mobileScreenLayout;
   ResponsiveLayout({Key? key, required this.webScreenLayout, required this.mobileScreenLayout }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth > 600) {
        return webScreenLayout;
      }else{
        return mobileScreenLayout;
      }
    });
  }
}
