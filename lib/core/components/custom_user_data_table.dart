import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CustomUserDataTable extends StatelessWidget {
  const CustomUserDataTable({
    super.key,
    required this.data,
    required this.onTap,
  });

  final List<User> data;
  final void Function(User) onTap;

  @override
  Widget build(BuildContext context) {
    final columns = <PlutoColumn>[
      PlutoColumn(
        title: '',
        field: 'id',
        type: PlutoColumnType.number(),
        hide: true,
      ),
      PlutoColumn(
        title: KaziLocalizations.current.name,
        field: 'name',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: KaziLocalizations.current.email,
        field: 'email',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: KaziLocalizations.current.role,
        field: 'role',
        type: PlutoColumnType.text(),
      ),
    ];

    final rows = <PlutoRow>[
      ...data.map(
        (u) => PlutoRow(
          key: Key(u.id.toString()),
          cells: {
            'id': PlutoCell(value: u.id),
            'name': PlutoCell(value: u.name),
            'email': PlutoCell(value: u.email),
            'role': PlutoCell(value: u.role ?? ''),
          },
        ),
      ),
    ];

    return PlutoGrid(
      columns: columns,
      rows: rows,
      onSelected: _onSelect,
      mode: PlutoGridMode.selectWithOneTap,
      configuration: const PlutoGridConfiguration(
        localeText: PlutoGridLocaleText.brazilianPortuguese(),
      ),
    );
  }

  void _onSelect(PlutoGridOnSelectedEvent event) {
    final id = event.row?.cells.entries.first.value.value as int? ?? 0;
    final user = data.firstWhere((d) => d.id == id);
    onTap(user);
  }
}
