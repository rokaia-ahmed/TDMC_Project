class InvitationsDetailsModel {
  String? workshopId;
  String? learningOutcome;
  String? learningOutcomeAr;
  String? companyId;
  String? companyName;
  String? companyNameAr;
  String? vendorId;
  String? vendorName;
  String? vendorNameAr;
  String? venueId;
  String? venueName;
  String? venueNameAr;
  String? trainer;
  String? trainerAr;
  String? trainerId;
  String? topicId;
  String? topicName;
  String? topicNameAr;
  int? status;
  String? roomNumber;
  int? capacity;
  String? fromDate;
  String? toDate;
  String? link;
  int? modality;
  int? enrolledUsers;


  InvitationsDetailsModel.fromJson(Map<String, dynamic> json) {
    workshopId = json['workshopId'];
    learningOutcome = json['learningOutcome'];
    learningOutcomeAr = json['learningOutcomeAr'];
    companyId = json['companyId'];
    companyName = json['companyName'];
    companyNameAr = json['companyNameAr'];
    vendorId = json['vendorId'];
    vendorName = json['vendorName'];
    vendorNameAr = json['vendorNameAr'];
    venueId = json['venueId'];
    venueName = json['venueName'];
    venueNameAr = json['venueNameAr'];
    trainer = json['trainer'];
    trainerAr = json['trainerAr'];
    trainerId = json['trainerId'];
    topicId = json['topicId'];
    topicName = json['topicName'];
    topicNameAr = json['topicNameAr'];
    status = json['status'];
    roomNumber = json['roomNumber'];
    capacity = json['capacity'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    link = json['link'];
    modality = json['modality'];
    enrolledUsers = json['enrolledUsers'];
  }

}