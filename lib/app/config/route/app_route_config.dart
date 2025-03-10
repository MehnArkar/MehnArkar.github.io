import 'package:go_router/go_router.dart';
import 'package:portfolio/app/config/route/app_routes.dart';

import '../../../features/index/view/pages/index_page.dart';

class AppRouteConfig {

  //Main Router
  static GoRouter goRouter = GoRouter(
      initialLocation: AppRoutes.indexPage,
      routes: [
        indexRoute
      ]
  );

  //Routes
  static GoRoute indexRoute = GoRoute(
  path: AppRoutes.indexPage,
  name: AppRoutes.indexPage,
  builder: (_,__)=> IndexPage.create(),
  );



}