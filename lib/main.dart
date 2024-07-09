import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/views/providers/chat_provider.dart';
import 'package:yes_no_app/views/widgets/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:  [
        ChangeNotifierProvider<ChatProvider>(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Yes/No App",
        
        debugShowCheckedModeBanner: false,
        theme: MyAppTheme(selectedColor: 1).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
