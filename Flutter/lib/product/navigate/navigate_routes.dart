import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  final items = {
    //initial route
    "/": (context) => const LottieLearn(),
    // "/home": (context) => const NavigateHomeView(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    // "/homeDetail": (context) => const NavigateHomeDetailView(id: '')
    NavigateRoutes.detail.withParaf: (context) =>
        const NavigateHomeDetailView(id: '')
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
