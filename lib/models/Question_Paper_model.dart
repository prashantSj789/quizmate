import 'dart:convert';

class Question_paper_model {
    List<QuestionList> questionList;
    int totalQuestion;
    String category;

    Question_paper_model({
        required this.questionList,
        required this.totalQuestion,
        required this.category,
    });

    factory Question_paper_model.fromRawJson(String str) => Question_paper_model.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Question_paper_model.fromJson(Map<String, dynamic> json) => Question_paper_model(
        questionList: List<QuestionList>.from(json["questionList"].map((x) => QuestionList.fromJson(x))),
        totalQuestion: json["totalQuestion"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "questionList": List<dynamic>.from(questionList.map((x) => x.toJson())),
        "totalQuestion": totalQuestion,
        "category": category,
    };
}

class QuestionList {
    int id;
    String question;
    String options1;
    String options2;
    String options3;
    String options4;
    String category;
    String topic;
    String marks;
    String difficulty;

    QuestionList({
        required this.id,
        required this.question,
        required this.options1,
        required this.options2,
        required this.options3,
        required this.options4,
        required this.category,
        required this.topic,
        required this.marks,
        required this.difficulty,
    });

    factory QuestionList.fromRawJson(String str) => QuestionList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
        id: json["id"],
        question: json["question"],
        options1: json["options1"],
        options2: json["options2"],
        options3: json["options3"],
        options4: json["options4"],
        category: json["category"],
        topic: json["topic"],
        marks: json["marks"],
        difficulty: json["difficulty"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "options1": options1,
        "options2": options2,
        "options3": options3,
        "options4": options4,
        "category": category,
        "topic": topic,
        "marks": marks,
        "difficulty": difficulty,
    };
}
