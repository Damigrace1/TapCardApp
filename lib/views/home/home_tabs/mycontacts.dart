// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class ContactsTab extends StatelessWidget {
  
//    ContactsTab({super.key});
//   final ContactController controller = Get.put(ContactController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Column(
//         children: [
//          SizedBox(height: 10.h,), 
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) => controller.searchTerm.value = value,
//               decoration: const InputDecoration(
//                 hintText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15)), 
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Obx(() {
//               if (controller.filteredContacts.isEmpty) {
//                 return const Center(child: Text('No contact found'));
//               }
//               return ListView.builder(
//                 itemCount: controller.groupedContacts.length,
//                 itemBuilder: (context, index) {
//                   String date = controller.groupedContacts.keys.elementAt(index);
//                   List<Contact> contacts = controller.groupedContacts[date]!;
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
//                       ),
//                       ...contacts.map((contact) => ListTile(
//                         leading: CircleAvatar(child: Text(contact.name[0])),
//                         title: Text(contact.name),
//                         subtitle: Text(contact.role),
//                       )),
//                     ],
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Map<K, List<V>> groupBy<K, V>(Iterable<V> values, K Function(V) keyFunction) {
//   return values.fold(<K, List<V>>{}, (Map<K, List<V>> map, V element) {
//     K key = keyFunction(element);
//     if (!map.containsKey(key)) {
//       map[key] = <V>[];
//     }
//     map[key]!.add(element);
//     return map;
//   });
// }




// class Contact {
//   final String id;
//   final String name;
//   final String role;
//   final String date;

//   Contact({required this.id, required this.name, required this.role, required this.date});
// }


// class ContactController extends GetxController {
//   var contacts = <Contact>[
//     Contact(id: '1', name: 'Isaac', role: 'UI/UX Designer @ HNG', date: 'July 28, 2024'),
//     Contact(id: '2', name: 'Yetunde', role: 'UI/UX Designer @ HNG', date: 'July 28, 2024'),
//     Contact(id: '3', name: 'Jethro', role: 'UI/UX Designer @ HNG', date: 'July 28, 2024'),
//     Contact(id: '4', name: 'Ifeoluwa', role: 'UI/UX Designer @ HNG', date: 'June 20, 2024'),
//     Contact(id: '5', name: 'Favor', role: 'UI/UX Designer @ HNG', date: 'June 20, 2024'),
//     Contact(id: '6', name: 'Eskor', role: 'UI/UX Designer @ HNG', date: 'June 20, 2024'),
//   ].obs;

//   var searchTerm = ''.obs;

//   List<Contact> get filteredContacts {
//     return contacts.where((contact) => 
//       contact.name.toLowerCase().contains(searchTerm.value.toLowerCase())
//     ).toList();
//   }

//   Map<String, List<Contact>> get groupedContacts {
//     return groupBy(filteredContacts, (Contact c) => c.date);
//   }
// }
     

 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Contact {
  final String id;
  final String name;
  final String role;
  final String date;
  final String email;
  final String phone;
  final String website;
  final String company;

  Contact({
    required this.id,
    required this.name,
    required this.role,
    required this.date,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
  });
}

class ContactController extends GetxController {
  var contacts = <Contact>[
    Contact(
      id: '1',
      name: 'Isaac',
      role: 'UI/UX Designer @ HNG',
      date: 'July 28, 2024',
      email: 'isaac@example.com',
      phone: '+234 805 456 321',
      website: 'www.isaac.com',
      company: 'GreenBolt',
    ),
    Contact(
      id: '2',
      name: 'Yetunde',
      role: 'UI/UX Designer @ HNG',
      date: 'July 28, 2024',
      email: 'yetunde@example.com',
      phone: '+234 805 456 322',
      website: 'www.yetunde.com',
      company: 'TechCorp',
    ),
    Contact(
      id: '3',
      name: 'Jethro',
      role: 'UI/UX Designer @ HNG',
      date: 'July 28, 2024',
      email: 'jethro@example.com',
      phone: '+234 805 456 323',
      website: 'www.jethro.com',
      company: 'DesignHub',
    ),
    Contact(
      id: '4',
      name: 'Ifeoluwa',
      role: 'UI/UX Designer @ HNG',
      date: 'June 20, 2024',
      email: 'ifeoluwa@example.com',
      phone: '+234 805 456 324',
      website: 'www.ifeoluwa.com',
      company: 'Creatives Inc.',
    ),
    Contact(
      id: '5',
      name: 'Favor',
      role: 'UI/UX Designer @ HNG',
      date: 'June 20, 2024',
      email: 'favor@example.com',
      phone: '+234 805 456 325',
      website: 'www.favor.com',
      company: 'InnovateX',
    ),
    Contact(
      id: '6',
      name: 'Eskor',
      role: 'UI/UX Designer @ HNG',
      date: 'June 20, 2024',
      email: 'eskor@example.com',
      phone: '+234 805 456 326',
      website: 'www.eskor.com',
      company: 'Creative Minds',
    ),
  ].obs;

  var searchTerm = ''.obs;

  List<Contact> get filteredContacts {
    return contacts.where((contact) =>
      contact.name.toLowerCase().contains(searchTerm.value.toLowerCase())
    ).toList();
  }

  Map<String, List<Contact>> get groupedContacts {
    return groupBy(filteredContacts, (Contact c) => c.date);
  }
}

class ContactsTab extends StatelessWidget {
  ContactsTab({super.key});
  final ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => controller.searchTerm.value = value,
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.filteredContacts.isEmpty) {
                return const Center(child: Text('No contact found'));
              }
              return ListView.builder(
                itemCount: controller.groupedContacts.length,
                itemBuilder: (context, index) {
                  String date = controller.groupedContacts.keys.elementAt(index);
                  List<Contact> contacts = controller.groupedContacts[date]!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      ...contacts.map((contact) => GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: ContactDetails(contact: contact),
                              );
                            },
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(child: Text(contact.name[0])),
                          title: Text(contact.name),
                          subtitle: Text(contact.role),
                        ),
                      )),
                    ],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  final Contact contact;

  const ContactDetails({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.website, style: const TextStyle(color: Colors.grey)),
                Text(contact.company, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8.0),
                Text(contact.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(contact.role),
                const SizedBox(height: 8.0),
                Text(contact.email),
                Text(contact.phone),
              ],
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Added to contact'),
          ),
        ),
      ],
    );
  }
}

Map<K, List<V>> groupBy<K, V>(Iterable<V> values, K Function(V) keyFunction) {
  return values.fold(<K, List<V>>{}, (Map<K, List<V>> map, V element) {
    K key = keyFunction(element);
    if (!map.containsKey(key)) {
      map[key] = <V>[];
    }
    map[key]!.add(element);
    return map;
  });
}
