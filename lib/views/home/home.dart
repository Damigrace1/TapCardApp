import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/controllers/home_controller.dart';
import 'package:tapcard/models/business_model.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/add_card.dart';
import 'package:tapcard/views/widgets/dialogs/received_card.dart';
import '../../services/local_storage_services.dart';
import '../../utils/themes.dart';
import '../widgets/dialogs/scan_incoming_card.dart';
import 'home_tabs/mycards.dart';
import 'home_tabs/mycontacts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    //HomeController.it.readBusinessCard();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final _controller = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GetBuilder<HomeController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 200.w,
              leading: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Image.asset(
                    'assets/images/app_logo.png',
                    width: 41.61,
                  ),
                  Text(
                    'tapcard',
                    style: TextStyle(fontSize: 22.2.sp),
                  )
                ],
              ),
              actions: [
                AdvancedSwitch(
                  controller: _controller,
                  activeColor: currentTheme.primaryColor,
                  inactiveColor: currentTheme.primaryColor,
                  activeChild: Image.asset(
                    _controller.value
                        ? 'assets/icons/Moon.png'
                        : 'assets/icons/SunDim.png',
                    width: 19.12,
                  ),
                  inactiveChild: Image.asset(
                    _controller.value
                        ? 'assets/icons/Moon.png'
                        : 'assets/icons/SunDim.png',
                    width: 19.12,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  width: 68.w,
                  height: 36.h,
                  enabled: true,
                  onChanged: (v) {
                    controller.themeMode = v ? ThemeMode.light : ThemeMode.dark;
                    setState(() {});
                  },
                  thumb: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            currentTheme.primaryColor, BlendMode.srcATop),
                        child: Image.asset(
                          !_controller.value
                              ? 'assets/icons/Moon.png'
                              : 'assets/icons/SunDim.png',
                          width: 19.12,
                        ),
                      )),
                  disabledOpacity: 0.5,
                ),
                SizedBox(
                  width: 16.w,
                ),
              ],
              bottom: TabBar(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                tabAlignment: TabAlignment.fill,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.purple,
                labelStyle: TextStyle(
                    color: currentTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
                unselectedLabelStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'My Cards'),
                  Tab(text: 'Contacts'),
                ],
              ),
            ),
            body: TabBarView(
              children: [

                MyCardsTab(),
                ContactsTab()
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: kgrey6.withOpacity(1),
              onPressed: () {

              HomeController.it.readBusinessCard();
            },child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/scan_card.png',width: 24.w,),
                Text('Scan',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,color:
                kpurple1),)
              ],
            ),
            ),
          );
        },

      ),
    );
  }
}

class AddNewCard extends StatelessWidget {

  const AddNewCard({super.key,});
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: ()async{
       await  Get.to(()=>AddCard());

      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 15.h),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color:  Colors.grey[400]!,

          radius: Radius.circular(12.r),
          padding: EdgeInsets.zero,
          child: Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color:  HomeController.it.themeMode == ThemeMode.light ? Colors.grey.shade200 : currentTheme.highlightColor,
            ),
            child:const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline, size: 48, color: Color(0xff8e60dd)),
                SizedBox(height: 8),
                Text(
                  'Add New Card',
                  style: TextStyle(
                    color: Color(0xff8e60dd),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      )

    );
  }
}
