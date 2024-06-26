import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class EndCheckingController with MessageStateMixin {
  EndCheckingController({
    required CallNextPatientService callNextPatientService,
  }) : _callNextPatientService = callNextPatientService;

  CallNextPatientService _callNextPatientService;

  final informationForm = signal<PatientInformationFormModel?>(null);

  Future<void> callNextPatient() async {
    final result = _callNextPatientService.execute();

    switch (result) {
      case Left():
        showError('Erro ao chamar próximo paciente');
      case Right(value: final form?):
        informationForm.value = form!;
      case _:
        showInfo('Nenhum paciente aguardando. Pode ir tomar um café.');
    }
  }
}
