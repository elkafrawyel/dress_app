class FaqResponse {
  FaqResponse({
    this.data,
  });

  FaqResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FaqModel.fromJson(v));
      });
    }
  }

  List<FaqModel>? data;

}

class FaqModel {
  FaqModel({
    this.question,
    this.questionAr,
    this.answer,
    this.answerAr,
  });

  FaqModel.fromJson(dynamic json) {
    question = json['question'];
    questionAr = json['question_ar'];
    answer = json['answer'];
    answerAr = json['answer_ar'];
  }

  String? question;
  String? questionAr;
  String? answer;
  String? answerAr;

}
