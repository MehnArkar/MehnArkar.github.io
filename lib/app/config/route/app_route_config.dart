import 'package:go_router/go_router.dart';
import 'package:portfolio/app/config/route/app_routes.dart';
import 'package:portfolio/features/index/presentation/pages/index_page.dart';

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