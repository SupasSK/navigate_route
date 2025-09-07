import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/message_provider.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final msgFromDetail =
        context.watch<MessageProvider>().messageForHome ?? ''; // watch!!

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // โชว์ข้อความที่ได้รับจากหน้า Detail เหนือปุ่ม
            Text(
              msgFromDetail.isEmpty ? '' : msgFromDetail,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                // ส่งข้อความสำหรับให้ Detail ใช้แสดง
                context
                    .read<MessageProvider>()
                    .setMessageForDetail('this is data from home page');

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DetailScreen()),
                );
              },
              child: const Text('Go to Detail Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
