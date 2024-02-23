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
  final formKey = GlobalKey<FormState>();

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
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Contact Name*',
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  if (value.length > 30) {
                    return 'Name should not be more than 30 characters';
                  }
                  return null;
                },

                // onChanged: (value)
                // {
                //
                // },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: mobileController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  labelText: 'Mobile Number*',
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },

              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email Address',
                  filled: true,
                ),


              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                controller: companyController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.label),
                  labelText: 'Company Name',
                  filled: true,
                ),

              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                controller: designationController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.label),
                  labelText: 'Designation',
                  filled: true,
                ),


              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  labelText: 'Street Address',
                  filled: true,
                ),

              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.url,
                controller: websiteController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.web),
                  labelText: 'Website',
                  filled: true,
                ),

              ),
            )






          ],
        ),
      ),
    );
  }

  void _saveContact() {
    if(formKey.currentState!.validate()){

    }

  }

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
