


import 'package:get/get.dart';

 validInput(String type ,String val,int min,int max){
   if(val.isEmpty) {
     return 'the field is empty ';
   }

   if (val.length < min) {
     return 'you must enter litter than $min';
   }
   if (val.length > max) {
     return 'you must enter litter less $max';
   }

   if(type=='user_name') {
     if (! GetUtils.isUsername(val)) {
       return 'the user name is not correct';
     }
   }
     if (type == 'email') {
       if (!GetUtils.isEmail(val)) {
         return 'the email is not correct';
       }
     }
     if (type == 'phone') {
       if (!GetUtils.isPhoneNumber(val)) {
         return 'the Phone number is not correct';
       }
     }

   }
