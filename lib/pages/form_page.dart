import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  static const String routeName = '/form';

  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final designationController = TextEditingController();
  final companyController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        actions: [
          IconButton(onPressed: _saveContact, icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          children: [
            TextFormField(
              controller: nameController,

              // onChanged: (value)
              // {
              //
              // },
            )
          ],
        ),
      ),
    );
  }

  void _saveContact() {}

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    designationController.dispose();
    websiteController.dispose();
    addressController.dispose();
    companyController.dispose();
    super.dispose();
  }
}
