class user_model {
  int? _userId;
  String? _token;
  String? _userName;

  user_model({int? userId, String? token, String? userName}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (token != null) {
      this._token = token;
    }
    if (userName != null) {
      this._userName = userName;
    }
  }

  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get token => _token;
  set token(String? token) => _token = token;
  String? get userName => _userName;
  set userName(String? userName) => _userName = userName;

  user_model.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _token = json['token'];
    _userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['token'] = this._token;
    data['userName'] = this._userName;
    return data;
  }
}
