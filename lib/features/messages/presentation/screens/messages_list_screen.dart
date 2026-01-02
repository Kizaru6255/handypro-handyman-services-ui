import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// Messages list screen
class MessagesListScreen extends StatelessWidget {
  const MessagesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('messages.title'.tr()),
      ),
      body: Center(
        child: Text('messages.no_messages'.tr()),
      ),
    );
  }
}


