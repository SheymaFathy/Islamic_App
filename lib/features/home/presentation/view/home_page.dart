import 'package:flutter/material.dart';
import 'package:islamic_app/features/azkar/presentation/view/azkar_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdhkarCategoryScreen(),
                  ),
                );
              },
              child: const Text('الأذكار'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const QuranScreen()),
                // );
              },
              child: const Text('القرآن الكريم'),
            ),
          ],
        ),
      ),
    );
  }
}
