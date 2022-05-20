//
// import 'package:flutter/material.dart';
//
//
// class Routes {
//   static const String splashRoute = "/";
//   static const String loginRoute = "/login";
//   static const String registerRoute = "/register";
//   static const String mainRoute = "/main";
// }
//
// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: (_) => const SplashView());
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_) =>  LoginScreen());
//
//         case Routes.registerRoute:
//         return MaterialPageRoute(builder: (_) =>  RegisterScreen());
//
//       case Routes.mainRoute:
//         return MaterialPageRoute(builder: (_) => const Home());
//
//       default:
//         return unDefinedRoute();
//     }
//   }
//
//   static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//         builder: (_) => Scaffold(
//               appBar: AppBar(
//                 title: const Text(AppStrings.noRouteFound),
//               ),
//               body: const Center(child: Text(AppStrings.noRouteFound)),
//             ));
//   }
// }
