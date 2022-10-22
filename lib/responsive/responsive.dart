import 'package:flutter/material.dart';
import 'package:instagram_flutter/providers/user_providers.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  Widget webScreenLayout;
  Widget mobileScreenLayout;
   ResponsiveLayout({Key? key, required this.webScreenLayout, required this.mobileScreenLayout }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();

  }

  void addData() async {
    // if we put listen: true it will always listens from UserProvider class...
    //... but we want it to listen only once therefore we se listen: false
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();

  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth > 600) {
        return widget.webScreenLayout;
      }else{
        return widget.mobileScreenLayout;
      }
    });
  }
}
