import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:intl/intl.dart';

class InputDateWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final DateFormat format;
  final String? initialValue;
  final String? Function(DateTime?)? validator;
  final TextEditingController? controller;
  final void Function(DateTime? value) onChanged;

  const InputDateWidget(
      {Key? key,
      required this.label,
      required this.icon,
      required this.format,
      this.initialValue,
      this.validator,
      this.controller,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          DateTimeField(
              format: format,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100),
                );
              },
              style: TextStyles.input,
              decoration: InputDecoration(
                  labelText: label,
                  labelStyle: TextStyles.input,
                  contentPadding: EdgeInsets.zero,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Icon(
                          icon,
                          color: AppColors.primary,
                        ),
                      ),
                      Container(width: 1, height: 48, color: AppColors.stroke)
                    ],
                  ),
                  border: InputBorder.none)),
          Divider(height: 1, thickness: 1, color: AppColors.stroke)
        ],
      ),
    );
  }
}
