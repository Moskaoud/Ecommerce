import 'package:flutter/material.dart';
import 'package:ecommerce/models/customer.dart'; // Assuming this is the path
import 'package:ecommerce/services/database_helper.dart'; // Assuming this is the path

class CustomerProfileScreen1 extends StatefulWidget {
  final int customerId;

  const CustomerProfileScreen1({super.key, required this.customerId});

  @override
  State<CustomerProfileScreen1> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen1> {
  late Future<Customer?> _customerFuture;
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _customerFuture = dbHelper.getCustomerById(widget.customerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
                 Navigator.pop(context); 
            } else {
                // Fallback if no route to pop, e.g., navigate to entry screen
                // Navigator.pushReplacementNamed(context, '/customer_entry');
            } 
          },
        ),
      ),
      body: FutureBuilder<Customer?>(
        future: _customerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading profile: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Customer not found.'));
          }

          final customer = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView( // Added SingleChildScrollView for longer content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildProfileHeader(customer.name),
                  const SizedBox(height: 24),
                  _buildInfoCard(customer),
                  const SizedBox(height: 20),
                  // You can add more sections here, e.g., order history, etc.
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(String name) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).primaryColorLight,
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : 'C',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(Customer customer) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildInfoRow(Icons.email_outlined, 'Email', customer.email),
            const Divider(height: 25, thickness: 1),
            _buildInfoRow(Icons.phone_outlined, 'Phone', customer.phone),
            const Divider(height: 25, thickness: 1),
            _buildInfoRow(Icons.location_on_outlined, 'Address', customer.address), // Display address
            // Add more customer details here as needed
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: Theme.of(context).primaryColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey[700], fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
