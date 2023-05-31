import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DropdownWidget<T> extends HookWidget {
  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T>? onChanged;

  const DropdownWidget({
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

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: DropdownButton<T>(
        value: selectedValueState.value,
        onChanged: _handleValueChanged,
        underline: const SizedBox(),
        isExpanded: true,
        icon: const CircleAvatar(
          backgroundColor: Color(0xffEEEEEE),
          foregroundColor: Colors.black87,
          child: Icon(Icons.keyboard_arrow_down),
        ),
        items: items.map((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );
  }
}
