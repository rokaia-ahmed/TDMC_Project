class NotificationModel {
  String? id;
  String? userId;
  String? entityId;
  int? type;
  String? description;
  String? descriptionAr;
  bool? isRead;
  String? createdOn;


  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    entityId = json['entityId'];
    type = json['type'];
    description = json['desription'];
    descriptionAr = json['descriptionAr'];
    isRead = json['isRead'];
    createdOn = json['createdOn'];
  }

}