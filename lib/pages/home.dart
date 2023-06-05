import 'package:flutter/material.dart';

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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 8),
                    color: Colors.grey.withOpacity(.2),
                    spreadRadius: -2,
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '센서 대시보드',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        Card(
                          elevation: 0,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white, width: 1),
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            horizontalTitleGap: 6,
                          ),
                        ),
                        Card(
                          elevation: 0,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            title: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '상대습도',
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
                            leading: const Icon(Icons.water_drop),
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                            horizontalTitleGap: 6,
                          ),
                        ),
                        Card(
                          elevation: 0,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white, width: 1),
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
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                            horizontalTitleGap: 6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(height: 2),
          ],
        ),
      ),
    );
  }
}
