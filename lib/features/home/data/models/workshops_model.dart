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
  String? vendorId;
  String? venueId;
  String? venueName;
  String? trainerId;
  String? topicId;
  String? topicName;
  int? status;
  String? roomNumber;
  int? capacity;
  String? fromDate;
  String? toDate;
  String? link;
  int? modality;
  String? enrollmentId;
  List<Null>? competencies;


  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    learningOutcome = json['learningOutcome'];
    learningOutcomeAr = json['learningOutcomeAr'];
    companyId = json['companyId'];
    companyName = json['companyName'];
    vendorId = json['vendorId'];
    venueId = json['venueId'];
    venueName = json['venueName'];
    trainerId = json['trainerId'];
    topicId = json['topicId'];
    topicName = json['topicName'];
    status = json['status'];
    roomNumber = json['roomNumber'];
    capacity = json['capacity'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    link = json['link'];
    modality = json['modality'];
    enrollmentId = json['enrollmentId'];
    /*if (json['competencies'] != null) {
      competencies = [];
      json['competencies'].forEach((v) {
        competencies!.add( Null.fromJson(v));
      });
    }*/
  }

}

