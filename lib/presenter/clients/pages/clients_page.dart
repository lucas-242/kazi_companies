import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    return KaziSafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                KaziLocalizations.current.clients,
                style: KaziTextStyles.headlineMd,
              ),
              KaziCircularButton(
                child: const Icon(Icons.add),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
