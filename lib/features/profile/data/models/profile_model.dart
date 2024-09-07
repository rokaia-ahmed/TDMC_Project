class ProfileModel {
  String? userName;
  String? email;
  String? phoneNumber;
  Company? company;
  int? language;

  ProfileModel(
      {this.userName,
        this.email,
        this.phoneNumber,
        this.company,
        this.language});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    company =
    json['company'] != null ? Company.fromJson(json['company'])
        : null;
    language = json['language'];
  }
}

class Company {
  String? id;
  String? industryId;
  String? name;
  String? nameAr;
  bool? isDeleted;
  String? deletedOn;
  String? smtpUsername;
  String? smtpPassword;
  String? twilioAccountSid;
  String? twilioAuthToken;
  String? twilioFromSenderName;
  String? twilioWhatsappFromMobile;
  String? smtpFromEmail;
  int? withdrawalDeadline;

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    industryId = json['industryId'];
    name = json['name'];
    nameAr = json['nameAr'];
    isDeleted = json['isDeleted'];
    deletedOn = json['deletedOn'];
    smtpUsername = json['smtpUsername'];
    smtpPassword = json['smtpPassword'];
    twilioAccountSid = json['twilioAccountSid'];
    twilioAuthToken = json['twilioAuthToken'];
    twilioFromSenderName = json['twilioFromSenderName'];
    twilioWhatsappFromMobile = json['twilioWhatsappFromMobile'];
    smtpFromEmail = json['smtpFromEmail'];
    withdrawalDeadline = json['withdrawalDeadline'];
  }

}

