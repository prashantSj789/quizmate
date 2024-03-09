import 'package:quiz_app/models/Question_Paper_model.dart';
import 'package:quiz_app/repository/Qestion_repo.dart';

class QuestionView {
  Future<dynamic> fetchQuestionfromapi(String category1,int e1,int m1,int h1) async{
  QuestionRepository repo = new QuestionRepository();
   return repo.fetchquestion(category1, e1, m1, h1);
  }
}