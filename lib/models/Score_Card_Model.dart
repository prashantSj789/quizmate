class Score_Card_Model {
  List<ResponseList>? _responseList;
  Result? _result;

  Score_Card_Model({List<ResponseList>? responseList, Result? result}) {
    if (responseList != null) {
      this._responseList = responseList;
    }
    if (result != null) {
      this._result = result;
    }
  }

  List<ResponseList>? get responseList => _responseList;
  set responseList(List<ResponseList>? responseList) =>
      _responseList = responseList;
  Result? get result => _result;
  set result(Result? result) => _result = result;

  Score_Card_Model.fromJson(Map<String, dynamic> json) {
    if (json['responseList'] != null) {
      _responseList = <ResponseList>[];
      json['responseList'].forEach((v) {
        _responseList!.add(new ResponseList.fromJson(v));
      });
    }
    _result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._responseList != null) {
      data['responseList'] =
          this._responseList!.map((v) => v.toJson()).toList();
    }
    if (this._result != null) {
      data['result'] = this._result!.toJson();
    }
    return data;
  }
}

class ResponseList {
  int? _id;
  String? _rightAnswer;
  String? _submitResponse;
  bool? _result;
  String? _question;
  int? _marks;

  ResponseList(
      {int? id,
      String? rightAnswer,
      String? submitResponse,
      bool? result,
      String? question,
      int? marks}) {
    if (id != null) {
      this._id = id;
    }
    if (rightAnswer != null) {
      this._rightAnswer = rightAnswer;
    }
    if (submitResponse != null) {
      this._submitResponse = submitResponse;
    }
    if (result != null) {
      this._result = result;
    }
    if (question != null) {
      this._question = question;
    }
    if (marks != null) {
      this._marks = marks;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get rightAnswer => _rightAnswer;
  set rightAnswer(String? rightAnswer) => _rightAnswer = rightAnswer;
  String? get submitResponse => _submitResponse;
  set submitResponse(String? submitResponse) =>
      _submitResponse = submitResponse;
  bool? get result => _result;
  set result(bool? result) => _result = result;
  String? get question => _question;
  set question(String? question) => _question = question;
  int? get marks => _marks;
  set marks(int? marks) => _marks = marks;

  ResponseList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _rightAnswer = json['rightAnswer'];
    _submitResponse = json['submitResponse'];
    _result = json['result'];
    _question = json['question'];
    _marks = json['marks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['rightAnswer'] = this._rightAnswer;
    data['submitResponse'] = this._submitResponse;
    data['result'] = this._result;
    data['question'] = this._question;
    data['marks'] = this._marks;
    return data;
  }
}

class Result {
  Null? _idResult;
  int? _totalQuestion;
  int? _totalAttemptQuestion;
  int? _nonAttemptQuestion;
  int? _rightAnswer;
  int? _wrongAnswer;
  String? _category;
  int? _totalMarks;
  String? _timeStamp;
  int? _maximumMarks;

  Result(
      {Null? idResult,
      int? totalQuestion,
      int? totalAttemptQuestion,
      int? nonAttemptQuestion,
      int? rightAnswer,
      int? wrongAnswer,
      String? category,
      int? totalMarks,
      String? timeStamp,
      int? maximumMarks}) {
    if (idResult != null) {
      this._idResult = idResult;
    }
    if (totalQuestion != null) {
      this._totalQuestion = totalQuestion;
    }
    if (totalAttemptQuestion != null) {
      this._totalAttemptQuestion = totalAttemptQuestion;
    }
    if (nonAttemptQuestion != null) {
      this._nonAttemptQuestion = nonAttemptQuestion;
    }
    if (rightAnswer != null) {
      this._rightAnswer = rightAnswer;
    }
    if (wrongAnswer != null) {
      this._wrongAnswer = wrongAnswer;
    }
    if (category != null) {
      this._category = category;
    }
    if (totalMarks != null) {
      this._totalMarks = totalMarks;
    }
    if (timeStamp != null) {
      this._timeStamp = timeStamp;
    }
    if (maximumMarks != null) {
      this._maximumMarks = maximumMarks;
    }
  }

  Null? get idResult => _idResult;
  set idResult(Null? idResult) => _idResult = idResult;
  int? get totalQuestion => _totalQuestion;
  set totalQuestion(int? totalQuestion) => _totalQuestion = totalQuestion;
  int? get totalAttemptQuestion => _totalAttemptQuestion;
  set totalAttemptQuestion(int? totalAttemptQuestion) =>
      _totalAttemptQuestion = totalAttemptQuestion;
  int? get nonAttemptQuestion => _nonAttemptQuestion;
  set nonAttemptQuestion(int? nonAttemptQuestion) =>
      _nonAttemptQuestion = nonAttemptQuestion;
  int? get rightAnswer => _rightAnswer;
  set rightAnswer(int? rightAnswer) => _rightAnswer = rightAnswer;
  int? get wrongAnswer => _wrongAnswer;
  set wrongAnswer(int? wrongAnswer) => _wrongAnswer = wrongAnswer;
  String? get category => _category;
  set category(String? category) => _category = category;
  int? get totalMarks => _totalMarks;
  set totalMarks(int? totalMarks) => _totalMarks = totalMarks;
  String? get timeStamp => _timeStamp;
  set timeStamp(String? timeStamp) => _timeStamp = timeStamp;
  int? get maximumMarks => _maximumMarks;
  set maximumMarks(int? maximumMarks) => _maximumMarks = maximumMarks;

  Result.fromJson(Map<String, dynamic> json) {
    _idResult = json['id_result'];
    _totalQuestion = json['totalQuestion'];
    _totalAttemptQuestion = json['totalAttemptQuestion'];
    _nonAttemptQuestion = json['nonAttemptQuestion'];
    _rightAnswer = json['rightAnswer'];
    _wrongAnswer = json['wrongAnswer'];
    _category = json['category'];
    _totalMarks = json['totalMarks'];
    _timeStamp = json['timeStamp'];
    _maximumMarks = json['maximumMarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_result'] = this._idResult;
    data['totalQuestion'] = this._totalQuestion;
    data['totalAttemptQuestion'] = this._totalAttemptQuestion;
    data['nonAttemptQuestion'] = this._nonAttemptQuestion;
    data['rightAnswer'] = this._rightAnswer;
    data['wrongAnswer'] = this._wrongAnswer;
    data['category'] = this._category;
    data['totalMarks'] = this._totalMarks;
    data['timeStamp'] = this._timeStamp;
    data['maximumMarks'] = this._maximumMarks;
    return data;
  }
}
