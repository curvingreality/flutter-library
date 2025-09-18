class CuReTextFieldValidator {
  final String? errorText;
  final bool? required;
  final bool? noSpaces;
  final int? min;
  final int? max;
  final RegExp? regex;
  final bool? securePassword;
  final DateTime? minDate;
  final DateTime? maxDate;
  final int? minAge;
  final int? maxAge;

  CuReTextFieldValidator({
    this.errorText,
    this.required,
    this.noSpaces,
    this.min,
    this.max,
    this.regex,
    this.securePassword,
    this.minDate,
    this.maxDate,
    this.minAge,
    this.maxAge,
  });
}
