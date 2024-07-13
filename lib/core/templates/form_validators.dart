typedef DoubleValidatorFunction = String? Function(String?, String?);
typedef SingleRegistrationValidatorFunction = String? Function(String?);

class FormValidators {
  static final _emailRegexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}');
  static final _passwordRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');

  static SingleRegistrationValidatorFunction emailValidator = (value) {
    if (value == null || value.isEmpty) return 'Enter your email';
    if (!_emailRegexp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  };

  static SingleRegistrationValidatorFunction passwordValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (!_passwordRegexp.hasMatch(value)) {
      return 'Invalid password';
    }

    return null;
  };

  static SingleRegistrationValidatorFunction passwordRegValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Password must contain at least 8 characters';
    }
    if (!_passwordRegexp.hasMatch(value)) {
      return 'Password must contain one uppercase letter';
    }
    return null;
  };

  static DoubleValidatorFunction repeatPasswordValidator = (value1, value2) {
    if (value1 == null || value1.isEmpty) {
      return 'Please enter password';
    }
    return value1 == value2 ? null : 'Re-enter your password';
  };
}
