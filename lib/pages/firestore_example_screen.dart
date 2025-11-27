
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreExampleScreen extends StatefulWidget {
  const FirestoreExampleScreen({super.key});

  @override
  State<FirestoreExampleScreen> createState() => _FirestoreExampleScreenState();
}

class _FirestoreExampleScreenState extends State<FirestoreExampleScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _addInitialData();
  }

  Future<void> _addInitialData() async {
    final collection = _firestore.collection('users');
    final snapshot = await collection.get();
    if (snapshot.docs.isEmpty) {
      final random = Random();
      for (int i = 0; i < 15; i++) {
        await collection.add({
          'name': 'User ${i + 1}',
          'age': 18 + random.nextInt(18),
        });
      }
    }
  }

  Future<void> _addRecord() async {
    if (_nameController.text.isNotEmpty && _ageController.text.isNotEmpty) {
      await _firestore.collection('users').add({
        'name': _nameController.text,
        'age': int.parse(_ageController.text),
      });
      _nameController.clear();
      _ageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addRecord,
              child: const Text('Add Record'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final users = snapshot.data!.docs;
                  final group1 = users.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return data['age'] >= 18 && data['age'] <= 20;
                  }).toList();
                  final group2 = users.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return data['age'] >= 21 && data['age'] <= 35;
                  }).toList();

                  return ListView(
                    children: [
                      _buildGroup('Ages 18-20', group1),
                      _buildGroup('Ages 21-35', group2),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroup(String title, List<QueryDocumentSnapshot> documents) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ...documents.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ListTile(
            title: Text(data['name']),
            subtitle: Text('Age: ${data['age']}'),
          );
        }).toList(),
        const Divider(),
      ],
    );
  }
}
