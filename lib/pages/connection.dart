import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final remoteConfig = FirebaseRemoteConfig.instance;

  @override
  Widget build(BuildContext context) {
    return Text(remoteConfig.getString('backend_host'));
  }
}
