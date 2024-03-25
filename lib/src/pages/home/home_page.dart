import 'package:fe_lab_clinicas_adm/src/pages/home/home_page_controller.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MessageViewMixin{
  final formKey = GlobalKey<FormState>();
  final deskNumberEC = TextEditingController();
  final controller = Injector.get<HomePageController>();

  @override
  void initState() {
    messageListener(controller);
    effect(() {
      if(controller.informationForm != null) {
        print('Paciente carregado');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    deskNumberEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            width: sizeOf.width * .4,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bem Vindo!',
                  style: LabClinicasTheme.titleStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Preencha o campo do guichê que você está atendendo',
                  style: LabClinicasTheme.subtitleSmallStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: sizeOf.width * 3,
                  child: TextFormField(
                    controller: deskNumberEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Guiche obrigatório'),
                        Validatorless.number('Digite apenas números'),
                      ],
                    ),
                    decoration: const InputDecoration(
                      label: Text('Numero do guichê')
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 48,
                  width: sizeOf.width * 3,
                  child: ElevatedButton(
                    onPressed: () {
                      final valid = formKey.currentState?.validate() ?? false;

                      if (valid) {
                        controller.startService(int.parse(deskNumberEC.text));
                      }
                    },
                    child: const Text('CHAMAR PRÓXIMO PACIENTE'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
