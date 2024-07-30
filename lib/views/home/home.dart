import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/controllers/home_controller.dart';
import 'package:tapcard/views/widgets/business_card.dart';
import '../../utils/themes.dart';
import '../widgets/card2__widget.dart';

class HomeScreen extends StatefulWidget {
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
  }

  


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  final _controller = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: GetBuilder<HomeController>(builder: ( controller) {
        return Scaffold(
          appBar:  AppBar
            (
            leadingWidth: 200.w,
            leading:     Row(
              children: [
                SizedBox(width: 16.w,),
                Image.asset('assets/images/app_logo.png',width: 41.61,),
                Text('tapcard',style: TextStyle(fontSize: 22.2.sp),)
              ],
            ),
            actions: [
              AdvancedSwitch(
                controller: _controller,
                activeColor: currentTheme.primaryColor,
                inactiveColor: currentTheme.primaryColor,
                activeChild: Image.asset( _controller.value ? 'assets/icons/Moon.png' :
                'assets/icons/SunDim.png',width: 19.12,),
                inactiveChild: Image.asset( _controller.value ? 'assets/icons/Moon.png' :
                'assets/icons/SunDim.png',width: 19.12,),
                borderRadius: BorderRadius.all(const Radius.circular(15)),
                width: 68.w,
                height: 36.h,
                enabled: true,
                onChanged: (v){
                  controller.themeMode = v ? ThemeMode.light : ThemeMode.dark;
                  setState(() {

                  });
                },
                thumb:  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(currentTheme.primaryColor,
                          BlendMode.srcATop),
                      child: Image.asset(
                        !_controller.value ? 'assets/icons/Moon.png' :
                        'assets/icons/SunDim.png',width: 19.12,),
                    )),
                disabledOpacity: 0.5,
              ),
              SizedBox(width: 16.w,),
            ],
            bottom: TabBar(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              tabAlignment: TabAlignment.fill,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.purple,
              labelStyle: TextStyle(color: currentTheme.primaryColor,
              fontWeight: FontWeight.bold,fontSize: 16.sp),
              unselectedLabelStyle: TextStyle(color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,fontSize: 16.sp),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'My Cards'),
                Tab(text: 'Contacts'),
              ],
            ),
          ) ,
          body: TabBarView(
            children: [
              MyCardsTab(),
              ContactsTab()
            ],
          ) ,
        );
      },),
    );
  }
}

class MyCardsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           BusinessCard(
            name: 'Jonas Broms',
            jobTitle: 'UX/UI Designer',
            website: 'www.jonasbroms.com',
            email: 'jonas.broms@jonasbroms.com',
            phoneNumber: '+234 805 456 321',
            color: Color(0xff002214),
          ),
           BusinessCard(
            name: 'Jonas Brom',
            jobTitle: 'UX/UI Designer',
            website: 'www.jonasbroms.com',
            email: 'jonas.broms@jonasbroms.com',
            phoneNumber: '+234 805 456 321',
            color: Color(0xff503dd4),
          ),
          AddNewCard(),
          
        ],
      ),
    );
  }
}

class ContactsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contacts'),
    );
  }
}

class AddNewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[400]!, style: BorderStyle.solid),
      ),
      child: const Center(
        heightFactor: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
    );
  }
}
