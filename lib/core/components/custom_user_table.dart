import 'package:flutter/material.dart';
import 'package:kazi_companies/core/components/cell.dart';
import 'package:kazi_core/kazi_core.dart';

class CustomUserTable extends StatelessWidget {
  const CustomUserTable({
    super.key,
    required this.data,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    this.showActions = true,
  });

  final List<User> data;
  final void Function(User) onTap;
  final void Function(User) onEdit;
  final void Function(User) onDelete;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Cell(text: KaziLocalizations.current.name, isHeader: true),
            Cell(text: KaziLocalizations.current.email, isHeader: true),
            Cell(text: KaziLocalizations.current.role, isHeader: true),
            if (showActions)
              Cell(text: KaziLocalizations.current.actions, isHeader: true),
          ],
        ),
        const Divider(),
        ...data.map(
          (user) => Column(
            children: [
              GestureDetector(
                onTap: () => onTap(user),
                child: Row(
                  children: [
                    Cell(text: user.name),
                    Cell(text: user.email),
                    Cell(text: user.role ?? ''),
                    if (showActions)
                      Cell(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
