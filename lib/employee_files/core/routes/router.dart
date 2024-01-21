part of 'router_imports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //auth routes
    AdaptiveRoute(page: Terms),
    AdaptiveRoute(page: About),
    AdaptiveRoute(page: Privacy),
    AdaptiveRoute(page: RepeatedQuestions),
    AdaptiveRoute(page: LocationAddress),
    ...authRoute,
    ...baseRoute

  ],
)
class $AppRouter {}
