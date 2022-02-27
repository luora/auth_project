import 'package:auth_project/choice_chips.dart';
import 'package:auth_project/select_image.dart';
import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class RegisterServiceProvider extends StatefulWidget {
  const RegisterServiceProvider({Key? key}) : super(key: key);

  @override
  _RegisterServiceProviderState createState() => _RegisterServiceProviderState();
}

class _RegisterServiceProviderState extends State<RegisterServiceProvider> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _spNameController = TextEditingController();
  final TextEditingController _spDescriptionController = TextEditingController();
  final TextEditingController _spPhoneNumberController = TextEditingController();
   final TextEditingController _spEmailController = TextEditingController();

  List<String> serviceChoices = ['barber', 'loctacian', 'saloonist', 'nail technician', 'beauty therapist', 'make up artist'];
  List<String> tags = [];

  //final TextEditingController _spNameController = TextEditingController();

  // 1. add profile logo
  // 2. add business photos
  // 3. add conta

  bool locSelectState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('wanna work with us ', style: TextStyle(fontStyle: FontStyle.italic)),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _spNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter a valid name for your business';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          enabled: true,
                          labelText: 'business name',
                          hintText: 'e.g moran barbers'),
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _spDescriptionController,
                      validator: (value) {},
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          enabled: true,
                          labelText: 'business description',
                          hintText: 'e.g we make your hair look good ... '),
                    ),
                  ),
          
                  MultiSelectChip(
                    serviceList: serviceChoices,
                    onSelectionChnaged: (List<String> choices) {
                      print(choices);
                    },
                  ),
          
                  // insert error widget
          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _spPhoneNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter a valid phone number for your business';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          enabled: true,
                          labelText: 'business contact number',
                          prefixIcon: const Icon(Icons.local_phone),
                          hintText: '+2547_________'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _spPhoneNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter a valid email for your business';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          enabled: true,
                          labelText: 'business contact email address',
                          prefixIcon: const Icon(Icons.email),
                          hintText: ''),
                    ),
                  ),
          
                  // Icon(Icons.camera), 
                  PickServiceImages()
          
          
          
          
          
                ])),
          ),
        ));
  }
}
