import 'package:portfolio/features/project/data/model/project.dart';

class ProjectRepository {

  List<Project> getProjects(){
    return [
      Project(
          name: "Khin Collections",
          description: "Khin Collections Gems & Jewellery Shop eCommerce Application is designed to provide a luxurious, user-friendly platform for buying and selling exquisite jewellery and gemstones. Targeting affluent individuals, gem enthusiasts, and collectors.",
          images: ["assets/images/mockup.png","assets/images/mockup.png","assets/images/mockup.png","assets/images/mockup.png"],
          playstore: "https://apps.apple.com/us/app/khin-collections/id6667100260",
          appstore: "https://apps.apple.com/us/app/khin-collections/id6667100260",
      ),
      Project(
        name: "1s Stock Solution",
        description: "1S Stock Solution  is designed to provide a luxurious, user-friendly platform for buying and selling exquisite jewellery and gemstones. Targeting affluent individuals, gem enthusiasts, and collectors.",
        images: ["assets/images/mockup.png","assets/images/mockup.png","assets/images/mockup.png","assets/images/mockup.png"],
        playstore: "https://apps.apple.com/us/app/khin-collections/id6667100260",
        appstore: "https://apps.apple.com/us/app/khin-collections/id6667100260",
      )
    ];
  }

}