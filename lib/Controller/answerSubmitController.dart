import 'package:flutter/material.dart';

import '../CustomHttpClass/custom_http_class.dart';

class AnswerSubmitController with ChangeNotifier{


  ///   AnswerSubmitController ///
  dynamic answerSubmitdata;
  AnswerSubmitProvider(
      BuildContext context,
      String mocktest_id,
      String mocktest_question_id,
      String answer,
      String question_set,
      )async{
    answerSubmitdata= await CustomHttp().AnswerSubmitProviderCustomHttpRequest(
        context,
        mocktest_id,
        mocktest_question_id,
        answer,
        question_set,
    );
    notifyListeners();
  }



}