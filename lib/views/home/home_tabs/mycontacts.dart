import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsTab extends StatelessWidget {
  
   ContactsTab({super.key});
  final ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
        const SizedBox(height: 10,), 
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
                      ...contacts.map((contact) => ListTile(
                        leading: CircleAvatar(child: Text(contact.name[0])),
                        title: Text(contact.name),
                        subtitle: Text(contact.role),
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




class Contact {
  final String id;
  final String name;
  final String role;
  final String date;

  Contact({required this.id, required this.name, required this.role, required this.date});
}


class ContactController extends GetxController {
  var contacts = <Contact>[
    Contact(id: '1', name: 'Isaac', role: 'UI/UX Designer @ HNG', date: 'July 28, 2024'),
    Contact(id: '2', name: 'Yetunde', role: 'UI/UX Designer @ HNG', date: 'July 28, 2024'),
    Contact(id: '3', name: 'Jethro', role: 'UI/UX Designer @ HNG', date: 'July 28, 2024'),
    Contact(id: '4', name: 'Ifeoluwa', role: 'UI/UX Designer @ HNG', date: 'June 20, 2024'),
    Contact(id: '5', name: 'Favor', role: 'UI/UX Designer @ HNG', date: 'June 20, 2024'),
    Contact(id: '6', name: 'Eskor', role: 'UI/UX Designer @ HNG', date: 'June 20, 2024'),
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
     