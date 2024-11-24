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
  final User? user;

  @override
  Widget build(BuildContext context) {
    final phone = user?.phones.firstOrNull ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KaziSpacings.verticalLg,
        DetailsDivider(text: KaziLocalizations.current.contact),
        KaziSpacings.verticalLg,
        Padding(
          padding: padding,
          child: Row(
            children: [
              if (isForm)
                SectionFormField(
                  label: KaziLocalizations.current.email,
                  initialValue: user?.email,
                )
              else
                Text(user?.email ?? ''),
              KaziSpacings.horizontalXLg,
              if (isForm)
                SectionFormField(
                  label: 'Telefone',
                  initialValue: phone,
                )
              else
                Text(phone),
            ],
          ),
        ),
      ],
    );
  }
}
