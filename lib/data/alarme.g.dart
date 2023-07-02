// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarme.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Alarme on AlarmeBase, Store {
  late final _$dummyAtom = Atom(name: 'AlarmeBase.dummy', context: context);

  @override
  int get dummy {
    _$dummyAtom.reportRead();
    return super.dummy;
  }

  @override
  set dummy(int value) {
    _$dummyAtom.reportWrite(value, super.dummy, () {
      super.dummy = value;
    });
  }

  late final _$ativadoAtom = Atom(name: 'AlarmeBase.ativado', context: context);

  @override
  bool get ativado {
    _$ativadoAtom.reportRead();
    return super.ativado;
  }

  @override
  set ativado(bool value) {
    _$ativadoAtom.reportWrite(value, super.ativado, () {
      super.ativado = value;
    });
  }

  late final _$nomeAtom = Atom(name: 'AlarmeBase.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$horaAtom = Atom(name: 'AlarmeBase.hora', context: context);

  @override
  TimeOfDay get hora {
    _$horaAtom.reportRead();
    return super.hora;
  }

  @override
  set hora(TimeOfDay value) {
    _$horaAtom.reportWrite(value, super.hora, () {
      super.hora = value;
    });
  }

  late final _$diasSemanaAtom =
      Atom(name: 'AlarmeBase.diasSemana', context: context);

  @override
  ObservableList<bool> get diasSemana {
    _$diasSemanaAtom.reportRead();
    return super.diasSemana;
  }

  @override
  set diasSemana(ObservableList<bool> value) {
    _$diasSemanaAtom.reportWrite(value, super.diasSemana, () {
      super.diasSemana = value;
    });
  }

  late final _$diasRepeticaoAtom =
      Atom(name: 'AlarmeBase.diasRepeticao', context: context);

  @override
  int get diasRepeticao {
    _$diasRepeticaoAtom.reportRead();
    return super.diasRepeticao;
  }

  @override
  set diasRepeticao(int value) {
    _$diasRepeticaoAtom.reportWrite(value, super.diasRepeticao, () {
      super.diasRepeticao = value;
    });
  }

  late final _$diasRepeticaoStrAtom =
      Atom(name: 'AlarmeBase.diasRepeticaoStr', context: context);

  @override
  String get diasRepeticaoStr {
    _$diasRepeticaoStrAtom.reportRead();
    return super.diasRepeticaoStr;
  }

  @override
  set diasRepeticaoStr(String value) {
    _$diasRepeticaoStrAtom.reportWrite(value, super.diasRepeticaoStr, () {
      super.diasRepeticaoStr = value;
    });
  }

  late final _$sonecaAtom = Atom(name: 'AlarmeBase.soneca', context: context);

  @override
  int get soneca {
    _$sonecaAtom.reportRead();
    return super.soneca;
  }

  @override
  set soneca(int value) {
    _$sonecaAtom.reportWrite(value, super.soneca, () {
      super.soneca = value;
    });
  }

  late final _$sonecaStrAtom =
      Atom(name: 'AlarmeBase.sonecaStr', context: context);

  @override
  String get sonecaStr {
    _$sonecaStrAtom.reportRead();
    return super.sonecaStr;
  }

  @override
  set sonecaStr(String value) {
    _$sonecaStrAtom.reportWrite(value, super.sonecaStr, () {
      super.sonecaStr = value;
    });
  }

  late final _$toqueMusicalAtom =
      Atom(name: 'AlarmeBase.toqueMusical', context: context);

  @override
  String get toqueMusical {
    _$toqueMusicalAtom.reportRead();
    return super.toqueMusical;
  }

  @override
  set toqueMusical(String value) {
    _$toqueMusicalAtom.reportWrite(value, super.toqueMusical, () {
      super.toqueMusical = value;
    });
  }

  late final _$toqueAtivadoAtom =
      Atom(name: 'AlarmeBase.toqueAtivado', context: context);

  @override
  bool get toqueAtivado {
    _$toqueAtivadoAtom.reportRead();
    return super.toqueAtivado;
  }

  @override
  set toqueAtivado(bool value) {
    _$toqueAtivadoAtom.reportWrite(value, super.toqueAtivado, () {
      super.toqueAtivado = value;
    });
  }

  late final _$vibracaoAtivadaAtom =
      Atom(name: 'AlarmeBase.vibracaoAtivada', context: context);

  @override
  bool get vibracaoAtivada {
    _$vibracaoAtivadaAtom.reportRead();
    return super.vibracaoAtivada;
  }

  @override
  set vibracaoAtivada(bool value) {
    _$vibracaoAtivadaAtom.reportWrite(value, super.vibracaoAtivada, () {
      super.vibracaoAtivada = value;
    });
  }

  late final _$AlarmeBaseActionController =
      ActionController(name: 'AlarmeBase', context: context);

  @override
  void switchAtivado() {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.switchAtivado');
    try {
      return super.switchAtivado();
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarNome(String? novoNome) {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.alterarNome');
    try {
      return super.alterarNome(novoNome);
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarHora(TimeOfDay novaHora) {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.alterarHora');
    try {
      return super.alterarHora(novaHora);
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarDia(int indice) {
    final _$actionInfo =
        _$AlarmeBaseActionController.startAction(name: 'AlarmeBase.alterarDia');
    try {
      return super.alterarDia(indice);
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarRepeticao(int novoIntervalo) {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.alterarRepeticao');
    try {
      return super.alterarRepeticao(novoIntervalo);
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarSoneca(int novaSoneca) {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.alterarSoneca');
    try {
      return super.alterarSoneca(novaSoneca);
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarToque(String novoToque) {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.alterarToque');
    try {
      return super.alterarToque(novoToque);
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchToque() {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.switchToque');
    try {
      return super.switchToque();
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchVibracao() {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.switchVibracao');
    try {
      return super.switchVibracao();
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String diasSemanaString() {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.diasSemanaString');
    try {
      return super.diasSemanaString();
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String invervalosString() {
    final _$actionInfo = _$AlarmeBaseActionController.startAction(
        name: 'AlarmeBase.invervalosString');
    try {
      return super.invervalosString();
    } finally {
      _$AlarmeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dummy: ${dummy},
ativado: ${ativado},
nome: ${nome},
hora: ${hora},
diasSemana: ${diasSemana},
diasRepeticao: ${diasRepeticao},
diasRepeticaoStr: ${diasRepeticaoStr},
soneca: ${soneca},
sonecaStr: ${sonecaStr},
toqueMusical: ${toqueMusical},
toqueAtivado: ${toqueAtivado},
vibracaoAtivada: ${vibracaoAtivada}
    ''';
  }
}
