import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/custom_button.dart';
import 'package:tapcard/models/business_model.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/widgets/business_card.dart';

import '../services/local_storage_services.dart';

class AddCard extends StatefulWidget {
  AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = GlobalKey<FormState>();

  void _showSaveDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Changes have not been saved!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(); // Discard action
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kgrey4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Text(
                              'Discard',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          _showSuccessDialog();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kpurple
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Text(
                              'Save Changes',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 100),
                  SizedBox(height: 20),
                  Text(
                    'Changes Saved!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Add spacing between the text and the button
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Center(
                          child: Text(
                            'Saved',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  final TextEditingController name = TextEditingController();
  final TextEditingController company = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController website = TextEditingController();
  final TextEditingController jobTitle = TextEditingController();
  final TextEditingController twitter = TextEditingController();
  final TextEditingController linkedln = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    name.addListener((){setState(() {});});
    website.addListener((){setState(() {});});
    email.addListener((){setState(() {});});
    company.addListener((){setState(() {});});
    phone.addListener((){setState(() {});});
    jobTitle.addListener((){setState(() {});});
    twitter.addListener((){setState(() {});});
    linkedln.addListener((){setState(() {});});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    LocalStorageService.instance.getMyCards();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'Add your card details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preview',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            BusinessCard(
             business: BusinessCardModel(
               name: name.text,
               jobTitle: jobTitle.text,
               website: website.text,
               email: email.text,
               phoneNumber: phone.text,
               company: company.text,
               color: Color(0xff002214),
             ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: kgrey4,
                          radius: 50,
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child:
                              Image.asset('assets/images/default_card_logo.png')),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Upload your Logo',
                              style:
                              TextStyle(color: kpurple, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 207.w,
                              child: Text(
                                  'Accepted file types: JPG, PNG. Maximum file size: 2MB.',
                                style: (TextStyle(fontSize: 12.sp,color: Colors.grey.shade600)),
                              ),
                            )
                          ],
                        ),
                    
                      ],
                    ),
                    SizedBox(height: 20,),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Full Name'),
                          TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Company'),
                                    TextFormField(
                                      controller: company,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Title'),
                                    TextFormField(
                                      controller: jobTitle,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text('Email Address'),
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text('Phone Number'),
                          TextFormField(
                            controller: phone,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text('Website'),
                          TextFormField(
                            controller: website,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          // SizedBox(height: 16),
                          // Text('Social Links'),
                          // Column(
                          //   children: [
                          //     TextFormField(
                          //       controller: twitter,
                          //       decoration: InputDecoration(
                          //         border: OutlineInputBorder(),
                          //         prefixIcon: Icon(Icons.link),
                          //       ),
                          //     ),
                          //     SizedBox(height: 16),
                          //     TextFormField(
                          //       controller: linkedln,
                          //       decoration: InputDecoration(
                          //         border: OutlineInputBorder(),
                          //         prefixIcon: Icon(Icons.link),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 16),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: kgrey4),
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Text('Add social link'),
                          //   ),
                          // ),
                          SizedBox(height: 24.h,),
                          CustomButton(
                            enabled:
                            (name.text == '' || phone.text == '') ?
                             false : true,
                            text: 'Save Card', onPressed: (){
                            LocalStorageService.instance.saveMyCard(
                              BusinessCardModel(
                                name: name.text,
                                jobTitle: jobTitle.text,
                                website: website.text,
                                email: email.text,
                                phoneNumber: phone.text,
                                color: const Color(0xff503dd4),
                                company: company.text
                              ).toMap()
                            );
                          },
                            fillColor: kpurple,
                          )
                        ],
                      ),
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
