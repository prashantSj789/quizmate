class Session_Model {
  int? _sessionId;
  String? _dateAndTime;
  int? _delayDuration;
  int? _duration;
  int? _userId;
  String? _sessionTitle;
  List<SessionQuestionList>? _sessionQuestionList;
  List<SessionUserList>? _sessionUserList;

  Session_Model(
      {int? sessionId,
      String? dateAndTime,
      int? delayDuration,
      int? duration,
      int? userId,
      String? sessionTitle,
      List<SessionQuestionList>? sessionQuestionList,
      List<SessionUserList>? sessionUserList}) {
    if (sessionId != null) {
      this._sessionId = sessionId;
    }
    if (dateAndTime != null) {
      this._dateAndTime = dateAndTime;
    }
    if (delayDuration != null) {
      this._delayDuration = delayDuration;
    }
    if (duration != null) {
      this._duration = duration;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (sessionTitle != null) {
      this._sessionTitle = sessionTitle;
    }
    if (sessionQuestionList != null) {
      this._sessionQuestionList = sessionQuestionList;
    }
    if (sessionUserList != null) {
      this._sessionUserList = sessionUserList;
    }
  }

  int? get sessionId => _sessionId;
  set sessionId(int? sessionId) => _sessionId = sessionId;
  String? get dateAndTime => _dateAndTime;
  set dateAndTime(String? dateAndTime) => _dateAndTime = dateAndTime;
  int? get delayDuration => _delayDuration;
  set delayDuration(int? delayDuration) => _delayDuration = delayDuration;
  int? get duration => _duration;
  set duration(int? duration) => _duration = duration;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get sessionTitle => _sessionTitle;
  set sessionTitle(String? sessionTitle) => _sessionTitle = sessionTitle;
  List<SessionQuestionList>? get sessionQuestionList => _sessionQuestionList;
  set sessionQuestionList(List<SessionQuestionList>? sessionQuestionList) =>
      _sessionQuestionList = sessionQuestionList;
  List<SessionUserList>? get sessionUserList => _sessionUserList;
  set sessionUserList(List<SessionUserList>? sessionUserList) =>
      _sessionUserList = sessionUserList;

  Session_Model.fromJson(Map<String, dynamic> json) {
    _sessionId = json['sessionId'];
    _dateAndTime = json['dateAndTime'];
    _delayDuration = json['delayDuration'];
    _duration = json['duration'];
    _userId = json['userId'];
    _sessionTitle = json['sessionTitle'];
    if (json['sessionQuestionList'] != null) {
      _sessionQuestionList = <SessionQuestionList>[];
      json['sessionQuestionList'].forEach((v) {
        _sessionQuestionList!.add(new SessionQuestionList.fromJson(v));
      });
    }
    if (json['sessionUserList'] != null) {
      _sessionUserList = <SessionUserList>[];
      json['sessionUserList'].forEach((v) {
        _sessionUserList!.add(new SessionUserList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sessionId'] = this._sessionId;
    data['dateAndTime'] = this._dateAndTime;
    data['delayDuration'] = this._delayDuration;
    data['duration'] = this._duration;
    data['userId'] = this._userId;
    data['sessionTitle'] = this._sessionTitle;
    if (this._sessionQuestionList != null) {
      data['sessionQuestionList'] =
          this._sessionQuestionList!.map((v) => v.toJson()).toList();
    }
    if (this._sessionUserList != null) {
      data['sessionUserList'] =
          this._sessionUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionQuestionList {
  int? _id;
  String? _question;
  String? _options1;
  String? _options2;
  String? _options3;
  String? _options4;
  String? _category;
  String? _topic;
  String? _marks;
  String? _difficulty;

  SessionQuestionList(
      {int? id,
      String? question,
      String? options1,
      String? options2,
      String? options3,
      String? options4,
      String? category,
      String? topic,
      String? marks,
      String? difficulty}) {
    if (id != null) {
      this._id = id;
    }
    if (question != null) {
      this._question = question;
    }
    if (options1 != null) {
      this._options1 = options1;
    }
    if (options2 != null) {
      this._options2 = options2;
    }
    if (options3 != null) {
      this._options3 = options3;
    }
    if (options4 != null) {
      this._options4 = options4;
    }
    if (category != null) {
      this._category = category;
    }
    if (topic != null) {
      this._topic = topic;
    }
    if (marks != null) {
      this._marks = marks;
    }
    if (difficulty != null) {
      this._difficulty = difficulty;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get question => _question;
  set question(String? question) => _question = question;
  String? get options1 => _options1;
  set options1(String? options1) => _options1 = options1;
  String? get options2 => _options2;
  set options2(String? options2) => _options2 = options2;
  String? get options3 => _options3;
  set options3(String? options3) => _options3 = options3;
  String? get options4 => _options4;
  set options4(String? options4) => _options4 = options4;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get topic => _topic;
  set topic(String? topic) => _topic = topic;
  String? get marks => _marks;
  set marks(String? marks) => _marks = marks;
  String? get difficulty => _difficulty;
  set difficulty(String? difficulty) => _difficulty = difficulty;

  SessionQuestionList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _question = json['question'];
    _options1 = json['options1'];
    _options2 = json['options2'];
    _options3 = json['options3'];
    _options4 = json['options4'];
    _category = json['category'];
    _topic = json['topic'];
    _marks = json['marks'];
    _difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['question'] = this._question;
    data['options1'] = this._options1;
    data['options2'] = this._options2;
    data['options3'] = this._options3;
    data['options4'] = this._options4;
    data['category'] = this._category;
    data['topic'] = this._topic;
    data['marks'] = this._marks;
    data['difficulty'] = this._difficulty;
    return data;
  }
}

class SessionUserList {
  String? _sessionUserId;
  int? _userId;
  String? _userName;
  Null? _sessionRank;
  Null? _submissionTimeStamp;
  bool? _completed;
  int? _marks;

  SessionUserList(
      {String? sessionUserId,
      int? userId,
      String? userName,
      Null? sessionRank,
      Null? submissionTimeStamp,
      bool? completed,
      int? marks}) {
    if (sessionUserId != null) {
      this._sessionUserId = sessionUserId;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (userName != null) {
      this._userName = userName;
    }
    if (sessionRank != null) {
      this._sessionRank = sessionRank;
    }
    if (submissionTimeStamp != null) {
      this._submissionTimeStamp = submissionTimeStamp;
    }
    if (completed != null) {
      this._completed = completed;
    }
    if (marks != null) {
      this._marks = marks;
    }
  }

  String? get sessionUserId => _sessionUserId;
  set sessionUserId(String? sessionUserId) => _sessionUserId = sessionUserId;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get userName => _userName;
  set userName(String? userName) => _userName = userName;
  Null? get sessionRank => _sessionRank;
  set sessionRank(Null? sessionRank) => _sessionRank = sessionRank;
  Null? get submissionTimeStamp => _submissionTimeStamp;
  set submissionTimeStamp(Null? submissionTimeStamp) =>
      _submissionTimeStamp = submissionTimeStamp;
  bool? get completed => _completed;
  set completed(bool? completed) => _completed = completed;
  int? get marks => _marks;
  set marks(int? marks) => _marks = marks;

  SessionUserList.fromJson(Map<String, dynamic> json) {
    _sessionUserId = json['sessionUserId'];
    _userId = json['userId'];
    _userName = json['userName'];
    _sessionRank = json['sessionRank'];
    _submissionTimeStamp = json['submissionTimeStamp'];
    _completed = json['completed'];
    _marks = json['marks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sessionUserId'] = this._sessionUserId;
    data['userId'] = this._userId;
    data['userName'] = this._userName;
    data['sessionRank'] = this._sessionRank;
    data['submissionTimeStamp'] = this._submissionTimeStamp;
    data['completed'] = this._completed;
    data['marks'] = this._marks;
    return data;
  }
}
