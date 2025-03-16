import 'package:portfolio/features/project/data/model/project.dart';

class ProjectRepository {

  List<Project> getProjects(){
    return [
      Project(
        name: "Fary", 
        description: "Fair Taxi is a modern taxi booking application that connects passengers with drivers seamlessly. It stands as one of my milestone projects, showcasing my ability to build scalable, user-centric solutions.",
        images: ["fary_1.png","fary_2.png"],
        playstore: "https://play.google.com/store/apps/details?id=com.xsphere.fary_taxi_enduser&pcampaignid=web_share",
        appstore: "https://apps.apple.com/th/app/fary-ready-to-deliver/id1669442797"
      ),
      Project(
        name: "Ngwe Zay", 
        description: "Ngwe Zay is a Myanmar Kyat-based currency exchange app, allowing users to quickly check MMK to foreign exchange rates and convert currencies effortlessly. With a user-friendly interface and practical features, it’s designed for fast, convenient currency conversions — now trusted by over 5,000+ users.",
        images: ["ngwe_zay_1.png","ngwe_zay_2.png"],
        playstore: "https://play.google.com/store/apps/details?id=com.sourcecode.mm.ngwe_zay&pcampaignid=web_share",
        appstore: "https://apps.apple.com/th/app/ngwe-zay/id6475289659"  
      ),
      Project(
        name: "Khin Collections", 
        description: "Khin Collections Jewelry app delivers an elegant and seamless shopping experience for jewelry lovers. Built with an intuitive interface and an exclusive membership rewards system, the app ensures smooth browsing, easy purchases, and a memorable user journey from start to finish.",
        images: ["khin_collections_1.png","khin_collections_2.png"],
        appstore:"https://apps.apple.com/th/app/khin-collections/id6667100260" 
      ),
      Project(
        name: "L2E Myanmar", 
        description: "L2E Myanmar is an e-learning application designed to provide students with flexible, accessible online education. Built to support remote learning, the app allows students to access courses and educational content anytime, anywhere, empowering self-paced learning.",
        images: ["l2e_1.png","l2e_2.png"],
        playstore:"https://play.google.com/store/apps/details?id=com.xsphere.e_learning&pcampaignid=web_share",
        appstore: "https://apps.apple.com/th/app/l2e-myanmar/id1626038880"
      ),
      Project(
        name: "Htawara", 
        description: "HtaWaRa is an educational app designed to provide a safe, inclusive space for teenagers and young adults to learn about sexual and reproductive health, promoting open discussion and accessible knowledge.",
        images: ["htawara_1.png","htawara_2.png"],
        playstore: "https://play.google.com/store/apps/details?id=com.asrh.htawara&pcampaignid=web_share",
        appstore: "https://apps.apple.com/th/app/htawara/id1660725226"
      ),
      Project(
        name: "Open Your Heart", 
        description: "Open Your Heart is an offline mental health awareness app designed to support teenagers, parents, and caregivers of younger children. Built for rural areas with limited internet access, it offers essential coping strategies and guidance during challenging times.",
        images: ["oyh_1.png","oyh_2.png"],
        playstore: "https://play.google.com/store/apps/details?id=org.openyourheartwithme&pcampaignid=web_share",
        appstore: "https://apps.apple.com/th/app/open-your-heart/id6465067523"
      ),
      Project(
        name: "GBI Gem Lab", 
        description: "GBI Gem Lab is the official app of GBI Gemological Laboratory, based in Bangkok’s gemstone hub. It offers a comprehensive guide to gem identification, certification, and industry insights — bringing expert knowledge and the beauty of gemstones to your fingertips.",
        images: ["gbi_1.png","gbi_2.png"],
        playstore: "https://play.google.com/store/apps/details?id=com.gbigemlab&pcampaignid=web_share",
        appstore: "https://apps.apple.com/th/app/gbi-gem-lab/id6475329193"
      )

    ];
  }

}