enum ValidationType { name, phone, email, password }

class FormValidation {
  final ValidationType validationType;
  final String? formValue;
  FormValidation({required this.validationType, required this.formValue});

  String? validate() {
    switch (validationType) {
      case ValidationType.name:
        return userNameValidation(name: formValue);

      case ValidationType.phone:
        return phoneValidation(phone: formValue);

      case ValidationType.email:
        return emailValidation(email: formValue);

      case ValidationType.password:
        return passwordValidation(password: formValue);

      default:
        return null;
    }
  }

  String? userNameValidation({required String? name}) {
    if (name == null || name.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  String? phoneValidation({required String? phone}) {
    if (phone == null || phone.isEmpty) {
      return "Phone Number is required";
    }
    else if (phone.length < 10) {
      return "Enter your valid phone number";
    }
    else {
      return null;
    }
  }

  String? emailValidation({required String? email}) {
    if (email != null) {
      final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      return emailValid ? null : "Enter your valid email";
    } else {
      return null;
    }
  }

  String? passwordValidation({required String? password}) {
    return password != null && password.length > 5
        ? null
        : "Enter minimum 6 digit password";
  }

}