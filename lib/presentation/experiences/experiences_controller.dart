import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:miladjalali_ir/domain/entities/experience.dart';

import '../../app/constants/job_type.dart';
import '../../app/constants/work_places.dart';

class ExperiencesController extends GetxController with GetTickerProviderStateMixin {
  RxList<Experience> experiences = <Experience>[].obs;

  @override
  void onInit() {
    addExperiences();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addExperiences() {
    experiences.add(Experience(
        companyTitle: "KodeHauz",
        companyLogo: AssetImage("assets/images/irisa.jpg"),
        startDate: "09/2019",
        endDate: "09/2020",
        jobPosition: "Android Upskill",
        jobType: JobType.internship,
        workplaces: Workplaces.hybrid,
        description: ""));

    experiences.add(Experience(
        companyTitle: "Africinnovate",
        companyLogo: AssetImage("assets/images/irisa.jpg"),
        startDate: "01/2020",
        endDate: "01/2021",
        jobPosition: "Android Developer",
        jobType: JobType.fullTime,
        workplaces: Workplaces.onSite,
        description: ""));

    experiences.add(Experience(
        companyTitle: "Zijemu LTD",
        companyLogo:  AssetImage("assets/images/irisa.jpg"),
        startDate: "10/2021",
        endDate: "2023",
        jobPosition: "Flutter Developer",
        jobType: JobType.fullTime,
        workplaces: Workplaces.onSite,
        description: ""));


    experiences.add(Experience(
        companyTitle: "Ahegel LTD",
        companyLogo:  AssetImage("assets/images/irisa.jpg"),
        startDate: "21/03/2023",
        endDate: "Present",
        jobPosition: "Flutter Developer",
        jobType: JobType.fullTime,
        workplaces: Workplaces.hybrid,
        description: ""));


  }
}
