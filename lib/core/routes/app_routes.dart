import 'package:feature_first/core/routes/routes_error_page.dart';
import 'package:feature_first/features/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{

  static GoRouter routes = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: SplashScreen.path,
      errorBuilder: (BuildContext context, GoRouterState state) =>
          RouteErrorPage(state: state),
      redirect: (BuildContext context, GoRouterState state){
        return null;
      },
      routes: [

        //Splash Screen Route
        // And Initial route
        GoRoute(
          path: SplashScreen.path,
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
                key: state.pageKey,
                child: const SplashScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                    CupertinoPageTransition(primaryRouteAnimation: animation, secondaryRouteAnimation: secondaryAnimation, linearTransition: true, child: child)
            );
          },
        ),


        // //Home Screen Route
        // GoRoute(
        //     path: HomeScreen.path,
        //     name: HomeScreen.name,
        //     pageBuilder: (context, state) {
        //       return CustomTransitionPage<void>(
        //           key: state.pageKey,
        //           child: const HomeScreen(),
        //           transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        //               CupertinoPageTransition(primaryRouteAnimation: animation, secondaryRouteAnimation: secondaryAnimation, linearTransition: true, child: child)
        //       );
        //     },
        // ),




      ]
  );
}