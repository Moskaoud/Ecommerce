import 'package:flutter/material.dart';
import 'package:ecommerce/models/customer.dart';
import 'package:ecommerce/services/database_helper.dart';
import 'customer_profile_screen.dart';

class CustomerEntryScreen extends StatefulWidget {
  const CustomerEntryScreen({super.key});

  @override
  State<CustomerEntryScreen> createState() => _CustomerEntryScreenState();
}

class _CustomerEntryScreenState extends State<CustomerEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController(); // Added controller for address

  bool _showFirstChild = true;
  bool _isLoading = false;

  double _containerHeight = 180.0; // Adjusted for potentially more content
  Color _containerColor = Colors.blueGrey;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _containerHeight = 100.0;
        _containerColor = Colors.orangeAccent;
      });

      // Simulate network request or database operation (keep for demo)
      await Future.delayed(const Duration(seconds: 1)); 

      final customer = Customer(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text, // Added address
      );

      final dbHelper = DatabaseHelper(); // Corrected instantiation
      try {
        final id = await dbHelper.insertCustomer(customer);
        // print('Customer saved with id: \$id');

        setState(() {
          _isLoading = false;
          _showFirstChild = false; // Trigger crossfade to success message
        });

        // Wait a bit to show success, then navigate
        await Future.delayed(const Duration(milliseconds: 1500));

        if (!mounted) return; // Check if the widget is still in the tree

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerProfileScreen(customerId: id),
          ),
        );
      } catch (e) {
        // print('Error saving customer: \$e');
        if (!mounted) return;
        setState(() {
          _isLoading = false;
          _containerHeight = 180.0; 
          _containerColor = Colors.redAccent;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save customer: ${e.toString()}')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose(); // Disposed address controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Customer Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                height: _containerHeight,
                decoration: BoxDecoration(
                  color: _containerColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Customer Form',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter customer name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email address';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  // Add more specific phone validation if needed
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController, // Added address field
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter customer address';
                  }
                  return null;
                },
                maxLines: 2, // Allow for a slightly longer address
              ),
              const SizedBox(height: 30),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 400),
                firstChild: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  icon: _isLoading ? const SizedBox.shrink() : const Icon(Icons.save_alt_outlined),
                  label: _isLoading
                      ? const SizedBox(
                          height: 24, 
                          width: 24, 
                          child: CircularProgressIndicator(strokeWidth: 3, valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                        )
                      : const Text('Save Customer'),
                  onPressed: _isLoading ? null : _submitForm,
                ),
                secondChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle_outline, color: Colors.green, size: 60),
                      const SizedBox(height: 12),
                      Text('Customer Saved!', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.green, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                crossFadeState: _showFirstChild ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
