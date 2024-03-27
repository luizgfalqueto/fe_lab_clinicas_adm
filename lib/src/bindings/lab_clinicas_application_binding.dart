import 'package:fe_lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/panel/panel_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/panel/panel_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/patient_information_form/patient_information_form_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/patient_information_form/patient_information_form_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../core/env.dart';

class LabClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton((i) => RestClient(Env.backendBaseUrl)),

        Bind.lazySingleton<PatientInformationFormRepository>(
            (i) => PatientInformationFormRepositoryImpl(restClient: i())),

        Bind.lazySingleton<AttendantDeskAssignmentRepository>(
            (i) => AttendantDeskAssignmentRepositoryImpl(restClient: i())),

        Bind.lazySingleton<PanelRepository>(
            (i) => PanelRepositoryImpl(restClient: i())),
            
        Bind.lazySingleton(
          (i) => CallNextPatientService(
            patientInformationFormRepository: i(),
            attendantDeskAssignmentRepository: i(),
            panelRepository: i(),
          ),
        ),
      ];
}
