import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/employees/components/details_divider.dart';
import 'package:kazi_companies/presenter/employees/components/section_form_field.dart';
import 'package:kazi_core/kazi_core.dart';

class PersonalSection extends StatelessWidget {
  const PersonalSection({
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
        Padding(
          padding: padding,
          child: Row(
            children: [
              const CircleAvatar(
                radius: KaziInsets.xxxLg,
                child: KaziSvg(KaziSvgAssets.logo),
              ),
              KaziSpacings.horizontalXLg,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isForm)
                    SectionFormField(
                      size: SectionFormFieldSize.lg,
                      label: KaziLocalizations.current.name,
                    )
                  else
                    Text(user?.name ?? '', style: KaziTextStyles.headlineMd),
                  KaziSpacings.verticalSm,
                  if (isForm)
                    SectionFormField(
                      size: SectionFormFieldSize.md,
                      label: KaziLocalizations.current.role,
                    )
                  else
                    const Text('Maquiadora'),
                ],
              ),
            ],
          ),
        ),
        KaziSpacings.verticalLg,
        const DetailsDivider(text: 'Pessoal'),
        KaziSpacings.verticalLg,
        Padding(
          padding: padding,
          child: SizedBox(
            width: context.whenScreenSize(
              xs: context.width,
              lg: context.width * 0.35,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isForm)
                      const SectionFormField(label: 'CPF')
                    else
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'CPF: ',
                              style: KaziTextStyles.titleSm,
                            ),
                            const TextSpan(text: '123.456.789-00'),
                          ],
                        ),
                      ),
                    KaziSpacings.verticalXs,
                    if (isForm)
                      const SectionFormField(label: 'RG')
                    else
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'RG: ',
                              style: KaziTextStyles.titleSm,
                            ),
                            const TextSpan(text: '123.456-78'),
                          ],
                        ),
                      ),
                  ],
                ),
                KaziSpacings.horizontalXLg,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KaziSpacings.verticalXs,
                    if (isForm)
                      const SectionFormField(label: 'Nascimento')
                    else
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Nascimento: ',
                              style: KaziTextStyles.titleSm,
                            ),
                            const TextSpan(text: '06/11/2000'),
                          ],
                        ),
                      ),
                    KaziSpacings.verticalXs,
                    if (isForm)
                      const SectionFormField(label: 'Admissão')
                    else
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Admissão: ',
                              style: KaziTextStyles.titleSm,
                            ),
                            const TextSpan(text: '13/07/2024'),
                          ],
                        ),
                      ),
                    KaziSpacings.verticalXs,
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
