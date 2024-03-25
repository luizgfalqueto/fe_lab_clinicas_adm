import 'package:fe_lab_clinicas_adm/src/pages/home/home_page.dart';
import 'package:fe_lab_clinicas_adm/src/pages/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomePageRouter extends FlutterGetItPageRouter {
  const HomePageRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => HomePageController(
              attendantDeskAssignmentRepository: i(),
              callNextPatientService: i(),
            )),
      ];

  @override
  String get routeName => '/home';

  @override
  WidgetBuilder get view => (_) => const HomePage();
}
