import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:miladjalali_ir/presentation/experiences/experiences_binding.dart';
import 'package:miladjalali_ir/presentation/information/information_binding.dart';
import 'package:miladjalali_ir/presentation/information/information_page.dart';
import '../../app/constants/themes.dart';
import '../about/about_binding.dart';
import '../about/about_page.dart';

import '../experiences/experiences_page.dart';
import '../information/information_controller.dart';


class HomeController extends GetxController {


  RxInt selectedIndex = 0.obs;
  RxInt navBarSelectedIndex = 0.obs;
  RxList<Widget> pages = [InformationPage(),AboutPage(),ExperiencesPage()].obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();


  final items = [
    'Home',
    'About',
    'Inspiration',
    'Resume',
  ];

  void onIndexChanged(){
    switch(selectedIndex.value){
      case 0:
        InformationBinding().dependencies();
        Get.changeTheme(Themes.themeBlueOrange);
        break;
      case 1:
        AboutBinding().dependencies();
        Get.changeTheme(Themes.themeBlackOrange);
        break;
      case 2:
        ExperiencesBinding().dependencies();
        Get.changeTheme(Themes.themePurpleOrange);
        break;
     
     
    }
  }

  @override
  void onInit() {
    Get.put(InformationController());
    super.onInit();
  }

  onNavbarItemSelected(int v){
    selectedIndex.value = v;
    onIndexChanged();
    update();
  }
}