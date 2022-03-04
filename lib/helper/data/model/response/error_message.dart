
class ErrorMessage {
  List<String>? nameError;
  List<String>? phoneError;
  List<String>? dobError;
  List<String>? passwordError;
  List<String>? emailError;
  List<String>? pinError;

  ErrorMessage();

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    nameError = [];
    phoneError = [];
    dobError = [];
    passwordError = [];
    emailError = [];
    pinError = [];

   /* if (json.containsKey(otp)) {
      if (json[otp] != null) {
        json[otp].forEach((v) {
          pinError!.add(v);
        });
      }
    }*/
  }
}

class PeriodErrorMessage {
  List<String>? durationError;
  List<String>? irregularError;
  List<String>? cycleDurationError;
  List<String>? irregularMonthError;
  List<String>? heightError;
  List<String>? weightError;
  List<String>? startDateError;
  List<String>? endDateError;

  PeriodErrorMessage();

  PeriodErrorMessage.fromJson(Map<String, dynamic> json) {
    durationError = [];
    irregularError = [];
    cycleDurationError = [];
    irregularMonthError = [];
    heightError = [];
    weightError = [];
    startDateError = [];
    endDateError = [];

   /* if (json.containsKey(period_duration)) {
      if (json[period_duration] != null) {
        json[period_duration].forEach((v) {
          durationError!.add(v);
        });
      }
    }*/

  }
}