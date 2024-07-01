import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';

class CustomUserDataTable extends StatelessWidget {
  const CustomUserDataTable({
    super.key,
    required this.data,
    required this.headers,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    this.showActions = true,
  });

  final List<User> data;
  final List<String> headers;
  final void Function(User) onTap;
  final void Function(User) onEdit;
  final void Function(User) onDelete;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        showCheckboxColumn: false,
        columnSpacing: context.whenScreenSize(
          xs: KaziInsets.xs,
          sm: context.width * .022,
          md: context.width * .092,
          lg: context.width * .112,
          xLg: context.width * .144,
          xxLg: context.width * .152,
          xxxLg: context.width * .174,
        ),
        border: TableBorder.all(
          color: KaziColors.black,
          borderRadius: const BorderRadius.all(Radius.circular(KaziInsets.xs)),
        ),
        columns: [
          ...headers.map((e) => DataColumn(label: Text(e))),
          if (showActions) const DataColumn(label: Text('Ações')),
        ],
        rows: data
            .map(
              (user) => DataRow(
                onSelectChanged: (_) => onTap(user),
                cells: [
                  DataCell(Text(user.name)),
                  DataCell(Text(user.email)),
                  DataCell(Text(user.email)),
                  if (showActions)
                    DataCell(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => onEdit(user),
                            child: const Icon(Icons.edit),
                          ),
                          KaziSpacings.horizontalMd,
                          GestureDetector(
                            onTap: () => onDelete(user),
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
