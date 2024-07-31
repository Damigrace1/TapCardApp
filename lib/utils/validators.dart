class TapCardValidators {
  static String? isValidInput(String? data, {int minLength = 1}) {

    if(data == null) return 'Input cannot be empty';
    if (data.isEmpty) return 'Input cannot be empty';
    if (data.length < minLength) {
      return 'Input is lesser than $minLength characters.';
    }

    return null;
  }

  static String? phoneValidator(String? phone) {
    if (phone == null  || phone.isEmpty) {
      return 'Enter a phone number';
    } else if (!phone.verifyPhoneNo) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Enter an email';
    } else if (!email.verifyEmail) {
      return 'Please enter a valid email ';
    }
    return null;
  }

}

extension ES on String {
  bool get verifyEmail {
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }



  bool get verifyPhoneNo {
    final phoneRegExp =
    RegExp(r'^(?:\+?\d{1,4}[\s-]?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');
    return phoneRegExp.hasMatch(this);
  }

  String  shorten(int length){
    if(this.length > length){
      return "${substring(0,length)} ....";
    }
    else{
      return this;
    }
  }
}