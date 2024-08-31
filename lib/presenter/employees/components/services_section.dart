import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/employees/components/details_divider.dart';
import 'package:kazi_companies/presenter/employees/components/section_form_field.dart';
import 'package:kazi_core/kazi_core.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KaziSpacings.verticalLg,
        DetailsDivider(text: KaziLocalizations.current.services),
        KaziSpacings.verticalLg,
        Padding(
          padding: padding,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionFormField(
                    label: KaziLocalizations.current.service,
                    hasButton: true,
                  ),
                  KaziSpacings.verticalXs,
                  const Text('Maquiagem Simples'),
                  KaziSpacings.verticalXs,
                  const Text('Maquiagem de Casamento'),
                  KaziSpacings.verticalXs,
                  const Text('Maquiagem Artística'),
                ],
              ),
              KaziSpacings.horizontalXLg,
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Maquiagem Simples'),
                  KaziSpacings.verticalXs,
                  Text('Maquiagem de Casamento'),
                  KaziSpacings.verticalXs,
                  Text('Maquiagem Artística'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
