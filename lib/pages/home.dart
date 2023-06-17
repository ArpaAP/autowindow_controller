import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_common/src/util/event_emitter.dart';

import '../modules/socketio.dart';
import '../widgets/dashboard_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  num? temperature;
  num? humidity;
  num? waterLevel;
  bool? windowOpen;
  bool isProcessingOpenClosed = false;

  void onSensorMeasurementsUpdated(dynamic data) {
    setState(() {
      temperature = data['temperature'];
      humidity = data['humidity'];
      waterLevel = data['waterLevel'];
    });
  }

  void onActuatorStateUpdated(dynamic data) {
    setState(() {
      windowOpen = data['set'];
    });
  }

  void forceRebuild(dynamic data) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    SocketApi.socket.on(
      'sensorMeasurementsUpdated',
      onSensorMeasurementsUpdated,
    );
    SocketApi.socket.on(
      'actuatorStateUpdated',
      onActuatorStateUpdated,
    );
    SocketApi.socket.onConnect(forceRebuild);
    SocketApi.socket.onReconnect(forceRebuild);
    SocketApi.socket.onError(forceRebuild);

    SocketApi.socket.emitWithAck('getActuatorState', null, ack: (data) {
      setState(() {
        windowOpen = data['data']['set'];
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    SocketApi.socket.off(
      'sensorMeasurementsUpdated',
      onSensorMeasurementsUpdated,
    );
    SocketApi.socket.off(
      'actuatorStateUpdated',
      onActuatorStateUpdated,
    );
    SocketApi.socket.offAny(forceRebuild as AnyEventHandler?);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
        decelerationRate: ScrollDecelerationRate.fast,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      color: switch (windowOpen) {
                        true => Colors.teal.shade400,
                        false => Colors.pink.shade300,
                        null => Colors.grey
                      },
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, 8),
                          color: switch (windowOpen) {
                            true => Colors.teal.withOpacity(.4),
                            false => Colors.pink.withOpacity(.4),
                            null => Colors.grey.withOpacity(.4)
                          },
                          spreadRadius: -2,
                        )
                      ],
                    ),
                    duration: const Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      child: Row(
                        children: [
                          const Text(
                            '개폐 상태: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            switch (windowOpen) {
                              true => '열림',
                              false => '닫힘',
                              null => '불러오는 중'
                            },
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: windowOpen != null,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.shade200,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, 8),
                          color: Colors.deepPurpleAccent.withOpacity(.4),
                          spreadRadius: -2,
                        )
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (windowOpen == null) return;

                        SocketApi.socket
                            .emit('updateActuatorState', {'set': !windowOpen!});
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text(switch (windowOpen) {
                        true => '닫기',
                        false => '열기',
                        null => '-'
                      }),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            DashboardCard(
              title: '센서 정보',
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '기온',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            temperature != null ? temperature.toString() : '-',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            '℃',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.thermostat),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      dense: true,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '습도',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            humidity != null ? humidity.toString() : '-',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            '%',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.cloud),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      dense: true,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '강우',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            waterLevel != null ? waterLevel.toString() : '-',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.water_drop),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      dense: true,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '미세먼지',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ' ppm',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.blur_on),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      dense: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            DashboardCard(
              title: '시스템 커넥션 상태',
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Row(
                        children: [
                          const Text(
                            '센싱 하드웨어 연결',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            SocketApi.socket.connected ? '정상' : '연결 끊김',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: SocketApi.socket.connected
                                  ? Colors.deepPurple
                                  : Colors.pink,
                            ),
                          ),
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.wifi),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      dense: true,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Row(
                        children: [
                          const Text(
                            '액션 하드웨어 연결',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            SocketApi.socket.connected ? '정상' : '연결 끊김',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: SocketApi.socket.connected
                                  ? Colors.deepPurple
                                  : Colors.pink,
                            ),
                          ),
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.wifi),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      dense: true,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Row(
                        children: [
                          const Text(
                            '백엔드 서버 소켓 연결',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            SocketApi.socket.connected ? '연결됨' : '연결 끊김',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: SocketApi.socket.connected
                                  ? Colors.deepPurple
                                  : Colors.pink,
                            ),
                          ),
                        ],
                      ),
                      subtitle: SocketApi.socket.connected
                          ? null
                          : const Text('재연결 시도 중...'),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: Icon(
                        SocketApi.socket.connected
                            ? Icons.wifi
                            : Icons.wifi_off,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      dense: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
