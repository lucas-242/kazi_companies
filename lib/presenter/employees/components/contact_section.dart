import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/employees/components/details_divider.dart';
import 'package:kazi_companies/presenter/employees/components/section_form_field.dart';
import 'package:kazi_core/kazi_core.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    this.isForm = false,
    required this.padding,
    required this.user,
  });

  final bool isForm;
  final EdgeInsets padding;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KaziSpacings.verticalLg,
        DetailsDivider(text: KaziLocalizations.current.contact),
        KaziSpacings.verticalLg,
        Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isForm)
                const SectionFormField(label: 'Tel 1')
              else
                const Text('(21) 99999-9999'),
              KaziSpacings.verticalXs,
              if (isForm)
                const SectionFormField(label: 'Tel 2')
              else
                const Text('(21) 98888-8888'),
              KaziSpacings.verticalXs,
              if (isForm)
                SectionFormField(label: KaziLocalizations.current.email)
              else
                Text(user.email),
              KaziSpacings.verticalXs,
            ],
          ),
        ),
      ],
    );
  }
}
