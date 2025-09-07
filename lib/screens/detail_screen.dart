import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final itemId = args?['id'] ?? 'N/A';
    final title  = args?['title'] ?? 'No title';

    return Scaffold(
      appBar: AppBar(title: Text('Detail: $itemId')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Title: $title'),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'DONE:$itemId'),
              child: const Text('ส่งผลลัพธ์และย้อนกลับ'),
            ),

            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ย้อนกลับ (ไม่ส่งค่า)'),
            ),
          ],
        ),
      ),
    );
  }
}
