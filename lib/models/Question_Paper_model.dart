class Question_Paper_Model {
  List<QuestionList>? questionList;
  int? totalQuestion;
  String? category;

  Question_Paper_Model({this.questionList, this.totalQuestion, this.category});

  Question_Paper_Model.fromJson(Map<String, dynamic> json) {
    if (json['questionList'] != null) {
      questionList = <QuestionList>[];
      json['questionList'].forEach((v) {
        questionList!.add(new QuestionList.fromJson(v));
      });
    }
    totalQuestion = json['totalQuestion'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questionList != null) {
      data['questionList'] = this.questionList!.map((v) => v.toJson()).toList();
    }
    data['totalQuestion'] = this.totalQuestion;
    data['category'] = this.category;
    return data;
  }
}

class QuestionList {
  int? id;
  String? question;
  String? options1;
  String? options2;
  String? options3;
  String? options4;
  String? category;
  String? topic;
  String? marks;
  String? difficulty;

  QuestionList(
      {this.id,
      this.question,
      this.options1,
      this.options2,
      this.options3,
      this.options4,
      this.category,
      this.topic,
      this.marks, 
      this.difficulty});

  QuestionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    options1 = json['options1'];
    options2 = json['options2'];
    options3 = json['options3'];
    options4 = json['options4'];
    category = json['category'];
    topic = json['topic'];
    marks = json['marks'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['options1'] = this.options1;
    data['options2'] = this.options2;
    data['options3'] = this.options3;
    data['options4'] = this.options4;
    data['category'] = this.category;
    data['topic'] = this.topic;
    data['marks'] = this.marks;
    data['difficulty'] = this.difficulty;
    return data;
  }
}

