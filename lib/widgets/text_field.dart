import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuReTextField extends StatefulWidget {
  const CuReTextField({
    super.key,
    this.placeholder,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    required this.controller,
    this.validator,
    this.onChanged,
    this.showBorder,
    this.onValidation,
    this.disabled,
    this.readonly,
    this.type,
    this.multiline,
    this.maxLines,
    this.shape,
    this.onSubmitted,
    this.showCounter,
    this.borderRadius,
    this.options,
    this.color,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
  });

  final String? placeholder;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffix;
  final TextEditingController controller;
  final CuReTextFieldValidator? validator;
  final Function? onChanged;
  final bool? showBorder;
  final Function(bool)? onValidation;
  final bool? disabled;
  final bool? readonly;
  final CuReTextFieldType? type;
  final bool? multiline;
  final int? maxLines;
  final CuReShape? shape;
  final Function? onSubmitted;
  final bool? showCounter;
  final double? borderRadius;
  final List<CuReDropdownItem>? options;
  final Color? color;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  State<CuReTextField> createState() => _CuReTextFieldState();
}

class _CuReTextFieldState extends State<CuReTextField> {
  bool isInvalid = false;
  String errorMessage = '';
  final _debouncer = CuReDebouncer(milliseconds: 500);
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: CuReText(
              widget.label!,
              weight: FontWeight.w600,
              align: widget.textAlign ?? TextAlign.start,
            ),
          ),
        if (CuReUtils.isIos()) _getIosTextField(),
        if (!CuReUtils.isIos()) _getAndroidTextField(),
        if (widget.showCounter != null && widget.showCounter!)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CuReText(
                  '${widget.controller.text.length} / ${widget.validator != null && widget.validator!.max != null ? widget.validator!.max : 100}',
                  color: Colors.grey,
                  size: 12,
                  align: TextAlign.end,
                ),
              ),
            ],
          ),
        if (isInvalid)
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: CuReText(
              errorMessage,
              color: CuReDesign.dangerColor,
            ),
          ),
      ],
    );
  }

  void _runValidationCheck(String value) {
    final validationError = _checkValidation(value);
    if (validationError != null) {
      setState(() {
        isInvalid = true;
        errorMessage = validationError;
      });
      if (widget.onValidation != null) {
        widget.onValidation!(false);
      }
    } else {
      setState(() {
        isInvalid = false;
        errorMessage = '';
      });
      if (widget.onValidation != null) {
        widget.onValidation!(true);
      }
    }
  }

  Widget _getIosTextField() {
    return CupertinoTextField(
      textAlign: widget.textAlign ?? TextAlign.start,
      style: TextStyle(
        color: CuReDesign.useDarkMode ? Colors.white : CuReDesign.textColor,
        fontSize: widget.fontSize ?? 16,
        fontWeight: widget.fontWeight ?? FontWeight.normal,
      ),
      onSubmitted: (value) {
        if (widget.onSubmitted != null) {
          widget.onSubmitted!(value);
        }
      },
      keyboardType: widget.multiline != null && widget.multiline!
          ? TextInputType.multiline
          : null,
      maxLines: widget.maxLines ?? 1,
      controller: widget.controller,
      onChanged: (value) {
        _debouncer.run(() {
          _runValidationCheck(value);
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onTap: _onTap(),
      readOnly: _isReadOnly() || widget.disabled != null && widget.disabled!,
      placeholder: widget.placeholder,
      placeholderStyle: TextStyle(
        color: CuReDesign.useDarkMode ? Colors.grey.shade600 : Colors.grey[400],
      ),
      padding: _getPadding(),
      obscureText: _isPasswordField() && !showPassword,
      prefix: widget.prefixIcon != null
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Icon(widget.prefixIcon, color: _getIconColor()),
            )
          : null,
      suffix: _getSuffix(),
      decoration: BoxDecoration(
        border: Border.all(
          color: _getBorderColor(),
          width: 1,
        ),
        color: _getIosBackgroundColor(),
        borderRadius: _getBorderRadius(),
      ),
    );
  }

  Color _getIosBackgroundColor() {
    if (widget.color != null) {
      return widget.color!;
    }
    if (CuReDesign.useDarkMode) {
      if (widget.disabled != null && widget.disabled!) {
        return const Color(0xff303030);
      } else {
        return const Color(0xff202020);
      }
    } else {
      if (widget.disabled != null && widget.disabled!) {
        return CuReDesign.disabledColor.withAlpha(100);
      } else {
        return Colors.grey[200]!;
      }
    }
  }

  Widget _getAndroidTextField() {
    return TextField(
      textAlign: widget.textAlign ?? TextAlign.start,
      style: TextStyle(
        color: CuReDesign.useDarkMode ? Colors.white : CuReDesign.textColor,
        fontSize: widget.fontSize ?? 16,
        fontWeight: widget.fontWeight ?? FontWeight.normal,
      ),
      onSubmitted: (value) {
        if (widget.onSubmitted != null) {
          widget.onSubmitted!(value);
        }
      },
      keyboardType: widget.multiline != null && widget.multiline!
          ? TextInputType.multiline
          : null,
      maxLines: widget.maxLines ?? 1,
      controller: widget.controller,
      onChanged: (value) {
        _debouncer.run(() {
          _runValidationCheck(value);
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onTap: _onTap(),
      enabled: widget.disabled != null ? !widget.disabled! : true,
      readOnly: _isReadOnly(),
      decoration: InputDecoration(
        contentPadding: _getPadding(),
        hintText: widget.placeholder,
        hintStyle: TextStyle(
          color:
              CuReDesign.useDarkMode ? Colors.grey.shade600 : Colors.grey[400],
        ),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 6,
                ),
                child: Icon(
                  widget.prefixIcon,
                  color: _getIconColor(),
                ),
              )
            : null,
        suffixIcon: _getSuffix(),
        focusedBorder: OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: _getBorderColor(),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: _getBorderColor(),
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: _getBorderColor(),
            width: 1,
          ),
        ),
        filled: true,
        fillColor: widget.color != null
            ? widget.color!
            : CuReDesign.useDarkMode
                ? const Color(0xff202020)
                : Colors.grey[200],
      ),
      obscureText: _isPasswordField() && !showPassword,
    );
  }

  bool _isReadOnly() {
    return (widget.readonly != null && widget.readonly!) ||
        widget.options != null ||
        (widget.type != null &&
            (widget.type == CuReTextFieldType.datetime ||
                widget.type == CuReTextFieldType.date ||
                widget.type == CuReTextFieldType.time));
  }

  dynamic _onTap() {
    if (widget.options != null) {
      return () {
        if (CuReUtils.isIos()) {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return CupertinoActionSheet(
                  title: Text(
                      widget.label ?? CuReLocalization.get('select_an_option')),
                  actions: <Widget>[
                    for (var option in widget.options!)
                      CupertinoActionSheetAction(
                        onPressed: () {
                          widget.controller.text = option.label!;
                          if (widget.onChanged != null) {
                            widget.onChanged!(option.value);
                          }
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (option.icon != null)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        option.icon,
                                        color: _getIconColor(),
                                        size: 20,
                                      ),
                                    ),
                                  Text(option.label!),
                                ],
                              ),
                              if (widget.controller.text == option.label)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    CuReIcons.check,
                                    size: 18,
                                    color: CuReDesign.primaryColor,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isDefaultAction: true,
                    child: Text(
                      CuReLocalization.get('cancel'),
                    ),
                  ));
            },
          );
        } else {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      widget.label ?? CuReLocalization.get('select_an_option'),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const Divider(height: 1),
                  ...widget.options!.map((option) {
                    final isSelected = widget.controller.text == option.label;
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (option.icon != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                option.icon,
                                color: _getIconColor(),
                                size: 20,
                              ),
                            ),
                          Text(option.label!),
                        ],
                      ),
                      trailing: isSelected
                          ? Icon(
                              CuReIcons.check,
                              size: 18,
                              color: CuReDesign.primaryColor,
                            )
                          : null,
                      onTap: () {
                        widget.controller.text = option.label!;
                        widget.onChanged?.call(option.value);
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                  const Divider(height: 1),
                  ListTile(
                    title: Center(
                      child: Text(
                        CuReLocalization.get('cancel'),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          );
        }
      };
    }
    if (widget.type != null &&
        (widget.type == CuReTextFieldType.datetime ||
            widget.type == CuReTextFieldType.date ||
            widget.type == CuReTextFieldType.time)) {
      if (CuReUtils.isIos()) {
        return () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.white,
                height: 260,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getDateValidationInfo(),
                    CuReSpacing.vertical(),
                    SizedBox(
                      height: 160,
                      child: CupertinoDatePicker(
                        initialDateTime: _getInitialDateTime(),
                        minimumDate: widget.validator != null &&
                                widget.validator!.minDate != null
                            ? widget.validator!.minDate
                            : null,
                        maximumDate: widget.validator != null &&
                                widget.validator!.maxDate != null
                            ? widget.validator!.maxDate
                            : null,
                        use24hFormat:
                            MediaQuery.of(context).alwaysUse24HourFormat,
                        mode: widget.type == CuReTextFieldType.datetime
                            ? CupertinoDatePickerMode.dateAndTime
                            : widget.type == CuReTextFieldType.date
                                ? CupertinoDatePickerMode.date
                                : CupertinoDatePickerMode.time,
                        onDateTimeChanged: (value) {
                          widget.controller.text = _getDateTimeText(value);
                          if (widget.onChanged != null) {
                            widget.onChanged!(value);
                          }
                          _runValidationCheck(value.toString());
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        };
      } else {
        return () async {
          DateTime? picked = DateTime.now();

          DateTime? initialDate;
          if (widget.type != null) {
            if (widget.type == CuReTextFieldType.time) {
              initialDate = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                widget.controller.text != ''
                    ? int.parse(widget.controller.text.split(':')[0].toString())
                    : DateTime.now().hour,
                widget.controller.text != ''
                    ? int.parse(widget.controller.text.split(':')[1].toString())
                    : DateTime.now().minute,
              );
            }
          }

          initialDate ??= widget.controller.text.isNotEmpty
              ? DateTime.parse(widget.controller.text)
              : DateTime.now();

          // Date picker
          if (widget.type != null && widget.type == CuReTextFieldType.date) {
            picked = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate:
                  widget.validator != null && widget.validator!.minDate != null
                      ? widget.validator!.minDate!
                      : DateTime(1900),
              lastDate:
                  widget.validator != null && widget.validator!.maxDate != null
                      ? widget.validator!.maxDate!
                      : DateTime.now(),
            );
          }

          // Time picker
          if (widget.type != null && widget.type == CuReTextFieldType.time) {
            TimeOfDay? time = await showTimePicker(
              // ignore: use_build_context_synchronously
              context: context,
              initialTime: TimeOfDay.fromDateTime(initialDate),
            );

            if (time != null) {
              picked = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                time.hour,
                time.minute,
              );
            }
          }

          // Date and time picker
          if (widget.type != null &&
              widget.type == CuReTextFieldType.datetime) {
            showDatePicker(
              // ignore: use_build_context_synchronously
              context: context,
              initialDate: initialDate,
              firstDate:
                  widget.validator != null && widget.validator!.minDate != null
                      ? widget.validator!.minDate!
                      : DateTime(1900),
              lastDate:
                  widget.validator != null && widget.validator!.maxDate != null
                      ? widget.validator!.maxDate!
                      : DateTime.now(),
            ).then((date) {
              if (date != null) {
                showTimePicker(
                  // ignore: use_build_context_synchronously
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(initialDate!),
                ).then((time) {
                  if (time != null) {
                    picked = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      time.hour,
                      time.minute,
                    );
                  }
                });
              }
            });
          }

          if (picked != null) {
            widget.controller.text = _getDateTimeText(picked!);
            _runValidationCheck(picked.toString());
          }
        };
      }
    }
  }

  DateTime? _getInitialDateTime() {
    if (widget.controller.text.isNotEmpty) {
      if (widget.type == CuReTextFieldType.time) {
        final timeParts = widget.controller.text.split(':');
        return DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(timeParts[0]),
          int.parse(timeParts[1]),
        );
      } else {
        return DateTime.parse(widget.controller.text);
      }
    }
    if (widget.validator != null && widget.validator!.maxDate != null) {
      return widget.validator!.maxDate;
    }
    return DateTime.now();
  }

  String _getDateTimeText(DateTime value) {
    if (widget.type == CuReTextFieldType.datetime) {
      final splittedValue = value.toString().split(':');
      return '${splittedValue[0]}:${splittedValue[1]}';
    } else if (widget.type == CuReTextFieldType.date) {
      final splittedValue = value.toString().split(' ');
      return splittedValue[0];
    } else {
      final splittedValue = value.toString().split(' ');
      final splittedTime = splittedValue[1].split(':');
      return '${splittedTime[0]}:${splittedTime[1]}';
    }
  }

  Widget _getDateValidationInfo() {
    if (widget.validator != null) {
      String infoText = '';
      String type = 'date';
      if (widget.type == CuReTextFieldType.time) {
        type = 'time';
      }

      if (widget.validator!.minDate != null &&
          widget.validator!.maxDate != null) {
        infoText =
            'Select a $type between ${_getDateTimeText(widget.validator!.minDate!)} and ${_getDateTimeText(widget.validator!.maxDate!)}';
      } else if (widget.validator!.minDate != null) {
        infoText =
            'Select a $type after ${_getDateTimeText(widget.validator!.minDate!)}';
      } else if (widget.validator!.maxDate != null) {
        infoText =
            'Select a $type before ${_getDateTimeText(widget.validator!.maxDate!)}';
      }

      if (widget.validator!.minDate != null ||
          widget.validator!.maxDate != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.info_outline,
                color: Colors.grey,
                size: 22,
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: CuReText(
                  infoText,
                  color: Colors.grey,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      }
    }
    return const SizedBox();
  }

  Widget? _getSuffix() {
    if (widget.suffix != null) {
      return widget.suffix;
    }
    if (widget.options != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Icon(
          CuReIcons.list,
          color: _getIconColor(),
        ),
      );
    }
    return widget.suffixIcon != null
        ? Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(widget.suffixIcon, color: _getIconColor()),
          )
        : _isPasswordField()
            ? Padding(
                padding: const EdgeInsets.only(right: 4),
                child: CuReButton(
                  shape: widget.shape,
                  color: _getIconColor(),
                  minSize: const Size(0, 0),
                  icon: !showPassword ? Icons.visibility_off : Icons.visibility,
                  type: CuReButtonType.text,
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              )
            : null;
  }

  EdgeInsets _getPadding() {
    if (widget.prefixIcon != null && widget.suffixIcon != null) {
      return const EdgeInsets.symmetric(horizontal: 8, vertical: 14);
    } else if (widget.prefixIcon != null && widget.suffixIcon == null) {
      return const EdgeInsets.only(top: 14, bottom: 14, left: 8, right: 16);
    } else if (widget.prefixIcon == null && widget.suffixIcon != null) {
      return const EdgeInsets.only(top: 14, bottom: 14, left: 16, right: 8);
    } else {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 14);
    }
  }

  Color _getBorderColor() {
    if (isInvalid) {
      return CuReDesign.dangerColor;
    } else if (widget.showBorder != null && widget.showBorder!) {
      return CuReDesign.primaryColor;
    } else {
      return Colors.transparent;
    }
  }

  Color _getIconColor() {
    if (isInvalid) {
      return CuReDesign.dangerColor;
    } else if (widget.disabled != null && widget.disabled! ||
        (widget.readonly != null && widget.readonly!)) {
      return CuReDesign.disabledColor;
    } else {
      if (CuReDesign.useDarkMode) {
        return CuReUtils.lighten(CuReDesign.primaryColor, 0.1);
      } else {
        return CuReDesign.primaryColor;
      }
    }
  }

  bool _isPasswordField() {
    return widget.type != null && widget.type! == CuReTextFieldType.password;
  }

  String _getErrorText(errorText) {
    return errorText;
  }

  String? _checkValidation(String value) {
    // Number validation
    if (widget.type != null && widget.type! == CuReTextFieldType.number) {
      if (!_isNumber(value)) {
        return _getErrorText(Localization.getValue('field_number_error'));
      }
    }

    // Email validation
    if (widget.type != null && widget.type! == CuReTextFieldType.email) {
      if (!CuReUtils.isEmailValid(value)) {
        return _getErrorText(Localization.getValue('field_email_error'));
      }
    }

    if (widget.validator != null) {
      // Required validation
      if (widget.validator!.required != null &&
          widget.validator!.required! &&
          (value.isEmpty || value.trim() == '')) {
        return _getErrorText(Localization.getValue('field_required_error'));
      }

      // Min length validation
      if (widget.validator!.min != null) {
        if (widget.type == null || widget.type! == CuReTextFieldType.text) {
          if (value.length < widget.validator!.min!) {
            return _getErrorText(
                '${Localization.getValue('field_min_chars_error')} ${widget.validator!.min} ${Localization.getValue('characters')}');
          }
        } else if (widget.type == CuReTextFieldType.number) {
          if (double.parse(value) < widget.validator!.min!) {
            return _getErrorText(
              '${Localization.getValue('field_min_error')} ${widget.validator!.min}',
            );
          }
        }
      }

      // Max length validation
      if (widget.validator!.max != null) {
        if (widget.type == null || widget.type! == CuReTextFieldType.text) {
          if (value.length > widget.validator!.max!) {
            return _getErrorText(
                '${Localization.getValue('field_max_chars_error')} ${widget.validator!.max} ${Localization.getValue('characters')}');
          }
        } else if (widget.type == CuReTextFieldType.number) {
          if (double.parse(value) > widget.validator!.max!) {
            return _getErrorText(
              '${Localization.getValue('field_max_error')} ${widget.validator!.max}',
            );
          }
        }
      }

      // Password validation
      if (widget.type != null &&
          widget.type! == CuReTextFieldType.password &&
          widget.validator!.securePassword != null &&
          widget.validator!.securePassword!) {
        if (!_isPasswordSecure(value)) {
          return _getErrorText(
            Localization.getValue(
              'password_not_safe_error',
            ),
          );
        }
      }

      // Min age validation
      if (widget.validator!.minAge != null) {
        final currentDate = DateTime.now();
        final birthDate = DateTime.parse(value);
        int age = currentDate.year - birthDate.year;
        if (currentDate.month < birthDate.month ||
            (currentDate.month == birthDate.month &&
                currentDate.day < birthDate.day)) {
          age--;
        }
        if (age < widget.validator!.minAge!) {
          return _getErrorText(
            '${Localization.getValue('age_min_error')} ${widget.validator!.minAge} ${Localization.getValue('years_old')}',
          );
        }
      }

      // Max age validation
      if (widget.validator!.maxAge != null) {
        final currentDate = DateTime.now();
        final birthDate = DateTime.parse(value);
        int age = currentDate.year - birthDate.year;
        if (currentDate.month < birthDate.month ||
            (currentDate.month == birthDate.month &&
                currentDate.day < birthDate.day)) {
          age--;
        }
        if (age > widget.validator!.maxAge!) {
          return _getErrorText(
            '${Localization.getValue('age_max_error')} ${widget.validator!.maxAge} ${Localization.getValue('years_old')}',
          );
        }
      }

      // No spaces validation
      if (widget.validator!.noSpaces != null && widget.validator!.noSpaces!) {
        if (value.contains(' ')) {
          return _getErrorText(Localization.getValue('field_no_spaces_error'));
        }
      }

      // Regex validation
      if (widget.validator!.regex != null) {
        if (!widget.validator!.regex!.hasMatch(value)) {
          if (widget.validator!.errorText != null) {
            return widget.validator!.errorText;
          } else {
            return _getErrorText(Localization.getValue('invalid_format_erorr'));
          }
        }
      }
    }

    return null;
  }

  bool _isNumber(String value) {
    return RegExp(r'^[0-9]+$').hasMatch(value);
  }

  bool _isPasswordSecure(String password) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }

  BorderRadius _getBorderRadius() {
    if (widget.borderRadius != null) {
      return BorderRadius.circular(widget.borderRadius!);
    } else {
      return Utils.getBorderRadius(widget.shape);
    }
  }
}
