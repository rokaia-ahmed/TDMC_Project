class NotificationModel {
  String? id;
  String? entityId;
  String? enrollmentId;
  int? type;
  String? description;
  String? descriptionAr;
  bool? isRead;
  String? createdOn;


  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entityId = json['entityId'];
    enrollmentId = json['enrollmentId'];
    type = json['type'];
    description = json['description'];
    descriptionAr = json['descriptionAr'];
    isRead = json['isRead'];
    createdOn = json['createdOn'];
  }

}