import 'package:quiz_app/models/Question_Paper_model.dart';
import 'package:quiz_app/repository/Qestion_repo.dart';

class QuestionView {
  Future<Question_paper_model> fetchquestionfromapi() async {
   
    QuestionRepository repo = QuestionRepository();
    return repo.fetchquestion();
  } 
}
