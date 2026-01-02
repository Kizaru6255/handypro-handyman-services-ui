import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// Chat screen
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('messages.chat'.tr()),
      ),
      body: Center(
        child: Text('messages.no_messages'.tr()),
      ),
    );
  }
}


