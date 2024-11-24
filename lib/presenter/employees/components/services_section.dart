import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/employees/components/details_divider.dart';
import 'package:kazi_companies/presenter/employees/components/section_form_field.dart';
import 'package:kazi_core/kazi_core.dart';

class ServicesSection extends StatefulWidget {
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
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  final services = <ServiceType>[];
  final servicesLists = <List<ServiceType>>[];

  @override
  void initState() {
    if (widget.user != null) {
      services.addAll(widget.user!.services);
    }
    _generateServicesLists();

    super.initState();
  }

  void _generateServicesLists() {
    if (services.isEmpty) {
      _addService();
      return;
    }

    servicesLists.addAll(services.chunked<ServiceType>(3));
  }

  void _addService() {
    servicesLists.add(
      [
        ServiceType(
          id: 0,
          name: '',
          userId: widget.user?.id ?? 0,
          defaultValue: 0,
          discountPercent: 0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KaziSpacings.verticalLg,
        DetailsDivider(text: KaziLocalizations.current.services),
        KaziSpacings.verticalLg,
        Padding(
          padding: widget.padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _getColumns(),
          ),
        ),
      ],
    );
  }

  List<Widget> _getColumns() {
    final response = <Widget>[];

    for (int i = 0; i < servicesLists.length; i++) {
      final list = servicesLists[i];
      final isLastService = i == services.length;
      final hasMoreColumns = i < servicesLists.length - 1;

      response.add(_getColumn(list, isLastService));
      if (hasMoreColumns) response.add(KaziSpacings.horizontalXLg);
    }

    return response;
  }

  Widget _getColumn(List<ServiceType> services, bool isLastService) {
    if (widget.isForm) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...services.map(
            (service) => SectionFormField(
              size: SectionFormFieldSize.md,
              label: KaziLocalizations.current.service,
              initialValue: service.name,
              onTap: isLastService ? () {} : null,
            ),
          ),
          KaziSpacings.verticalXLg,
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...services.map((service) => Text(service.name)),
        KaziSpacings.verticalXLg,
      ],
    );
  }
}
