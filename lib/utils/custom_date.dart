

import 'package:flutter/material.dart';

class CustomDateUtils {

  static Map<int, String> monthMap = {
    01: 'January',
    02: 'February',
    03: 'March',
    04: 'April',
    05: 'May',
    06: 'June',
    07: 'July',
    08: 'August',
    09: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };

  static Map<int, String> monthMapShort = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'Jul',
    8: 'Aug',
    9: 'Sept',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };

  static Map<int, String> weekdayMap = {
    7: 'Sunday',
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
  };

  static String getDayWithOrdinal(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  static String processDate(dynamic date){
    DateTime today = DateTime(0);
    try{
      if(date is String) {
        today = DateTime.parse(date);
      }
      else{
        today = date;
      }

      String getMonth(){
        final monthIndex = monthMap.keys.firstWhere((ind) => ind == today.month) -1;
        return monthMap.values.toList()[monthIndex];
      }
      return '${getDayWithOrdinal(today.day)} ${getMonth()} ${today.year}';
    }catch(e){
      //
    }
    return 'Nil';
  }

  static String toYYYYMmDd(String dateStr){
    try{
      DateTime today = DateTime.parse(dateStr);
      return '${today.year}-${today.month}-${today.day}';
    }catch(e){
      //
    }
    return 'Nil';
  }

  static String changeFormat(String? dateString){
    try{
      return dateString!.replaceAll('-', '/');
    }catch(e){
      return 'Nil';
    }
  }

  static String getTime(String dateStr){
    // 2024-03-30T18:06:29.861647Z
    try{
      String hour = dateStr.split(':')[1];
      String minute = dateStr.split(':')[2].split('.')[0];
      return '$hour:$minute';
    }catch(e){
      //
    }
    return 'Nil';
  }

  static String getFullDate(String dateStr){

    try{
      DateTime dateTime = DateTime.parse(dateStr);
      return '${monthMapShort[dateTime.month]} ${dateTime.day}, ${dateTime.year}';
    }
    catch(e){}
    return '';
  }
}




