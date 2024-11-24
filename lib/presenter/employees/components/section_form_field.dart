import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';

enum SectionFormFieldSize { sm, md, lg }

class SectionFormField extends StatelessWidget {
  const SectionFormField({
    super.key,
    this.size = SectionFormFieldSize.sm,
    required this.label,
    this.initialValue,
    this.initialDate,
    this.onTap,
  });
  final SectionFormFieldSize size;
  final String label;
  final String? initialValue;
  final DateTime? initialDate;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
      text: initialDate != null ? initialDate.toString() : initialValue,
    );

    final today = DateTime.now();

    double getWidth() {
      switch (size) {
        case SectionFormFieldSize.sm:
          return context.width * .14;
        case SectionFormFieldSize.md:
          return context.width * .24;
        case SectionFormFieldSize.lg:
          return context.width * .34;
      }
    }

    return SizedBox(
      width: context.whenScreenSize(
        xs: context.width,
        sm: context.width * .7,
        lg: getWidth(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: initialDate != null
                ? KaziDatePicker(
                    controller: controller,
                    onChange: (date) {},
                    label: label,
                    firstDate: DateTime(today.year - 100),
                    lastDate: today,
                  )
                : KaziTextFormField(
                    labelText: label,
                    controller: controller,
                  ),
          ),
          if (onTap != null) ...[
            KaziSpacings.horizontalMd,
            KaziCircularButton(
              onTap: onTap,
              child: const Icon(Icons.add),
            ),
          ],
        ],
      ),
    );
  }
}
