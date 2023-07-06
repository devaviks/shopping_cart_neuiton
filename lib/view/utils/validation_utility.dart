
//validate phone number
String? validateMobileNumberInput(value) {
  if (value.isEmpty) {
    return 'Please enter a valid mobile number (10 digits)';
  }
  if (value.length != 10) {
    return 'Please enter a valid mobile number (10 digits)';
  }
  if (int.tryParse(value) == null) {
    return 'Please enter a valid mobile number (10 digits)';
  }
  return null;
}
////////////