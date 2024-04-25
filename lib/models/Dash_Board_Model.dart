class DashBoardModel {
  String? userName;
  String? email;
  Null? profileUrl;
  int? totalMarks;
  int? userRank;
  int? totalQuiz;
  List<ResultList>? resultList;
  List<SessionList>? sessionList;
  int? id;

  DashBoardModel(
      {this.userName,
      this.email,
      this.profileUrl,
      this.totalMarks,
      this.userRank,
      this.totalQuiz,
      this.resultList,
      this.sessionList,
      this.id});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    profileUrl = json['profileUrl'];
    totalMarks = json['totalMarks'];
    userRank = json['userRank'];
    totalQuiz = json['totalQuiz'];
    if (json['resultList'] != null) {
      resultList = <ResultList>[];
      json['resultList'].forEach((v) {
        resultList!.add(new ResultList.fromJson(v));
      });
    }
    if (json['sessionList'] != null) {
      sessionList = <SessionList>[];
      json['sessionList'].forEach((v) {
        sessionList!.add(new SessionList.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['profileUrl'] = this.profileUrl;
    data['totalMarks'] = this.totalMarks;
    data['userRank'] = this.userRank;
    data['totalQuiz'] = this.totalQuiz;
    if (this.resultList != null) {
      data['resultList'] = this.resultList!.map((v) => v.toJson()).toList();
    }
    if (this.sessionList != null) {
      data['sessionList'] = this.sessionList!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class ResultList {
  int? idResult;
  int? totalQuestion;
  int? totalAttemptQuestion;
  int? nonAttemptQuestion;
  int? rightAnswer;
  int? wrongAnswer;
  String? category;
  int? totalMarks;
  String? timeStamp;
  int? maximumMarks;

  ResultList(
      {this.idResult,
      this.totalQuestion,
      this.totalAttemptQuestion,
      this.nonAttemptQuestion,
      this.rightAnswer,
      this.wrongAnswer,
      this.category,
      this.totalMarks,
      this.timeStamp,
      this.maximumMarks});

  ResultList.fromJson(Map<String, dynamic> json) {
    idResult = json['id_result'];
    totalQuestion = json['totalQuestion'];
    totalAttemptQuestion = json['totalAttemptQuestion'];
    nonAttemptQuestion = json['nonAttemptQuestion'];
    rightAnswer = json['rightAnswer'];
    wrongAnswer = json['wrongAnswer'];
    category = json['category'];
    totalMarks = json['totalMarks'];
    timeStamp = json['timeStamp'];
    maximumMarks = json['maximumMarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_result'] = this.idResult;
    data['totalQuestion'] = this.totalQuestion;
    data['totalAttemptQuestion'] = this.totalAttemptQuestion;
    data['nonAttemptQuestion'] = this.nonAttemptQuestion;
    data['rightAnswer'] = this.rightAnswer;
    data['wrongAnswer'] = this.wrongAnswer;
    data['category'] = this.category;
    data['totalMarks'] = this.totalMarks;
    data['timeStamp'] = this.timeStamp;
    data['maximumMarks'] = this.maximumMarks;
    return data;
  }
}

class SessionList {
  int? sessionId;
  String? dateAndTime;
  String? startTimeStamp;
  String? expiryTimeStamp;
  int? delayDuration;
  int? duration;
  int? userId;
  String? sessionTitle;
  List<SessionQuestionList>? sessionQuestionList;
  List<SessionUserList>? sessionUserList;

  SessionList(
      {this.sessionId,
      this.dateAndTime,
      this.startTimeStamp,
      this.expiryTimeStamp,
      this.delayDuration,
      this.duration,
      this.userId,
      this.sessionTitle,
      this.sessionQuestionList,
      this.sessionUserList});

  SessionList.fromJson(Map<String, dynamic> json) {
    sessionId = json['sessionId'];
    dateAndTime = json['dateAndTime'];
    startTimeStamp = json['startTimeStamp'];
    expiryTimeStamp = json['expiryTimeStamp'];
    delayDuration = json['delayDuration'];
    duration = json['duration'];
    userId = json['userId'];
    sessionTitle = json['sessionTitle'];
    if (json['sessionQuestionList'] != null) {
      sessionQuestionList = <SessionQuestionList>[];
      json['sessionQuestionList'].forEach((v) {
        sessionQuestionList!.add(new SessionQuestionList.fromJson(v));
      });
    }
    if (json['sessionUserList'] != null) {
      sessionUserList = <SessionUserList>[];
      json['sessionUserList'].forEach((v) {
        sessionUserList!.add(new SessionUserList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sessionId'] = this.sessionId;
    data['dateAndTime'] = this.dateAndTime;
    data['startTimeStamp'] = this.startTimeStamp;
    data['expiryTimeStamp'] = this.expiryTimeStamp;
    data['delayDuration'] = this.delayDuration;
    data['duration'] = this.duration;
    data['userId'] = this.userId;
    data['sessionTitle'] = this.sessionTitle;
    if (this.sessionQuestionList != null) {
      data['sessionQuestionList'] =
          this.sessionQuestionList!.map((v) => v.toJson()).toList();
    }
    if (this.sessionUserList != null) {
      data['sessionUserList'] =
          this.sessionUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionQuestionList {
  int? id;
  String? question;
  String? options1;
  String? options2;
  String? options3;
  String? options4;
  String? rightAnswer;
  String? category;
  String? topic;
  int? marks;
  String? difficulty;
  int? rightOption;
  bool? enabled;

  SessionQuestionList(
      {this.id,
      this.question,
      this.options1,
      this.options2,
      this.options3,
      this.options4,
      this.rightAnswer,
      this.category,
      this.topic,
      this.marks,
      this.difficulty,
      this.rightOption,
      this.enabled});

  SessionQuestionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    options1 = json['options1'];
    options2 = json['options2'];
    options3 = json['options3'];
    options4 = json['options4'];
    rightAnswer = json['rightAnswer'];
    category = json['category'];
    topic = json['topic'];
    marks = json['marks'];
    difficulty = json['difficulty'];
    rightOption = json['rightOption'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['options1'] = this.options1;
    data['options2'] = this.options2;
    data['options3'] = this.options3;
    data['options4'] = this.options4;
    data['rightAnswer'] = this.rightAnswer;
    data['category'] = this.category;
    data['topic'] = this.topic;
    data['marks'] = this.marks;
    data['difficulty'] = this.difficulty;
    data['rightOption'] = this.rightOption;
    data['enabled'] = this.enabled;
    return data;
  }
}

class SessionUserList {
  String? sessionUserId;
  int? userId;
  String? userName;
  int? sessionRank;
  String? submissionTimeStamp;
  bool? completed;
  int? marks;

  SessionUserList(
      {this.sessionUserId,
      this.userId,
      this.userName,
      this.sessionRank,
      this.submissionTimeStamp,
      this.completed,
      this.marks});

  SessionUserList.fromJson(Map<String, dynamic> json) {
    sessionUserId = json['sessionUserId'];
    userId = json['userId'];
    userName = json['userName'];
    sessionRank = json['sessionRank'];
    submissionTimeStamp = json['submissionTimeStamp'];
    completed = json['completed'];
    marks = json['marks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sessionUserId'] = this.sessionUserId;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['sessionRank'] = this.sessionRank;
    data['submissionTimeStamp'] = this.submissionTimeStamp;
    data['completed'] = this.completed;
    data['marks'] = this.marks;
    return data;
  }
}
