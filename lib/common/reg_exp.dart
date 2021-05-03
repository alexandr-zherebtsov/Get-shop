import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppRegExp {
  static const String numberReg = r'[0-9]';
  static const String phoneReg = r'^(\+?)((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$';
  static const String emailReg = r'^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$';
  static final maskFormatter = MaskTextInputFormatter(mask: '+## (###) ###-##-##', filter: {"#": RegExp(numberReg)});
}

