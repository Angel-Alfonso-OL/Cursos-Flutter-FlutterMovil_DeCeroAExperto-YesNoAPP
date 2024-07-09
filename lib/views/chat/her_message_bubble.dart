import 'package:flutter/material.dart';
import 'package:yes_no_app/model/entity/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _ImageBubble(
          url: message.imageURL!,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String url;

  const _ImageBubble({required this.url});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        url,
        width: screenSize.width * 0.7,
        height: 150,
        loadingBuilder: (context, child, loadingProgress) {
          return (loadingProgress == null)
              ? child
              : SizedBox(
                  width: screenSize.width * 0.7,
                  height: 150,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
