import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tapcard/utils/themes.dart';
import 'package:tapcard/views/widgets/business_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leadingWidth: 200.w,
        leading:     Row(
          children: [
            SizedBox(width: 16.w,),
            Image.asset('assets/images/app_logo.png',width: 41.61,),
            Text('tapcard',style: TextStyle(fontSize: 22.2.sp),)
          ],
        ),
        actions: [
          // Switch(value: true,
          //     inactiveThumbImage: AssetImage('assets/icons/Moon.png'),
          //     onChanged: (v){}),
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
              setState(() {
print(_controller.value);
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 22.h),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
