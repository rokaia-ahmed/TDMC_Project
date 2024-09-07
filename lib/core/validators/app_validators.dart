import '../network/local/cache/cache_helper.dart';

String translateString(String english, String arabic) {
  return CacheHelper.getData('lang') == 'en'
      ? english
      : arabic;
}

validate(String value) {
  if (value.isEmpty) {
    return translateString('This field is required',
        'هذا الحقل مطلوب') ;
  }
  return null;
}

otpValidate(String value) {
  if (value.isEmpty) {
    return translateString('This field is required',
        'هذا الحقل مطلوب');
  }else if(value.length<4)
    return translateString('code must be 4 digit',
        'يجب أن يكون الرمز مكونًا من 4 أرقام');
  return null;
}

validateMobile(String value) {
  if (value.isEmpty) {
    return translateString('This field is required',
        'هذا الحقل مطلوب');
  }  else if (value.length<6) {
    return translateString('Mobile phone must be more than 5 digit',
        'جب أن يكون رقم الهاتف المحمول أكثر من 5 أرقام');
  }else if(value.length>11){
    return translateString('Mobile phone must be less than 12 digit',
        'يجب أن يكون رقم الهاتف المحمول أقل من 12 رقمًا');
  }
  return null;
}
