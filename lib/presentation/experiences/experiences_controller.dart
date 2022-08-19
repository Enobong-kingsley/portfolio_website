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
        companyTitle: "Irisa",
        companyLogo: AssetImage("assets/images/irisa.jpg"),
        startDate: "08/06/2016",
        endDate: "08/08/2016",
        jobPosition: "Android Intern",
        jobType: JobType.internship,
        workplaces: Workplaces.hybrid,
        description: ""));

    experiences.add(Experience(
        companyTitle: "Nicode",
        companyLogo: AssetImage("assets/images/nicode.jpg"),
        startDate: "08/07/2022",
        endDate: "08/07/2022",
        jobPosition: "Android Developer",
        jobType: JobType.fullTime,
        workplaces: Workplaces.onSite,
        description: ""));

    experiences.add(Experience(
        companyTitle: "Nicode",
        companyLogo: AssetImage("assets/images/nicode.jpg"),
        startDate: "08/07/2022",
        endDate: "08/07/2022",
        jobPosition: "Android Developer",
        jobType: JobType.fullTime,
        workplaces: Workplaces.onSite,
        description: ""));

    experiences.add(Experience(
        companyTitle: "Nicode",
        companyLogo: AssetImage("assets/images/nicode.jpg"),
        startDate: "08/07/2022",
        endDate: "08/07/2022",
        jobPosition: "Android Developer",
        jobType: JobType.fullTime,
        workplaces: Workplaces.onSite,
        description: ""));
  }
}
