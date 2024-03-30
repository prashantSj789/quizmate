class response_model {
  List<ResponseList>? responseList;
  int? totalQuestion;
  int? maximumMarks;
  String? category;

  response_model(
      {this.responseList,
      this.totalQuestion,
      this.maximumMarks,
      this.category});

  response_model.fromJson(Map<String, dynamic> json) {
    if (json['responseList'] != null) {
      responseList = <ResponseList>[];
      json['responseList'].forEach((v) {
        responseList!.add(new ResponseList.fromJson(v));
      });
    }
    totalQuestion = json['totalQuestion'];
    maximumMarks = json['maximumMarks'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseList != null) {
      data['responseList'] = this.responseList!.map((v) => v.toJson()).toList();
    }
    data['totalQuestion'] = this.totalQuestion;
    data['maximumMarks'] = this.maximumMarks;
    data['category'] = this.category;
    return data;
  }
}

class ResponseList {
  int? id;
  int? rightOption;

  ResponseList({this.id, this.rightOption});

  ResponseList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rightOption = json['rightOption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rightOption'] = this.rightOption;
    return data;
  }
}
