// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tapcard/controllers/home_controller.dart';
// import 'package:tapcard/views/widgets/sharing_dialog.dart';
//
// import '../../custom_button.dart';
//
// class Card2Widget extends StatelessWidget {
//   final String name;
//   final String? jobTitle;
//   final String? website;
//   final String? email;
//   final String phoneNumber;
//   final Color color;
//
//    Card2Widget({
//     super.key,
//     required this.name,
//      this.jobTitle,
//      this.website,
//      this.email,
//     required this.phoneNumber,
//     required this.color,
//   });
//     ValueNotifier<bool> isTapped = ValueNotifier<bool>(false);
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(valueListenable: isTapped, builder: (context,
//     val,_){
//       return GestureDetector(
//         onTap: () {
//          isTapped.value = !isTapped.value;
//         },
//         child: Container(
//           margin: const EdgeInsets.all(16),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     website??'',
//                     style: const TextStyle(color: Colors.white, fontSize: 12),
//                   ),
//                   Image.asset(
//                     'assets/images/card_logo.png',
//                     width: 40,
//                     alignment: Alignment.topRight,
//                     matchTextDirection: true,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 name,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               if(jobTitle != null)
//               Text(
//                 jobTitle!,
//                 style: const TextStyle(color: Colors.white, fontSize: 11),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   if(email != null)
//                   Text(
//                     email!,
//                     style: const TextStyle(color: Colors.white, fontSize: 9),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     phoneNumber,
//                     style: const TextStyle(color: Colors.white, fontSize: 9),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 16),
//               if (val) // Replace with condition to show/hide buttons
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Divider(),
//                   SizedBox(height: 24.h,),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8.h,vertical:4.h ),
//                     decoration: BoxDecoration(color: Colors.white,
//                     borderRadius: BorderRadius.circular(14.r)),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: CustomButton(text: 'Share',
//                           onPressed: (){
//                             showDialog(
//                               context: context,
//                               builder: (context) => const SharingDialog(),
//                             );
//                           },),
//                         ),
//                         SizedBox(width: 12.w,),
//                         Expanded(
//                           child: CustomButton(filled:  false,
//                             onPressed :(){
//                             HomeController.it.showEditCardDialog(context);
//                             },
//                             text: 'Edit',),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
