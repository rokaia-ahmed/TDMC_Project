
class AssignmentsModel {
  String? trainerName;
  String? trainerNameAr;
  String? workshopDate;
  String? workshopTitle;
  String? workshopTitleAr;
  String? venue;
  String? venueAr;
  String? company;
  String? companyAr;
  String? dateFrom;
  String? toDate;
  List<QuestionsModel>?
  questionsList;


  AssignmentsModel.fromJson(Map<String, dynamic> json) {
    trainerName = json["trainerName"];
    trainerNameAr = json["trainerNameAr"];
    workshopDate = json["workshopDate"];
    workshopTitle = json["workshopTitle"];
    workshopTitleAr = json["workshopTitleAr"];
    venue = json["venue"];
    venueAr = json["venueAR"];
    company = json["company"];
    companyAr = json["companyAr"];
    dateFrom = json["dateFrom"];
    toDate = json["toDate"];
    questionsList = json["workshopEvaluationQuestions"] == null ? null :
    (json["workshopEvaluationQuestions"] as List).map((e) =>
        QuestionsModel.fromJson(e)).toList();
  }

}

class QuestionsModel {
  String? id;
  String? workshopEvaluationId;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  int? questionOrder;
  int? type;
  String? workshopEvaluationQuestionDimensionId;
  bool? isDeleted;
  dynamic deletedOn;
  List<QuestionOptions> questionOptions=[];

  QuestionsModel({
    this.id,
    this.workshopEvaluationId,
    this.title,
    this.titleAr,
    this.description,
    this.descriptionAr,
    this.questionOrder,
    this.type,
    this.workshopEvaluationQuestionDimensionId,
    this.isDeleted,
    this.deletedOn,
    required this.questionOptions,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      QuestionsModel(
    id: json["id"],
    workshopEvaluationId: json["workshopEvaluationId"],
    title: json["title"],
    titleAr: json["titleAr"],
    description: json["description"],
    descriptionAr: json["descriptionAr"],
    questionOrder: json["questionOrder"],
    type: json["type"],
    workshopEvaluationQuestionDimensionId:
    json["workshopEvaluationQuestionDimensionId"],
    isDeleted: json["isDeleted"],
    deletedOn: json["deletedOn"],

        questionOptions:
    json["workshopEvaluationQuestionOptions"] == null ? []
        : List<QuestionOptions>.from(json["workshopEvaluationQuestionOptions"]!.map((x) =>
        QuestionOptions.fromJson(x))),
  );

}

class QuestionOptions {
  String? id;
  String? workshopEvaluationQuestionId;
  String? description;
  String? descriptionAr;
  int? score;
  bool? isDeleted;
  bool isSelect =false;
  dynamic deletedOn;
  dynamic workshopEvaluationQuestion;

  QuestionOptions({
    this.id,
    this.workshopEvaluationQuestionId,
    this.description,
    this.descriptionAr,
    this.score,
    this.isDeleted,
    this.deletedOn,
    this.workshopEvaluationQuestion,
  });

  factory QuestionOptions.fromJson(Map<String, dynamic> json) =>
      QuestionOptions(
    id: json["id"],
    workshopEvaluationQuestionId: json["workshopEvaluationQuestionId"],
    description: json["description"],
    descriptionAr: json["descriptionAr"],
    score: json["score"],
    isDeleted: json["isDeleted"],
    deletedOn: json["deletedOn"],
    workshopEvaluationQuestion:
    json["workshopEvaluationQuestion"],
  );

}
