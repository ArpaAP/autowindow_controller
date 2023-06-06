import 'package:flutter/material.dart';

import '../widgets/dashboard_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                      title: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '온도',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            '16',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '℃',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.thermostat),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
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
                            '습도',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            '33',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '%',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.cloud),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
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
                            '강우',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            '비 내리지 않음',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.water_drop),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 24),
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
                      title: const Row(
                        children: [
                          Text(
                            '센싱 하드웨어 연결',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.5
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            '정상',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.wifi),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
                        children: [
                          Text(
                            '액션 하드웨어 연결',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            '정상',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.wifi),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
                        children: [
                          Text(
                            '서버 및 DB',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            '정상',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                      tileColor: const Color.fromRGBO(242, 244, 245, 1),
                      onTap: () {},
                      leading: const Icon(Icons.wifi),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
}
