import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviesapp/features/characters/store/character_store.dart';

class FilterBar extends StatelessWidget {
  final CharacterStore store;

  const FilterBar({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => DropdownButton<String>(
        value: store.selectedGender,
        isExpanded: true,
        underline: Container(),
        items: const [
          DropdownMenuItem(value: 'ALL', child: Text('Todos')),
          DropdownMenuItem(value: 'MALE', child: Text('Masculino')),
          DropdownMenuItem(value: 'FEMALE', child: Text('Femenino')),
          DropdownMenuItem(value: 'UNKNOWN', child: Text('Desconocido')),
        ],
        onChanged: (value) {
          if (value != null) {
            store.setGenderFilter(value);
          }
        },
      ),
    );
  }
}
