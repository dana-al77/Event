class CustomPattern {
const CustomPattern._internal();

static const CustomPattern _pattern = CustomPattern._internal();

factory CustomPattern() {
  return _pattern;
}

static CustomPattern get instance => _pattern;
final String email = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
final String phoneNumber = r'^\+\d{12,}$|^\d{8,}$';
final String syrianPhoneNumber = r'^\963\d{9}';
final String number = r'\d';
}