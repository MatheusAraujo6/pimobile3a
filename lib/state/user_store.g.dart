// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$alarmesAtom =
      Atom(name: 'UserStoreBase.alarmes', context: context);

  @override
  ObservableList<Alarme> get alarmes {
    _$alarmesAtom.reportRead();
    return super.alarmes;
  }

  @override
  set alarmes(ObservableList<Alarme> value) {
    _$alarmesAtom.reportWrite(value, super.alarmes, () {
      super.alarmes = value;
    });
  }

  late final _$cardsAtom = Atom(name: 'UserStoreBase.cards', context: context);

  @override
  ObservableList<AlarmeCard> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<AlarmeCard> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  void criarAlarme(BuildContext context) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.criarAlarme');
    try {
      return super.criarAlarme(context);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
alarmes: ${alarmes},
cards: ${cards}
    ''';
  }
}
