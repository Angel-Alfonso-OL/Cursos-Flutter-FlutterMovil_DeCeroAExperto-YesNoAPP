import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/model/entity/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrolController = ScrollController();
  final getYesNoAnswer = GetYesNoAnsers();
  List<Message> messages = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    if (text.endsWith("?")) {
      herReply();
    }
    notifyListeners();
    moveScrollToButton();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToButton();
  }

  Future<void> moveScrollToButton() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrolController.animateTo(
      chatScrolController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
