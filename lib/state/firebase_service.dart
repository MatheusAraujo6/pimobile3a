import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final _auth = FirebaseAuth.instance;

  Future<void> login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      if (e.code.contains("wrong-password")) {
        throw "Senha inválida";
      }

      if (e.code.contains("user-not-found")) {
        throw "Usuário não encontrado";
      }

      if (e.code.contains("user-disabled")) {
        throw "Usuário desativado";
      }

      if (e.code.contains("invalid-email")) {
        throw "Endereço de e-mail inválido!";
      }

      rethrow;
    }
  }

  Future<void> signUp(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      if (e.code.contains("email-already-in-use")) {
        throw "Senha inválida";
      }

      if (e.code.contains("operation-not-allowed")) {
        throw "O serviço de criação de conta foi desativado.";
      }

      if (e.code.contains("weak-password")) {
        throw "Senha muito fraca! Insira uma nova senha.";
      }

      if (e.code.contains("invalid-email")) {
        throw "Endereço de e-mail inválido!";
      }

      rethrow;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
