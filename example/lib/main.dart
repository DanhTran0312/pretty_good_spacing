import 'package:flutter/material.dart';
import 'package:pretty_good_spacing/pretty_good_spacing.dart';

void main() {
  // Initialize with custom spacing unit (optional)
  Space.initialize(spacingUnit: 8.0);
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pretty Good Spacing Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pretty Good Spacing'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: Space.space200.all, // 16px padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with bottom margin
            Container(
              padding: Space.space150.all, // 12px padding
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Spacing System Demo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            KGap.space300(), // 24px gap
            // Examples section
            const Text(
              'EdgeInsets Extensions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            KGap.space150(), // 12px gap
            // Example cards with different spacing
            _buildExampleCard(
              title: 'Small Spacing (space100)',
              padding: Space.space100.all, // 8px
              color: Colors.green.shade50,
            ),

            KGap.space100(), // 8px gap

            _buildExampleCard(
              title: 'Medium Spacing (space200)',
              padding: Space.space200.all, // 16px
              color: Colors.orange.shade50,
            ),

            KGap.space100(), // 8px gap

            _buildExampleCard(
              title: 'Large Spacing (space400)',
              padding: Space.space400.all, // 32px
              color: Colors.purple.shade50,
            ),

            KGap.space300(), // 24px gap

            const Text(
              'Gap Widgets:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            KGap.space150(), // 12px gap

            Container(
              padding: Space.space200.all,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Item 1'),
                  KGap.space50(), // 4px gap
                  const Text('Item 2'),
                  KGap.space100(), // 8px gap
                  const Text('Item 3'),
                  KGap.space200(), // 16px gap
                  const Text('Item 4'),
                ],
              ),
            ),

            KGap.space400(), // 32px gap
            // Spacing values showcase
            const Text(
              'Available Spacing Values:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            KGap.space150(),

            _buildSpacingShowcase(),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard({
    required String title,
    required EdgeInsets padding,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildSpacingShowcase() {
    final spacingValues = [
      ('space25', Space.space25),
      ('space50', Space.space50),
      ('space100', Space.space100),
      ('space150', Space.space150),
      ('space200', Space.space200),
      ('space300', Space.space300),
      ('space400', Space.space400),
      ('space500', Space.space500),
    ];

    return Container(
      padding: Space.space200.all,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: spacingValues
            .map(
              (item) => Padding(
                padding: Space.space50.vertical,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        item.$1,
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                    ),
                    Text(' = ${item.$2}px'),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
