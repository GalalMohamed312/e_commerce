
import 'package:ecommerce/view/control_view.dart';
import 'package:flutter/material.dart';

abstract class Routes {
 static const String splashRoute="/";
 static const String onBoardingRoute="/onBoarding";
 static const String qiblahRoute="/qiblah";
 static const String azkarRoute="/azkar";
 static const String viewZikrRoute="/viewZikr";
 static const String sabahAndMasaaRoute="/sabahAndMasaa";
 static const String quranRoute="/quran";
 static const String hadithRoute="/hadith";
 static const String showHadithRoute="/showHadith";
 static const String homeRoute="/home";
 static const String prayerTimeRoute="/prayerTime";
}

class RouteGenerator{
 static Route<dynamic>getRoute(RouteSettings settings){
  switch(settings.name){
   case Routes.splashRoute:
    return  MaterialPageRoute(
     builder: (context) =>  const ControlView());

   default:
    return unDefinedRoute();
  }
 }

 static Route<dynamic>unDefinedRoute(){
  return MaterialPageRoute(builder: (_)=>Scaffold(
   appBar: AppBar(
    title: const Text("no Route"),
   ),
  ));
 }
}