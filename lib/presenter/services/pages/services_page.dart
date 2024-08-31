import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
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
                KaziLocalizations.current.services,
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
