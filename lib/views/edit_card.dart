import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/controllers/home_controller.dart';
import 'package:tapcard/models/business_model.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/widgets/business_card.dart';
import 'package:tapcard/views/widgets/custom_textfield.dart';
import 'package:tapcard/views/widgets/dialogs/received_card.dart';

import '../custom_button.dart';
import '../services/local_storage_services.dart';
import '../utils/validators.dart';

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
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Changes have not been saved!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(); // Discard action
                        },
                        child: Container(
                          width: 169.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kgrey4),
                          ),
                          child: const Padding(
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
                                dateTime: widget.cardModel.dateTime,
                                id: widget.cardModel.id
                            ).toMap(),
                          );
                          _showSuccessDialog();

                        },
                        child: Container(
                          width: 169.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kpurple
                          ),
                          child: const Padding(
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
                  const Icon(Icons.check_circle, color: Colors.green, size: 100),
                  const SizedBox(height: 20),
                  const Text(
                    'Changes Saved!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20), // Add spacing between the text and the button
                  InkWell(
                    onTap: () {
                      HomeController.it.getMyCards();
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: const Padding(
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
              if(!_formKey.currentState!.validate())return;
              _showSaveDialog();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
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
              const Text(
                'Preview',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
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
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     CircleAvatar(
              //       backgroundColor: kgrey4,
              //       radius: 50,
              //       child: SizedBox(
              //           height: 50,
              //           width: 50,
              //           child:
              //               Image.asset('assets/images/default_card_logo.png')),
              //     ),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     const Text(
              //       'Change Company Logo',
              //       style:
              //           TextStyle(color: kpurple, fontWeight: FontWeight.bold),
              //     )
              //   ],
              // ),
              const SizedBox(height: 20,),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      title: 'Full Name',
                      controller: name,
                      validator: (v)=>TapCardValidators.isValidInput(v),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            title: 'Company',
                            controller: company,
                            validator: (v)=>TapCardValidators.isValidInput(v),),
                        ),

                        SizedBox(width: 16.w),
                        Expanded(
                          child: CustomTextField(
                            title: 'Title',
                            controller: jobTitle,
                            validator: (v)=>TapCardValidators.isValidInput(v),),
                        ),
                      ],
                    ),
                    CustomTextField(
                      title: 'Email Address',
                      controller: email,
                      validator: (v)=>TapCardValidators.emailValidator(v),),
                    CustomTextField(
                      title: 'Phone Number',
                      inputType: TextInputType.number,
                      controller: phone,
                      validator: (v)=>TapCardValidators.phoneValidator(v),),
                    CustomTextField(
                      title: 'Website',
                      controller: website,
                    ),

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
