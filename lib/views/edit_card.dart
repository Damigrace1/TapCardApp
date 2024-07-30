import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/controllers/home_controller.dart';
import 'package:tapcard/models/business_model.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/widgets/business_card.dart';

import '../custom_button.dart';
import '../services/local_storage_services.dart';

class EditCard extends StatefulWidget {
  EditCard({super.key, required this.cardModel});
 final BusinessCardModel cardModel;
  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  final _formKey = GlobalKey<FormState>();

  void _showSaveDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
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
                          LocalStorageService.instance.updateMyCard(
                            BusinessCardModel(
                                name: name.text,
                                jobTitle: jobTitle.text,
                                website: website.text,
                                email: email.text,
                                phoneNumber: phone.text,
                                color: widget.cardModel.color,
                                twitter: twitter.text,
                                linkedln: linkedln.text,
                                company: company.text,
                              id: widget.cardModel.id
                            ).toMap(),
                          );
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
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
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
                      HomeController.it.getCards();
                      Navigator.of(context).pop(); // Close the dialog
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



  late TextEditingController name;
 late   TextEditingController company;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController website;
  late TextEditingController jobTitle;
  late TextEditingController twitter;
  late TextEditingController linkedln;

  @override
  void initState() {
    // TODO: implement initState
    name = TextEditingController(
      text:  widget.cardModel.name
    )..addListener((){setState(() {});});
    company = TextEditingController(
        text:  widget.cardModel.company
    )..addListener((){setState(() {});});
    email = TextEditingController(
        text:  widget.cardModel.email
    )..addListener((){setState(() {});});
    phone = TextEditingController(
        text:  widget.cardModel.phoneNumber
    )..addListener((){setState(() {});});
    website = TextEditingController(
        text:  widget.cardModel.website
    )..addListener((){setState(() {});});
    linkedln = TextEditingController(
 text:  widget.cardModel.linkedln
    )..addListener((){setState(() {});});
    jobTitle = TextEditingController(
        text:  widget.cardModel.jobTitle
    )..addListener((){setState(() {});});
    twitter = TextEditingController(
        text:  widget.cardModel.twitter
    )..addListener((){setState(() {});});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Change Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              _showSaveDialog();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                children: [
                  Text(
                    'save',
                    style: TextStyle(color: kpurple, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.check_rounded,
                    color: kpurple,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
               businessCard: BusinessCardModel(
                 name: name.text,
                 jobTitle: jobTitle.text,
                 website: website.text,
                 email: email.text,
                 phoneNumber: phone.text,
                 color: widget.cardModel.color,
                 twitter: twitter.text,
                 linkedln: linkedln.text,
                 company: company.text
               ),
              ),
              SizedBox(
                height: 20,
              ),
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
                  Text(
                    'Change Company Logo',
                    style:
                        TextStyle(color: kpurple, fontWeight: FontWeight.bold),
                  )
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

                    SizedBox(height: 24.h,),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
