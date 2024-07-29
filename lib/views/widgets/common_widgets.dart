import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/themes.dart';

ListTile buildSettingsTile(
    {
      required String title,
      required Widget value
    }
    ) {
  return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(vertical: -4),
      title: Text(title),
      trailing:value
  );
}

Column buildSettingsColumn({
  required List<Widget> children,
  required String title
}
    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,style: TextStyle(color: currentTheme.dividerColor),),
      SizedBox(height: 8.h,),
      Container(
          padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: currentTheme.highlightColor
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return children[index];
            }, separatorBuilder: (BuildContext context, int index) {
            return Divider();
          }, itemCount: children.length,)
      ),
    ],
  );
}

