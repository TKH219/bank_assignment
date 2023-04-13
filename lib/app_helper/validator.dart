import 'helper.dart';

class Validator {
  static String? emailValidator(value){
    if (value== null || value.isEmpty) {
      return 'email is required!';
    } else if(!Helper.isEmailValid(value)) {
      return 'Please enter valid email address.';
    } else {
      return null;
    }
  }

}