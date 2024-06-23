import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/components/details_divider.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:kazi_design_system/kazi_design_system.dart';

class EmployeeDetailsPage extends StatelessWidget {
  EmployeeDetailsPage({super.key, required this.id});
  final int id;
  final user = User.toCreate(
    name: 'Jupira Sem Dente',
    email: 'jupirinha_dentinho@test.com',
  );

  @override
  Widget build(BuildContext context) {
    final edgeInsets = EdgeInsets.only(
      left: context.width * 0.02 + KaziInsets.sm,
      right: KaziInsets.md,
    );

    return Scaffold(
      body: KaziSafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: edgeInsets,
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
                        Text(user.name, style: KaziTextStyles.headlineMd),
                        KaziSpacings.verticalSm,
                        const Text('Maquiadora'),
                      ],
                    ),
                  ],
                ),
              ),
              KaziSpacings.verticalLg,
              DetailsDivider(text: KaziLocalizations.current.contact),
              KaziSpacings.verticalLg,
              Padding(
                padding: edgeInsets,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('(21) 99999-9999'),
                    KaziSpacings.verticalXs,
                    const Text('(21) 98888-8888'),
                    KaziSpacings.verticalXs,
                    Text(user.email),
                    KaziSpacings.verticalXs,
                  ],
                ),
              ),
              KaziSpacings.verticalLg,
              DetailsDivider(text: KaziLocalizations.current.address),
              KaziSpacings.verticalLg,
              Padding(
                padding: edgeInsets,
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
              KaziSpacings.verticalLg,
              DetailsDivider(text: KaziLocalizations.current.services),
              KaziSpacings.verticalLg,
              Padding(
                padding: edgeInsets,
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
          ),
        ),
      ),
    );
  }
}
