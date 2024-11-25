import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goatmitra/view/pages/HomePage.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController currentAddressController = TextEditingController();
    TextEditingController permanentAddressController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController nationalityController = TextEditingController();
    TextEditingController ptypeController = TextEditingController();
    TextEditingController purposeController = TextEditingController();
    TextEditingController occupationController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Nominee Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Email Address'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Address.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: dateController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Date of Birth'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your DOB.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Current Phone Number'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Phone number.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: currentAddressController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Current Address'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Address.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: permanentAddressController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Permanent Address'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Address.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: genderController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Gender'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your gender.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: nationalityController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Nationality'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Address.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: ptypeController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Passport Type'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your passport type.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: purposeController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Passport purpose'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your purpose.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: occupationController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Occupation'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your occupation.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: contactController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Emegency Contact'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Emergency Contact.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            CollectionReference userDet = FirebaseFirestore
                                .instance
                                .collection('applications');
                            await userDet.add({
                              "applicationStatus": {
                                "status": "Pending",
                                "lastUpdated": DateTime.now().toIso8601String(),
                                "submittedAt": DateTime.now().toIso8601String(),
                              },
                              "passportDetails": {
                                "purpose": purposeController.text,
                                "type": ptypeController.text,
                              },
                              "personalInfo": {
                                "fullName": nameController.text,
                                "email": emailController.text,
                                "phone": phoneController.text,
                                "currentAddress": currentAddressController.text,
                                "permanentAddress":
                                    permanentAddressController.text,
                                "gender": genderController.text,
                                "nationality": nationalityController.text,
                                "occupation": occupationController.text,
                                "emergencyContact": contactController.text,
                                "dateOfBirth": dateController.text
                              },
                              "verificationStatus": {
                                "biometricVerified": false,
                                "documentsVerified": false
                              }
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
