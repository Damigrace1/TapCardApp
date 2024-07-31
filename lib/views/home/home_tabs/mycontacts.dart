import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/custom_button.dart';
import 'package:tapcard/models/business_model.dart';
import 'package:tapcard/services/local_storage_services.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/utils/custom_date.dart';
import 'package:tapcard/views/widgets/business_card.dart';

class Contact {
  final String id;
  final String name;
  final String role;
  final String date;
  final String email;
  final String phone;
  final String website;
  final String company;
  final Color color;

  Contact({
    required this.id,
    required this.name,
    required this.role,
    required this.date,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.color,
  });
}

class ContactController extends GetxController {
  // var contacts = <Contact>[
  //   Contact(
  //     id: '1',
  //     name: 'Isaac',
  //     role: 'UI/UX Designer @ HNG',
  //     date: 'July 28, 2024',
  //     email: 'isaac@example.com',
  //     phone: '+234 805 456 321',
  //     website: 'www.isaac.com',
  //     company: 'GreenBolt',
  //   ),
  //   Contact(
  //     id: '2',
  //     name: 'Yetunde',
  //     role: 'UI/UX Designer @ HNG',
  //     date: 'July 28, 2024',
  //     email: 'yetunde@example.com',
  //     phone: '+234 805 456 322',
  //     website: 'www.yetunde.com',
  //     company: 'TechCorp',
  //   ),
  //   Contact(
  //     id: '3',
  //     name: 'Jethro',
  //     role: 'UI/UX Designer @ HNG',
  //     date: 'July 28, 2024',
  //     email: 'jethro@example.com',
  //     phone: '+234 805 456 323',
  //     website: 'www.jethro.com',
  //     company: 'DesignHub',
  //   ),
  //   Contact(
  //     id: '4',
  //     name: 'Ifeoluwa',
  //     role: 'UI/UX Designer @ HNG',
  //     date: 'June 20, 2024',
  //     email: 'ifeoluwa@example.com',
  //     phone: '+234 805 456 324',
  //     website: 'www.ifeoluwa.com',
  //     company: 'Creatives Inc.',
  //   ),
  //   Contact(
  //     id: '5',
  //     name: 'Favor',
  //     role: 'UI/UX Designer @ HNG',
  //     date: 'June 20, 2024',
  //     email: 'favor@example.com',
  //     phone: '+234 805 456 325',
  //     website: 'www.favor.com',
  //     company: 'InnovateX',
  //   ),
  //   Contact(
  //     id: '6',
  //     name: 'Eskor',
  //     role: 'UI/UX Designer @ HNG',
  //     date: 'June 20, 2024',
  //     email: 'eskor@example.com',
  //     phone: '+234 805 456 326',
  //     website: 'www.eskor.com',
  //     company: 'Creative Minds',
  //   ),
  // ].obs;
  var contacts = <Contact>[].obs;

  void getContacts() async {
    final List localContactsDocs =
        await LocalStorageService.instance.getOthersCards()??[];
    List<BusinessCardModel> cardModels =
        localContactsDocs.map((lC) => BusinessCardModel.fromMap(lC)).toList();
    contacts.value = cardModels
        .map((cM) => Contact(
            id: cM.id?.toString() ?? '00',
            color: cM.color??kgrey3,
            name: cM.name ?? '',
            role: cM.jobTitle ?? '',
            date: CustomDateUtils.getFullDate(cM.dateTime.toString() ?? ''),
            email: cM.email ?? '',
            phone: cM.phoneNumber ?? '',
            website: cM.website ?? '',
            company: cM.company ?? ''))
        .toList();
    update();
  }

  @override
  void onInit() {
    getContacts();
    super.onInit();
  }

  var searchTerm = ''.obs;

  List<Contact> get filteredContacts {
    return contacts
        .where((contact) =>
            contact.name.toLowerCase().contains(searchTerm.value.toLowerCase()))
        .toList();
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
    return GetBuilder<ContactController>(builder: ( controller) {
      return Scaffold(
        // backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
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
                    String date =
                    controller.groupedContacts.keys.elementAt(index);
                    List<Contact> contacts = controller.groupedContacts[date]!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(date,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        ...contacts.map((contact) => GestureDetector(
                          onTap: () {
                            Get.to(ContactDetails(contact: contact));
                          },
                          child: ListTile(
                            leading:
                            CircleAvatar(child: Text(contact.name[0])),
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
    },);
  }
}

class ContactDetails extends StatelessWidget {
  final Contact contact;

  const ContactDetails({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        automaticallyImplyLeading: false,
        actions: [
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Close',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200.h,
            ),
            BusinessCard(
                businessCard: BusinessCardModel(
              color: contact.color,
              email: contact.website,
              website: contact.website,
              name: contact.name,
              jobTitle: contact.role,
              phoneNumber: contact.phone,
            )),
            // const Spacer(),
            // CustomButton(
            //     text: 'Add to Contact',
            //     filled: false,
            //     fillColor: Colors.white,
            //     onPressed: () {})
          ],
        ),
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
