class CustomValidationClass {
  static String? emailValidator(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value!)) {
      return '• Email format is invalid';
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null) {
      return '• Password field can\'t be empty';
    } else if (value.length <= 7) {
      return '• Password must be at least 8 characters long';
    } else {
      return null;
    }
  }

  static String? nameValidator(String? value) {
    if (value == null) {
      return '• This field can\'t be empty';
    } else if (value.isEmpty) {
      return '• This field can\'t be empty';
    } else {
      return null;
    }
  }

  static String? phoneValidator(String? value) {
    if (value == null) {
      return '• This field can\'t be empty';
    } else if (value.isEmpty) {
      return '• This field can\'t be empty';
    } else {
      return null;
    }
  }
}
