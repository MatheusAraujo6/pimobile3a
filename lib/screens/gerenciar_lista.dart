import 'dart:async';

import 'package:alarme_pi/screens/login.dart';
import 'package:alarme_pi/widgets/calendario.dart';
import 'package:alarme_pi/widgets/card_alarme.dart';
import 'package:flutter/material.dart';
import 'package:alarme_pi/state/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TelaPrincipal extends StatelessWidget {
  //final store = UserStore();

  const TelaPrincipal({super.key});

  static void navegar(BuildContext context) {
    //unawaited(store.escanearAlarmes());
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const TelaPrincipal()),
    );
  }

  static void sair(BuildContext context) {
    store.logout(context);
    store = UserStore(); // Regenerar o store apenas ao trocar usuário
    LoginTela.navegar(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_) {
          if (store.modoDeletar) {
            return modoExcluir(context);
          } else {
            return modoRegular(context);
          }
        },
      ),
    );
  }

  Widget modoRegular(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: const Text('Alarme PI'),
          actions: [
            IconButton(
              onPressed: () => sair(context),
              icon: const Icon(Icons.logout),
            )
          ],
          backgroundColor: Colors.blueGrey.shade800,
          //shadowColor: Colors.orange,
          bottom: TabBar(
            indicatorColor: Colors.blueGrey.shade50,
            tabs: const <Widget>[
              Tab(text: 'Alarmes'),
              Tab(text: 'Calendário'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Observer(builder: (_) {
              if (store.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (store.cards.isEmpty) {
                return const Center(
                  child: Text(
                    "Adicione um novo alarme com o botão +",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              return ListView(children: store.cards);
            }),
            Padding(
              padding: EdgeInsets.only(
                top: 0.05 * height,
                left: 0.0667 * width,
                right: 0.0667 * width,
                bottom: 0.1 * height,
              ),
              child: const Calendario(),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          //onPressed: () => setState(() {
          //  criarAlarme(context);
          //}),
          onPressed: () => store.criarAlarme(context),
          backgroundColor: Colors.blueGrey.shade400,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.blueGrey.shade800,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Observer(builder: (_) {
              return Stack(
                children: [
                  Text(
                    store.dummy.toString(),
                    style: TextStyle(color: Colors.blueGrey.shade900),
                  ),
                  Text(
                    store.email,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget modoExcluir(BuildContext context) {
    List<Widget> cardsExcluir = [];
    for (var alarme in store.alarmes) {
      Widget linha = ListTile(
        leading: IconButton(
          icon: const Icon(Icons.delete, color: Colors.white),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Deseja remover o alarme?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                      onPressed: () {
                        store.cards.removeAt(store.alarmes.indexOf(alarme));
                        store.removerAlarmeFirestore(alarme);
                        store.alarmes.remove(alarme);
                        store.alterarDummy();
                        Navigator.pop(context);
                      },
                      child: const Text('Remover'))
                ],
              ),
            );
          },
        ),
        title: AlarmeCard(alarme: alarme, modoExcluir: true),
      );
      cardsExcluir.add(linha);
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: const Text(
          "Excluir alarmes",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            store.modoDeletar = false;
          },
        ),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              Text(
                store.dummy.toString(),
                style: TextStyle(color: Colors.blueGrey.shade900),
              ),
              ListView(children: cardsExcluir),
            ],
          );
        },
      ),
    );
  }
}
