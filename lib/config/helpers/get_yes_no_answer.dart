import 'package:dio/dio.dart';
import 'package:yes_no_app/model/ORM/yes_no_model.dart';
import 'package:yes_no_app/model/entity/message.dart';

class GetYesNoAnsers {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    return yesNoModel.toMessageEntitt();
  }
}
