import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/buttons/custom_dropdown_button.dart';

class LabeledDropdownSelector extends StatefulWidget {
  final String label;
  final String? sublabel;
  final List<String> items;
  final Function(String?) onChanged;
  final String? value;

  const LabeledDropdownSelector({
    super.key,
    required this.label,
    this.sublabel,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  State<LabeledDropdownSelector> createState() =>
      _LabeledDropdownSelectorState();
}

class _LabeledDropdownSelectorState extends State<LabeledDropdownSelector> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.value != null && widget.items.contains(widget.value)) {
      selectedValue = widget.value;
    }
  }

  @override
  void didUpdateWidget(LabeledDropdownSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value &&
        widget.value != null &&
        widget.items.contains(widget.value)) {
      setState(() {
        selectedValue = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedValue != null && !widget.items.contains(selectedValue)) {
      selectedValue = null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText(
          text: widget.label,
          weight: FontWeight.w400,
        ),
        if (widget.sublabel != null)
          BodyText(
            text: widget.sublabel!,
            color: AppColors.textTertiaryColor,
          ),
        const SizedBox(height: AppSizes.vertical_3),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grayLightColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            isExpanded: true,
            icon: Image.asset(
              'assets/icons/icon_dropdown.png',
              width: 20,
              height: 20,
            ),
            underline: Container(),
            hint: Text(
              'Select ${widget.label}',
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
