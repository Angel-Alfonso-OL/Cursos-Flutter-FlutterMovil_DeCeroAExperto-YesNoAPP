import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      textCapitalization: TextCapitalization.sentences,
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
        hintText: "Message",
        filled: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            onValue(textController.value.text);
            textController.clear();
          },
        ),
      ),
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
