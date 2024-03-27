
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../models/patient_information_form_model.dart';

class CheckinController with MessageStateMixin {
  final informationForm = signal<PatientInformationFormModel?>(null);
}