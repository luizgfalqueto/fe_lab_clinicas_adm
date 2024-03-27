import 'package:fe_lab_clinicas_adm/src/pages/end-checkin/end_checkin_page.dart';
import 'package:fe_lab_clinicas_adm/src/pages/end-checkin/end_checking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class EndCheckinRouter extends FlutterGetItPageRouter {
  const EndCheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => EndCheckingController(
            callNextPatientService: i(),
          ),
        ),
      ];

  @override
  String get routeName => '/end-checkin';

  @override
  WidgetBuilder get view => (_) => const EndCheckinPage();
}
