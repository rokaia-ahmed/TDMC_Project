class InvitationModel {
  String? id;
  String? workshopEvaluationId;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  int? type;
  bool? isDeleted;
  String? deletedOn;

  InvitationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workshopEvaluationId = json['workshopEvaluationId'];
    title = json['title'];
    titleAr = json['titleAr'];
    description = json['description'];
    descriptionAr = json['descriptionAr'];
    type = json['type'];
    isDeleted = json['isDeleted'];
    deletedOn = json['deletedOn'];
  }

}
