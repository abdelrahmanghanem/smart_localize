import 'package:smart_localize/src/extension.dart';

class SmartLocalizeValidation {
  SmartLocalizeValidation._();

  /// Message is "Field can't be empty."
  static String get cannotBeEmpty => "can_not_be_empty".tr();

  /// Message is "Invalid phone number."
  static String get phoneWarning => "invalid_phone_warning".tr();

  /// Message is "Invalid value."
  static String get invalidValue => "invalid_value".tr();

  /// Message is "Invalid number value."
  static String get invalidNumberValue => "invalid_number_value".tr();

  /// Message is "Field can't be empty or zero."
  static String get cannotBeEmptyOrZero => "can_not_be_empty_or_zero".tr();

  /// Message is "Can not be zero."
  static String get cannotBeZero => "can_not_be_zero".tr();

  /// Message is "Invalid email Example: example@example.com."
  static String get invalidEmailWithExample =>
      "invalid_email_with_example".tr();

  /// Message is "* Password cannot be empty."
  static String get passwordEmpty => "password_empty".tr();

  /// Message is "* Password must be at least 8 characters long."
  static String get passwordLength => "password_length".tr();

  /// Message is "* Password must contain at least 1 uppercase letter."
  static String get passwordUppercase => "password_uppercase".tr();

  /// Message is "* Password must contain at least 1 lowercase letter."
  static String get passwordLowercase => "password_lowercase".tr();

  /// Message is "* Password must contain at least 1 digit."
  static String get passwordDigit => "password_digit".tr();

  /// Message is "* Password must contain at least 1 special character."
  static String get passwordSpecialChar => "password_special_char".tr();

  /// Message is "* Password must contain at least\n\n • Minimum length is 8 characters\n • 1 Capital letter and 1 small letter\n • 1 numbers\n • 1 special characters."
  static String get passwordFormat => "password_format".tr();

  /// Message is "Password not match."
  static String get passwordNotMatch => "password_not_match".tr();

  /// Message is "Only Arabic letters."
  static String get onlyArabicLetters => "only_arabic_letters".tr();

  /// Message is "Only English letters."
  static String get onlyEnglishLetters => "only_english_letters".tr();

  /// Message is "Minimum length is 1 digit."
  static String get minimumLengthIs1Digit => "minimum_length_is_1_digit".tr();

  /// Message is "Max length is 7 digits."
  static String get maxLengthIs7Digits => "max_length_is_7_digits".tr();

  /// Message is "Max length is 2 digits."
  static String get maxLengthIs2Digits => "max_length_is_2_digits".tr();

  /// Message is "Sell more than buy."
  static String get sellMoreThanBuy => "sell_more_than_buy".tr();

  /// Message is "Buy less than sell."
  static String get buyLessThanSell => "buy_less_than_sell".tr();

  /// Message is "Please enter the min price."
  static String get pleaseEnterTheMinPrice => "please_enter_the_min_price".tr();

  /// Message is "Please enter the max price."
  static String get pleaseEnterTheMaxPrice => "please_enter_the_max_price".tr();

  /// Message is "Please enter valid price."
  static String get pleaseEnterValidPrice => "please_enter_valid_price".tr();

  /// Message is "Min < Max."
  static String get minLessThanMax => "min < max".tr();

  /// Message is "Please enter valid value."
  static String get pleaseEnterValidValue => "please_enter_valid_value".tr();

  /// Message is "Salary must be between."
  static String get salaryMustBeBetween => "salary_must_be_between".tr();

  /// Message is "Please enter valid code."
  static String get pleaseEnterValidCode => "please_enter_valid_code".tr();

  /// Message is "Value be greater than zero."
  static String get valueBeGreaterThanZero => "value_be_greater_than_zero".tr();

  /// Message is "Must be greater than three digits."
  static String get mustBeGreaterThanThreeDigits =>
      "must_be_greater_than_three_digits".tr();

  /// Message is "Must be less than eleven digits."
  static String get mustBeLessThanElevenDigits =>
      "must_be_less_than_eleven_digits".tr();

  /// Message is "Please enter your email."
  static String get pleaseEnterYourEmail => "please_enter_your_email".tr();

  /// Message is "Please confirm password."
  static String get pleaseConfirmPassword => "please_confirm_password".tr();

  /// Message is "Please enter number."
  static String get pleaseEnterNumber => "please_enter_number".tr();

  /// Message is "Please enter your phone number."
  static String get pleaseEnterYourPhoneNumber =>
      "please_enter_your_phone_number".tr();

  /// Message is "Please enter password."
  static String get pleaseEnterPassword => "please_enter_password".tr();

  /// Message is "Email must be at least 8 characters long."
  static String get emailMustBe8Characters =>
      "email_must_be_at_least_8_characters_long".tr();
}
