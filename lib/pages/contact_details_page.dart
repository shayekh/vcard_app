import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcard_app/providers/contact_provider.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName = '/details';
  const ContactDetailsPage({super.key});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  int id =0;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    id = ModalRoute.of(context)?.settings.arguments as int;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => FutureBuilder(
            future: provider.getContactByIdP(id),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                final contact = snapshot.data!;
                return ListView(
                  children: [
                    Image.asset(contact.image, width: double.infinity, height: 250, fit: BoxFit.cover,),
                    ListTile(
                      title: Text(contact.name),
                    ),
                    ListTile(
                      title: Text(contact.mobile),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: (){
                                _smsContact(contact.mobile);
                              },
                              icon: const Icon(Icons.sms),
                          ),
                          IconButton(
                              onPressed: (){
                                _callContact(contact.mobile);
                              },
                              icon: const Icon(Icons.call),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
              if(snapshot.hasError){
                return const Center(child: Text('Failed to fetch data'),);
              }
              return const Center(child: Text('Please wait'),);
            },),
      ),
    );
  }

  void _smsContact(String mobile) {
    final url = 'sms:$mobile';
  }

  void _callContact(String mobile) {}
}
