class Session_Score_card {
  String? message;
  int? correct;
  int? wrong;
  String? sessionUserId;
  int? userId;
  String? sessionId;
  int? marks;
  int? totalQuestion;

  Session_Score_card(
      {this.message,
      this.correct,
      this.wrong,
      this.sessionUserId,
      this.userId,
      this.sessionId,
      this.marks,
      this.totalQuestion});

  Session_Score_card.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    correct = json['correct'];
    wrong = json['wrong'];
    sessionUserId = json['sessionUserId'];
    userId = json['userId'];
    sessionId = json['sessionId'];
    marks = json['marks'];
    totalQuestion = json['totalQuestion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['correct'] = this.correct;
    data['wrong'] = this.wrong;
    data['sessionUserId'] = this.sessionUserId;
    data['userId'] = this.userId;
    data['sessionId'] = this.sessionId;
    data['marks'] = this.marks;
    data['totalQuestion'] = this.totalQuestion;
    return data;
  }
}
