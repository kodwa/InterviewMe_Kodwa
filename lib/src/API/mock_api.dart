import 'dart:async';

import 'dart:convert' as convert;

import 'package:frideos_core/frideos_core.dart';

import '../models/category.dart';
import '../models/question.dart';

import 'api_interface.dart';

class MockAPI implements QuestionsAPI {
  @override
  Future<bool> getCategories(StreamedList<Category> categories) async {
    categories.value = [];

    categories.addElement(
      Category(id: 1, name: 'Domaine 1'),
    );
    categories.addElement(
      Category(id: 2, name: 'Domaine 2'),
    );
    return true;
  }

  @override
  Future<bool> getQuestions(
      {StreamedList<Question> questions,
      int number,
      Category category,
      QuestionDifficulty difficulty,
      QuestionType type}) async {
    var qdifficulty;
    var qcategoriy;
    switch (difficulty) {
      case QuestionDifficulty.easy:
        qdifficulty = 'easy';
        break;
      case QuestionDifficulty.medium:
        qdifficulty = 'medium';
        break;
      case QuestionDifficulty.hard:
        qdifficulty = 'hard';
        break;
      default:
        qdifficulty = 'medium';
        break;
    }
    switch (category.id) {
      case 1:
        qcategoriy = 'Domaine1';
        break;
      case 2:
        qcategoriy = 'Domaine2';
        break;

    }

    const json00 =
        "{\"response_code\":0,"
        "\"results\":[""{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"What is Flutter?\",\"correct_answer\":\"Allows to build native apps for desktop web and mobile from a single codebase\",\"incorrect_answers\":[\"It uses JavaScript to create mobile apps.\",\"It is first introduced by Facebook.\",\"Uses Flux and Redux architecture\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"What is Dart?\",\"correct_answer\":\"Language that can be compiled both AOT and JIT \",\"incorrect_answers\":[\"Language that can be compiled only AOT \",\"Language that can be compiled only JIT \",\"Make Flutter  need for a separate declarative layout language like XML and JSX\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"What is a widget ?\",\"correct_answer\":\"Widgets are basically the UI components in Flutter\",\"incorrect_answers\":[\"There are three types of widgets in Flutter\",\"It is the project's configuration file\",\"It doesn't describe the user interface.\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"How many types of widgets are there in Flutter?\",\"correct_answer\":\"2\",\"incorrect_answers\":[\"1\",\"5\",\"3\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"The Stateful widgets\",\"correct_answer\":\"A widget that allows us to refresh the screen \",\"incorrect_answers\":[\"Does not have any state information\",\"This widget have a build method.\",\"The screen or widget contains static content\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"The Stateless widgets\",\"correct_answer\":\"Does not have any state information\",\"incorrect_answers\":[\"Has state information\",\"Checkbox, Radio, Slider, InkWell, Form, and TextField are Stateless widget\",\"This widget has createState method\"]}"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"What are the different build modes in Flutter?\",\"correct_answer\":\"Debug Profile and Release\",\"incorrect_answers\":[\"Profile and Release\",\"Debug and Profile\",\"Debug and Release \"]}"
        "]}";

    const json01 =
        "{\"response_code\":0,"
        "\"results\":[""{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q0?medium\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q1?medium\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q2?medium\",\"correct_answer\":\"40\",\"incorrect_answers\":[\"60\",\"15\",\"90\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q3?medium\",\"correct_answer\":\"The Flash\",\"incorrect_answers\":[\"The Arrow\",\"Black Canary\",\"Daredevil\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q4?medium\",\"correct_answer\":\"Miranda Wright\",\"incorrect_answers\":[\"Dick Tracy\",\"Eddie Valiant\",\"Dr. Ludwig von Drake\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q5??medium\",\"correct_answer\":\"3\",\"incorrect_answers\":[\"2\",\"4\",\"1\"]}"
        "]}";
    const json02 =
        "{\"response_code\":0,"
        "\"results\":["
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q0?hard\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q1?hard\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q2?hard\",\"correct_answer\":\"40\",\"incorrect_answers\":[\"60\",\"15\",\"90\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q3?hard\",\"correct_answer\":\"The Flash\",\"incorrect_answers\":[\"The Arrow\",\"Black Canary\",\"Daredevil\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q4?hard\",\"correct_answer\":\"Miranda Wright\",\"incorrect_answers\":[\"Dick Tracy\",\"Eddie Valiant\",\"Dr. Ludwig von Drake\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q5??hard\",\"correct_answer\":\"3\",\"incorrect_answers\":[\"2\",\"4\",\"1\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q6?hard\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q7?hard\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q8?hard\",\"correct_answer\":\"40\",\"incorrect_answers\":[\"60\",\"15\",\"90\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q9?hard\",\"correct_answer\":\"The Flash\",\"incorrect_answers\":[\"The Arrow\",\"Black Canary\",\"Daredevil\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q10?hard\",\"correct_answer\":\"Miranda Wright\",\"incorrect_answers\":[\"Dick Tracy\",\"Eddie Valiant\",\"Dr. Ludwig von Drake\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q11??hard\",\"correct_answer\":\"3\",\"incorrect_answers\":[\"2\",\"4\",\"1\"]}"
        "]}";
    const json1 =
        "{\"response_code\":0,\"results\":"
        "[""{\"category\":\"Domaine2\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"What is the largest organ of the human body?\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine2\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"In Roman Numerals, what does XL equate to?\",\"correct_answer\":\"40\",\"incorrect_answers\":[\"60\",\"15\",\"90\"]},"
        "{\"category\":\"Domaine2\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"Grant Gustin plays which superhero on the CW show of the same name?\",\"correct_answer\":\"The Flash\",\"incorrect_answers\":[\"The Arrow\",\"Black Canary\",\"Daredevil\"]},"
        "{\"category\":\"Domaine2\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"In the 1993 Disney animated series, what is the name of Bonker\'s second partner?\",\"correct_answer\":\"Miranda Wright\",\"incorrect_answers\":[\"Dick Tracy\",\"Eddie Valiant\",\"Dr. Ludwig von Drake\"]},"
        "{\"category\":\"Domaine2\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"How many countries does Mexico border?\",\"correct_answer\":\"3\",\"incorrect_answers\":[\"2\",\"4\",\"1\"]}"
        "]}";
    const json11 =
        "{\"response_code\":0,"
        "\"results\":[""{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q0?medium\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q1?medium\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q2?medium\",\"correct_answer\":\"40\",\"incorrect_answers\":[\"60\",\"15\",\"90\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q3?medium\",\"correct_answer\":\"The Flash\",\"incorrect_answers\":[\"The Arrow\",\"Black Canary\",\"Daredevil\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q4?medium\",\"correct_answer\":\"Miranda Wright\",\"incorrect_answers\":[\"Dick Tracy\",\"Eddie Valiant\",\"Dr. Ludwig von Drake\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"q5??medium\",\"correct_answer\":\"3\",\"incorrect_answers\":[\"2\",\"4\",\"1\"]}"
        "]}";
    const json12 =
        "{\"response_code\":0,"
        "\"results\":["
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q0?hard\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q1?hard\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q2?hard\",\"correct_answer\":\"40\",\"incorrect_answers\":[\"60\",\"15\",\"90\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q3?hard\",\"correct_answer\":\"The Flash\",\"incorrect_answers\":[\"The Arrow\",\"Black Canary\",\"Daredevil\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q4?hard\",\"correct_answer\":\"Miranda Wright\",\"incorrect_answers\":[\"Dick Tracy\",\"Eddie Valiant\",\"Dr. Ludwig von Drake\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q5??hard\",\"correct_answer\":\"3\",\"incorrect_answers\":[\"2\",\"4\",\"1\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q6?hard\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q7?hard\",\"correct_answer\":\"Skin\",\"incorrect_answers\":[\"Heart\",\"large Intestine\",\"Liver\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q8?hard\",\"correct_answer\":\"40\",\"incorrect_answers\":[\"60\",\"15\",\"90\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q9?hard\",\"correct_answer\":\"The Flash\",\"incorrect_answers\":[\"The Arrow\",\"Black Canary\",\"Daredevil\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q10?hard\",\"correct_answer\":\"Miranda Wright\",\"incorrect_answers\":[\"Dick Tracy\",\"Eddie Valiant\",\"Dr. Ludwig von Drake\"]},"
        "{\"category\":\"Domaine1\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"q11??hard\",\"correct_answer\":\"3\",\"incorrect_answers\":[\"2\",\"4\",\"1\"]}"
        "]}";
     if(qcategoriy == 'Domaine1'){
       switch (qdifficulty) {
         case 'easy':
           final jsonResponse = convert.jsonDecode(json00);
           final result = (jsonResponse['results'] as List)
               .map((question) => QuestionModel.fromJson(question));
           questions.value =
               result.map((question) => Question.fromQuestionModel(question)).toList();
           break;
         case 'medium':
           final jsonResponse = convert.jsonDecode(json01);
           final result = (jsonResponse['results'] as List)
               .map((question) => QuestionModel.fromJson(question));
           questions.value =
               result.map((question) => Question.fromQuestionModel(question)).toList();
           break;
         case 'hard':
           final jsonResponse = convert.jsonDecode(json02);
           final result = (jsonResponse['results'] as List)
               .map((question) => QuestionModel.fromJson(question));
           questions.value =
               result.map((question) => Question.fromQuestionModel(question)).toList();
           break;
         default:
           final jsonResponse = convert.jsonDecode(json01);
           final result = (jsonResponse['results'] as List)
               .map((question) => QuestionModel.fromJson(question));
           questions.value =
               result.map((question) => Question.fromQuestionModel(question)).toList();
           break;
       }





     }
     else{
       switch (qdifficulty) {
         case 'easy':
           final jsonResponse = convert.jsonDecode(json1);
           final result = (jsonResponse['results'] as List)
               .map((question) => QuestionModel.fromJson(question));
           questions.value =
               result.map((question) => Question.fromQuestionModel(question)).toList();
           break;
         case 'medium':
           final jsonResponse = convert.jsonDecode(json11);
           final result = (jsonResponse['results'] as List)
               .map((question) => QuestionModel.fromJson(question));
           questions.value =
               result.map((question) => Question.fromQuestionModel(question)).toList();
           break;
         case 'hard':
           final jsonResponse = convert.jsonDecode(json12);
           final result = (jsonResponse['results'] as List)
               .map((question) => QuestionModel.fromJson(question));
           questions.value =
               result.map((question) => Question.fromQuestionModel(question)).toList();
           break;
         default:
           final jsonResponse = convert.jsonDecode(json11);
           final result = (jsonResponse['results'] as List)
               .map((question) => QuestionModel.fromJson(question));
           questions.value =
               result.map((question) => Question.fromQuestionModel(question)).toList();
           break;}

     }



    return true;
  }
}
