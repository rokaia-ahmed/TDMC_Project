class DetailsCheckModel {
  String? id;
  String? workshopTitle;
  String? employeeId;
  String? employeeInternalId;
  String? employeeName;
  String? employeeNameAr;
  String? employeeEmail;
  String? departmentName;
  String? fromDate;
  String? toDate;
  String? venue;
  String? workshopId;
  String? workshopsGroupId;
  String? url;
  int? status;
  String? statusString;
  String? rejectionReason;
  String? createdOn;
  int? enrolled;


  DetailsCheckModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workshopTitle = json['workshopTitle'];
    employeeId = json['employeeId'];
    employeeInternalId = json['employeeInternalId'];
    employeeName = json['employeeName'];
    employeeNameAr = json['employeeNameAr'];
    employeeEmail = json['employeeEmail'];
    departmentName = json['departmentName'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    venue = json['venue'];
    workshopId = json['workshopId'];
    workshopsGroupId = json['workshopsGroupId'];
    url = json['url'];
    status = json['status'];
    statusString = json['statusString'];
    rejectionReason = json['rejectionReason'];
    createdOn = json['createdOn'];
    enrolled = json['enrolled'];
  }
}