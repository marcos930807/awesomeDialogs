import 'package:fancy_dialog_example/main.dart';
import 'package:fancy_dialog_example/test_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const splashPage = '/';
  static const testPage = '/test';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case testPage:
        return MaterialPageRoute(builder: (_) => const TestPage());
      case splashPage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
