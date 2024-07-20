import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/employees/components/details_divider.dart';
import 'package:kazi_core/kazi_core.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
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
        DetailsDivider(text: KaziLocalizations.current.address),
        KaziSpacings.verticalLg,
        Padding(
          padding: padding,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Estrada do Magarça, 1553 - Guaratiba'),
              KaziSpacings.verticalXs,
              Text('Bl. 03, Apto 108'),
              KaziSpacings.verticalXs,
              Text('Rio de Janeiro - RJ'),
            ],
          ),
        ),
      ],
    );
  }
}
