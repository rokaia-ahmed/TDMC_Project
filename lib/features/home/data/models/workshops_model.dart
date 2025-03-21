class WorkShopsModel {
  List<Result> completedWorkshops=[];
  List<Result> upcomingWorkshops=[];
  List<Result> invitedWorkshops=[];
  List<Result> enrolledWorkshops=[];

  WorkShopsModel(
      {required this.completedWorkshops,
        required this.upcomingWorkshops,
        required this.invitedWorkshops,
        required this.enrolledWorkshops});

  WorkShopsModel.fromJson(Map<String, dynamic> json) {
    if (json['completedWorkshops'] != null) {
       completedWorkshops =  [];
      json['completedWorkshops'].forEach((v) {
        completedWorkshops.add(Result.fromJson(v));
      });
    }
    if (json['upcomingWorkshops'] != null) {
      upcomingWorkshops =  [];
      json['upcomingWorkshops'].forEach((v) {
        upcomingWorkshops.add( Result.fromJson(v));
      });
    }
    if (json['invitedWorkshops'] != null) {
      invitedWorkshops =  [];
      json['invitedWorkshops'].forEach((v) {
        invitedWorkshops.add( Result.fromJson(v));
      });
    }
    if (json['enrolledWorkshops'] != null) {
      enrolledWorkshops = [];
      json['enrolledWorkshops'].forEach((v) {
        enrolledWorkshops.add( Result.fromJson(v));
      });
    }
  }

}

class Result {
  String? id;
  String? learningOutcome;
  String? learningOutcomeAr;
  String? companyId;
  String? companyName;
  String? companyNameAr;
  String? vendorId;
  String? venueId;
  String? venueName;
  String? venueNameAr;
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
  String? enrollmentId;
  bool? canWithdraw;
  bool? showWorkshopAssessment;



  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    learningOutcome = json['learningOutcome'];
    learningOutcomeAr = json['learningOutcomeAr'];
    companyId = json['companyId'];
    companyName = json['companyName'];
    companyNameAr = json['companyNameAr'];
    vendorId = json['vendorId'];
    venueId = json['venueId'];
    venueName = json['venueName'];
    venueNameAr = json['venueNameAr'];
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
    enrollmentId = json['enrollmentId'];
    canWithdraw =json['canWithdraw'];
    showWorkshopAssessment =json['showWokrshopAssessment'];
  }

}

