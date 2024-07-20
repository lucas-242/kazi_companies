import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';

enum SectionFormFieldSize { sm, md, lg }

class SectionFormField extends StatelessWidget {
  const SectionFormField({
    super.key,
    this.size = SectionFormFieldSize.sm,
    required this.label,
    this.hasButton = false,
  });
  final SectionFormFieldSize size;
  final String label;
  final bool hasButton;

  @override
  Widget build(BuildContext context) {
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
          Expanded(child: KaziTextFormField(labelText: label)),
          if (hasButton) ...[
            KaziSpacings.horizontalMd,
            const KaziCircularButton(child: Icon(Icons.add)),
          ],
        ],
      ),
    );
  }
}
