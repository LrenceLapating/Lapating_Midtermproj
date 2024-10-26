import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'HealthyUser';
  String gender = 'Select Gender';
  int age = 0;
  String address = '';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void _addDetails() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Enter your name"),
                ),
                DropdownButton<String>(
                  value: gender,
                  items: ['Select Gender', 'Male', 'Female', 'Other']
                      .map((value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                ),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(hintText: "Enter your age"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(hintText: "Enter your address"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  name = nameController.text.isNotEmpty ? nameController.text : name;
                  age = int.tryParse(ageController.text) ?? 0;
                  address = addressController.text.isNotEmpty ? addressController.text : address;
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 136, 127, 127),
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailText('Name: $name'),
            _buildDetailText('Gender: $gender'),
            _buildDetailText('Age: $age'),
            _buildDetailText('Address: $address'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              child: const Text('Add Details'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
