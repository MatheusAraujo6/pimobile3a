// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$displayAtom =
      Atom(name: 'UserStoreBase.display', context: context);

  @override
  String get display {
    _$displayAtom.reportRead();
    return super.display;
  }

  @override
  set display(String value) {
    _$displayAtom.reportWrite(value, super.display, () {
      super.display = value;
    });
  }

  late final _$dummyAtom = Atom(name: 'UserStoreBase.dummy', context: context);

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

  late final _$loadingAtom =
      Atom(name: 'UserStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$modoDeletarAtom =
      Atom(name: 'UserStoreBase.modoDeletar', context: context);

  @override
  bool get modoDeletar {
    _$modoDeletarAtom.reportRead();
    return super.modoDeletar;
  }

  @override
  set modoDeletar(bool value) {
    _$modoDeletarAtom.reportWrite(value, super.modoDeletar, () {
      super.modoDeletar = value;
    });
  }

  late final _$emailAtom = Atom(name: 'UserStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$erroLoginAtom =
      Atom(name: 'UserStoreBase.erroLogin', context: context);

  @override
  String get erroLogin {
    _$erroLoginAtom.reportRead();
    return super.erroLogin;
  }

  @override
  set erroLogin(String value) {
    _$erroLoginAtom.reportWrite(value, super.erroLogin, () {
      super.erroLogin = value;
    });
  }

  late final _$erroSignUpAtom =
      Atom(name: 'UserStoreBase.erroSignUp', context: context);

  @override
  String get erroSignUp {
    _$erroSignUpAtom.reportRead();
    return super.erroSignUp;
  }

  @override
  set erroSignUp(String value) {
    _$erroSignUpAtom.reportWrite(value, super.erroSignUp, () {
      super.erroSignUp = value;
    });
  }

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

  late final _$loginAsyncAction =
      AsyncAction('UserStoreBase.login', context: context);

  @override
  Future<bool> login(String email, String senha) {
    return _$loginAsyncAction.run(() => super.login(email, senha));
  }

  late final _$signUpAsyncAction =
      AsyncAction('UserStoreBase.signUp', context: context);

  @override
  Future<bool> signUp(String email, String senha) {
    return _$signUpAsyncAction.run(() => super.signUp(email, senha));
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  void alterarDummy() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.alterarDummy');
    try {
      return super.alterarDummy();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void logout(BuildContext context) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.logout');
    try {
      return super.logout(context);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
display: ${display},
dummy: ${dummy},
loading: ${loading},
modoDeletar: ${modoDeletar},
email: ${email},
erroLogin: ${erroLogin},
erroSignUp: ${erroSignUp},
alarmes: ${alarmes},
cards: ${cards}
    ''';
  }
}
