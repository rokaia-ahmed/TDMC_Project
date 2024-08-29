
const String baseUrl = 'https://tmcapi-staging.emergingsystems.us/api/';
class ApiConstants{
  /// auth
  static const String login = 'auth/login';
  static const String otp = 'auth/verifycode';
  static const String resentOtp = 'auth/resendotp';

  /// home
  static const String workshops = 'workshop/employeeworkshops';
  static const String withdraw = 'enrollment';

  /// assignments
  static const String questions = 'workshopevaluation/';
  static const String SubmitOption = 'employeeworkshopevaluation/bulk';
}



