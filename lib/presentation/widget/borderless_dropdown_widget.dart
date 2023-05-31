import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meman/core/utils/res/app_colors.dart';
import 'package:meman/core/utils/res/app_text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BorderlessDropdownWidget<T> extends HookWidget {
  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T>? onChanged;

  const BorderlessDropdownWidget({
    Key? key,
    required this.items,
    this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedValueState = useState<T?>(selectedValue);

    void _handleValueChanged(T? value) {
      selectedValueState.value = value;
      onChanged?.call(value!);
    }

    return DropdownButton<T>(
      value: selectedValueState.value,
      onChanged: _handleValueChanged,
      underline: const SizedBox(),
      style: AppTextStyles.headingOne.copyWith(color: AppColors.primaryDark),
      icon: Icon(PhosphorIcons.caretDownBold, color: AppColors.muted, size: 15),
      items: items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
