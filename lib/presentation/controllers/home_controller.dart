import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miladjalali_ir/presentation/controllers/about_binding.dart';
import 'package:miladjalali_ir/presentation/controllers/about_controller.dart';
import 'package:miladjalali_ir/presentation/controllers/experiences_binding.dart';
import 'package:miladjalali_ir/presentation/controllers/home_binding.dart';
import 'package:miladjalali_ir/presentation/controllers/information_binding.dart';
import 'package:miladjalali_ir/presentation/controllers/information_controller.dart';
import 'package:miladjalali_ir/presentation/controllers/projets_binding.dart';
import 'package:miladjalali_ir/presentation/pages/about_page.dart';
import 'package:miladjalali_ir/presentation/pages/experiences_page.dart';
import 'package:miladjalali_ir/presentation/pages/information_page.dart';

import '../pages/projects_page.dart';

class HomeController extends GetxController {


  RxInt selectedIndex = 0.obs;
  RxInt navBarSelectedIndex = 0.obs;
  RxList<Widget> pages = [InformationPage(),AboutPage(),ExperiencesPage(),ProjectsPage()].obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();


  final items = [
    'Home',
    'About',
    'Experience',
    'Projects',
    'Blog',
    'Resume',
  ];

  void onIndexChanged(){
    switch(selectedIndex.value){
      case 0:
        InformationBinding().dependencies();
        break;
      case 1:
        AboutBinding().dependencies();
        break;
      case 2:
        ExperiencesBinding().dependencies();
        break;
      case 3:
        ProjectsBinding().dependencies();
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