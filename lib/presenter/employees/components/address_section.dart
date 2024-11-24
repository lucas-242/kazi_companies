import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/employees/components/details_divider.dart';
import 'package:kazi_companies/presenter/employees/components/section_form_field.dart';
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
    final address = user?.addresses.firstOrNull ??
        const Address(
          id: 0,
          postalCode: '',
          street: '',
          neighborhood: '',
          city: '',
          state: '',
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KaziSpacings.verticalLg,
        DetailsDivider(text: KaziLocalizations.current.address),
        KaziSpacings.verticalLg,
        Padding(
          padding: padding,
          child: isForm
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SectionFormField(
                          size: SectionFormFieldSize.md,
                          label: KaziLocalizations.current.address,
                          initialValue: address.street,
                        ),
                        KaziSpacings.horizontalXLg,
                        SectionFormField(
                          label: 'Número',
                          initialValue: address.number?.toString(),
                        ),
                      ],
                    ),
                    KaziSpacings.verticalXs,
                    Row(
                      children: [
                        SectionFormField(
                          label: 'Postal Code',
                          initialValue: address.postalCode,
                        ),
                        KaziSpacings.horizontalXLg,
                        SectionFormField(
                          label: 'Bairro',
                          initialValue: address.neighborhood,
                        ),
                      ],
                    ),
                    KaziSpacings.verticalXs,
                    Row(
                      children: [
                        SectionFormField(
                          label: 'Cidade',
                          initialValue: address.city,
                        ),
                        KaziSpacings.horizontalXLg,
                        SectionFormField(
                          label: 'Estado',
                          initialValue: address.state,
                        ),
                      ],
                    ),
                    KaziSpacings.verticalXs,
                    SectionFormField(
                      size: SectionFormFieldSize.md,
                      label: 'Complemento',
                      initialValue: address.complement,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.normalizedAddress),
                    KaziSpacings.verticalXs,
                    Text(address.postalCode),
                    KaziSpacings.verticalXs,
                    Text(address.normalizedCity),
                    if (address.complement != null) ...[
                      KaziSpacings.verticalXs,
                      Text(address.complement!),
                    ],
                  ],
                ),
        ),
      ],
    );
  }
}
