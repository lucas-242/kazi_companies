import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/employees/components/details_divider.dart';
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
  final User user;

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
          child: const Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Maquiagem Simples'),
                  KaziSpacings.verticalXs,
                  Text('Maquiagem de Casamento'),
                  KaziSpacings.verticalXs,
                  Text('Maquiagem Artística'),
                ],
              ),
              KaziSpacings.horizontalXLg,
              Column(
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
