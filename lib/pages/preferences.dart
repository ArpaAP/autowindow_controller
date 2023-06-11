import 'package:flutter/material.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
        decelerationRate: ScrollDecelerationRate.fast,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Text(
              '기온 조건 설정',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (newValue) {},
            ),
            Expanded(
              child: TextFormField(
                initialValue: '10',
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1),
                  ),
                  suffixText: '℃',
                  suffixStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    wordSpacing: -1,
                  ),
                ),
                cursorHeight: 14,
              ),
            ),
            const SizedBox(width: 8),
            const Text('이하일 때 자동으로 창문 닫기'),
          ],
        ),
        const Divider(height: 0, thickness: 0.5),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (newValue) {},
            ),
            Expanded(
              child: TextFormField(
                initialValue: '30',
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1),
                  ),
                  suffixText: '℃',
                  suffixStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    wordSpacing: -1,
                  ),
                ),
                cursorHeight: 14,
              ),
            ),
            const SizedBox(width: 8),
            const Text('이상일 때 자동으로 창문 닫기'),
          ],
        ),
        const Divider(height: 0, thickness: 0.5),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text(
            '기온이 적당할 때 자동으로 창문 열기',
            style: TextStyle(fontSize: 14),
          ),
          dense: true,
          leading: Checkbox(
            value: true,
            onChanged: (newValue) {},
          ),
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 2,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '습도 조건 설정',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (newValue) {},
            ),
            Expanded(
              child: TextFormField(
                initialValue: '60',
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1),
                  ),
                  suffixText: '%',
                  suffixStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    wordSpacing: -1,
                  ),
                ),
                cursorHeight: 14,
              ),
            ),
            const SizedBox(width: 8),
            const Text('이상일 때 자동으로 창문 닫기'),
          ],
        ),
        const Divider(height: 0, thickness: 0.5),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text(
            '습도가 적당할 때 자동으로 창문 열기',
            style: TextStyle(fontSize: 14),
          ),
          dense: true,
          leading: Checkbox(
            value: true,
            onChanged: (newValue) {},
          ),
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 2,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '강우 조건 설정',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 5),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text(
            '빗물이 감지되었을 때 자동으로 창문 닫기',
            style: TextStyle(fontSize: 14),
          ),
          dense: true,
          leading: Checkbox(
            value: true,
            onChanged: (newValue) {},
          ),
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 2,
        ),
        const Divider(height: 0, thickness: 0.5),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text(
            '빗물이 감지되지 않았을 때 자동으로 창문 열기',
            style: TextStyle(fontSize: 14),
          ),
          dense: true,
          leading: Checkbox(
            value: true,
            onChanged: (newValue) {},
          ),
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 2,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '미세먼지 조건 설정',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (newValue) {},
            ),
            Expanded(
              child: TextFormField(
                initialValue: '200',
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1),
                  ),
                  suffixText: 'ppm',
                  suffixStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    wordSpacing: -1,
                  ),
                ),
                cursorHeight: 14,
              ),
            ),
            const SizedBox(width: 8),
            const Text('이상일 때 자동으로 창문 닫기'),
          ],
        ),
        const Divider(height: 0, thickness: 0.5),
      ],
    );
  }
}
