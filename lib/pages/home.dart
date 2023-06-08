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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.shade300,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, 8),
                          color: Colors.pink.withOpacity(.4),
                          spreadRadius: -2,
                        )
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            '개폐 상태: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '닫힘',
                            style: TextStyle(
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
                const SizedBox(width: 10),
                Container(
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
                    onPressed: () {},
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
                    child: const Text('열기'),
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
                      title: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '기온',
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
                            '23',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'ppm',
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
                      title: const Row(
                        children: [
                          Text(
                            '센싱 하드웨어 연결',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5),
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
                        children: [
                          Text(
                            '액션 하드웨어 연결',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5),
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
                        children: [
                          Text(
                            '서버 및 DB',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5),
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
}
