import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import '../modules/socketio.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage>
    with AutomaticKeepAliveClientMixin<ConnectionPage> {
  final remoteConfig = FirebaseRemoteConfig.instance;
  List messages = [];

  void onMessage(dynamic data) {
    setState(() {
      messages.add(data);
    });
  }

  @override
  void initState() {
    super.initState();

    SocketApi.socket.on('message', onMessage);
  }

  @override
  void dispose() {
    super.dispose();

    SocketApi.socket.off('message', onMessage);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(jsonEncode(messages[index])), // 메시지 리스트의 각 항목 출력
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
