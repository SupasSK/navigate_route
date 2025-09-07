import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _goBasic(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const DetailScreen()),
    );

    if (!context.mounted) return;
    final msg = (result == null || result.isEmpty) ? 'No result' : 'Result: $result';
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> _goNamed(BuildContext context) async {
    final result = await Navigator.pushNamed(
      context,
      DetailScreen.routeName,
      arguments: <String, String>{
        'id': 'ARG-789',
        'title': 'ไปแบบ Named Route Args',
      },
    );

    if (!context.mounted) return;
    final msg = (result is String && result.isNotEmpty) ? result : 'No result';
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeScreen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => _goBasic(context),
              child: const Text('ไปหน้าสอง (Basic Push + await)'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => _goNamed(context),
              child: const Text('ไปหน้าสอง (Named Route + args + await)'),
            ),
          ],
        ),
      ),
    );
  }
}
