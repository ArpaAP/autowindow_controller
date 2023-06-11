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
  List<String> messages = [];

  void onMessage(dynamic data) {
    print('asdf');
    setState(() {
      messages.add(data.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    print('aa');

    SocketApi.socket.on('message', onMessage);
  }

  @override
  void dispose() {
    super.dispose();
    print('dis');

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
              title: Text(messages[index]), // 메시지 리스트의 각 항목 출력
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
