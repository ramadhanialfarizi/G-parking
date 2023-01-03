import 'package:flutter/material.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final formKey = GlobalKey<FormState>();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var phoneNumber = TextEditingController();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Edit Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                    child: FittedBox(
                      child: Icon(
                        Icons.account_circle,
                        //size: 100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Upload picture'),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          const Color.fromARGB(255, 0, 204, 240), // Text Color
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'First name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: firstName,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 224, 224, 224),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* please input your first name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Last name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          //style: TextStyle(fontSize: 10),
                          controller: lastName,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 224, 224, 224),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* please input your last name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Email ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '*you can\'t change your email',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: email,
                          readOnly: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 224, 224, 224),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* please input your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: phoneNumber,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 224, 224, 224),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '* please input your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 0.0,
        child: SizedBox(
          height: 60,
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150,
        child: FloatingActionButton.extended(
          icon: Icon(Icons.check),
          label: const Text(
            'Save',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 204, 240),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () {
            final loginValid = formKey.currentState!.validate();

            if (loginValid) {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Edit Saved'),
                  duration: Duration(milliseconds: 800),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
