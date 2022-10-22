import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/add_post_screen.dart';

const webScreenLayout = 600;

const homeScreenItems = [
  Center(
    child: Text("Home"),
  ),
  Center(
    child: Text("Search"),
  ),
  AddPostScreen(),
  Center(
    child: Text("Notification"),
  ),
  Center(
    child: Text("Profile"),
  ),
];
