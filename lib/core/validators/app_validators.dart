import '../network/local/cache/cache_helper.dart';

String translateString(String english, String arabic) {
  return CacheHelper.getData('lang') == 'en'
      ? english
      : arabic;
}

validateName(String value) {
  Pattern pattern = r'^[A-Za-z][a-zA-Z0-9.\-_$@*!]{2,30}$';
  RegExp regex = RegExp(pattern.toString());
  if (value.isEmpty) {
    return translateString('you should enter user name',
        'يرجي ادخال اسم المستخدم');
  } else if (!regex.hasMatch(value)) {
    return 'اسم المستخدم اكبر من 3 ولايوجد مسافات ولا يبدا بارقام';
  }
  return null;
}

validate(String value) {
  if (value.isEmpty) {
    return 'This field is required';
  }
  return null;
}

validatePassword(String value) {
  if (value.isEmpty) {
    return translateString('you should enter password', 'يجب ادخال كلمة المرور',);
  } else if (value.length < 8) {
    return translateString(
        'password must be at least 8 characters',
        'يجب أن تكون كلمة المرور علي الاقل ٨ أحرف');
  } else if (!RegExp(".*[0-9].*").hasMatch(value)) {
    return translateString(
        'must contain numbers',
        'يجب ان تحتوي علي ارقام');
  }else if (!RegExp(".*[a-z].*").hasMatch(value)) {
    return translateString(
        'must contain lowercase letters',
        'يجب ان تحتوي علي احرف صغيرة');
  }/*else if (!RegExp('.*[A-Z].*').hasMatch(value)) {
    return translateString(
        'must contain at least one uppercase letter',
        'يجب ان تحتوي علي الاقل حرف كبيرة');
  }*/
  return null ;
}

validateConfirmPassword(String value, String confirm) {
  if (value.isEmpty) {
    return translateString('you should enter password', 'يجب ادخال كلمة المرور');
  } else if (value != confirm) {
    return translateString('passwords must be equal',
        'يجب ان تكونا كلمتا المرور متطابقتين');
  }
  return null;
}


validateEmail(String value) {
  Pattern pattern =
      r'^\s*(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))*\s*$';
  RegExp regex = RegExp(pattern.toString());
  if (value.isEmpty) {
    return translateString(
        "email is required", "البريد الالكتروني مطلوب");
  } else if (!regex.hasMatch(value)) {
    return translateString(
        'you should enter valid Email',
        'يجب ادخال البريد الالكتروني بشكل صحيح');
  }
  return null;
}

validateMobile(String value) {
  //String pattern = r'^[1-9][0-9]+$';
  //RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'This field is required';
  }  else if (value.length != 10) {
    return 'mobile phone must be 10 digits';
  }
  return null;
}

validateFacebook(String value) {
  String pattern =r'^(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile.php\?id=(?=\d.*))?([\w\-]*)?';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return translateString('Facebook Link must be correct',
        'يجب ان تدخل رابط صحيح للفيسبوك');
  }
  return null;
}

validateInstagram(String value) {
  String pattern =r"^(?:(?:http|https):\/\/)?(?:www.)?(?:instagram.com|instagr.am|instagr.com)\/(\w+)";
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return translateString(
        'Instagram Link must be correct',
        'يجب ان تدخل رابط صحيح للانستجرام');
  }
  return null;
}

validateYouTub(String value) {
  String pattern = r"^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/|@)?)([\w\-]+)(\S+)?$";
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return translateString('Youtube Link must be correct',
        'يجب ان تدخل رابط صحيح لليوتيوب');
  }
  return null;
}

validateStreet(String value) {
  if (value.isEmpty) {
    return translateString('you should enter address','يرجي ادخال العنوان');
  } else {
    if (value.length < 10 || value.length >= 50) {
      return translateString('The address must be 10 to 50 characters long',
          'العنوان لا يقل عن 10 احرف ولا يزيد عن 50 حرف');
    }
  }
  return null;
}
