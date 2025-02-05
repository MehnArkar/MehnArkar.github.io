import 'package:portfolio/features/about/data/model/work_experience.dart';

class ExperienceRepository{

  List<WorkExperience> getWorkExperiences(){
    return [

      WorkExperience(
          companyName: "Source Code",
          position: "Flutter Mobile Developer",
          startDate: DateTime(2023,7),
          description: "Currently work at Source Code, a software development company, developing new apps and maintaining existing ones. Engage with clients, gather their requirements, and transform business ideas into innovative IT solutions."),

      WorkExperience(
          companyName: "XSphere",
          position: "Flutter Mobile Developer",
          startDate: DateTime(2022,4),
          endDate: DateTime(2023,4),
          description: "Developed mobile apps across industries, including ride-hailing, learning platforms, and stock management. Led the development of Fary Driver, a driver-focused app for the Fary Taxi platform."
      )

    ];
  }

}