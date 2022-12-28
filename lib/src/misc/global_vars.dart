import 'package:asd/src/presentation/home/screens/home_tab.dart';
import 'package:flutter/material.dart';

final List<String> imagesUrl = [
  "https://images.unsplash.com/photo-1669962367460-00b711b2e3f3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1669846840815-eac9fa239eb0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1669901129523-3d26ae0e2a35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1670258880147-3e871d5d87f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
];
final List<String> entitysUrl = [
  "https://img.icons8.com/ios-filled/512/street-food.png",
  "https://png.pngtree.com/png-clipart/20221017/original/pngtree-scissors-vector-with-head-shape-png-image_8700153.png",
  "http://clipart-library.com/newimages/question-mark-clipart-2-4.jpg",
];
final List<String> hotelsName = [
  "Ifthar",
  "Salt",
  "Arafa",
  "Topform",
];
const List<Widget> homeScreenItems = [
  HomeTab(),
  Center(
    child: Text(
      "page2",
      style: TextStyle(color: Colors.white),
    ),
  ),
  Center(
    child: Text(
      "page3",
      style: TextStyle(color: Colors.white),
    ),
  ),
  Center(
    child: Text(
      "page4",
      style: TextStyle(color: Colors.white),
    ),
  ),
  Center(
    child: Text(
      "page5",
      style: TextStyle(color: Colors.white),
    ),
  ),
];

final List<String> randomQuotes = [
  "Ready for Breakfast?",
  "Ready for brunch?",
  "Ready for Chai?",
  "Dont be late to order your dinner",
];
