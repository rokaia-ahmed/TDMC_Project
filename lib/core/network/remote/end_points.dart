
const String baseUrl = 'https://app-api-staging.nextlms.us/api/';
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
   /// profile
  static const String GetProfile = 'auth/getprofile';

  /// notification
  static const String registerFcm = 'notification';
  static const String notifications = 'notification';
  static const String invitations = 'workshopevaluation/';
  static const String makeRead = 'notification/mark-as-read';
  static const String makeAllRead = 'notification/mark-as-read';
  static const String enrollAndReject = 'workshopInvitation/';
}



