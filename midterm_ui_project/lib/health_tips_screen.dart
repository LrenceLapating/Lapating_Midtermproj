import 'package:flutter/material.dart';

class HealthTipsScreen extends StatefulWidget {
  const HealthTipsScreen({super.key});

  @override
  _HealthTipsScreenState createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
  final List<Map<String, dynamic>> healthTips = [
    {'tip': 'Drink at least 8 glasses of water a day.', 'isDone': false},
    {'tip': 'Exercise regularly for at least 30 minutes.', 'isDone': false},
    {'tip': 'Maintain a balanced diet with fruits and vegetables.', 'isDone': false},
    {'tip': 'Get 7-9 hours of sleep each night.', 'isDone': false},
  ];

  void _toggleTipDone(int index) {
    setState(() {
      healthTips[index]['isDone'] = !healthTips[index]['isDone'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Tips'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: healthTips.length,
        itemBuilder: (context, index) {
          final tip = healthTips[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const Icon(Icons.favorite, color: Colors.teal),
              title: Text(tip['tip'], style: const TextStyle(fontSize: 18)),
              trailing: IconButton(
                icon: Icon(
                  tip['isDone'] ? Icons.check_circle : Icons.check_circle_outline,
                  color: tip['isDone'] ? Colors.green : Colors.grey,
                ),
                onPressed: () => _toggleTipDone(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
