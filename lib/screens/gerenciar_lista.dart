import 'package:alarme_pi/screens/login.dart';
import 'package:alarme_pi/widgets/calendario.dart';
import 'package:alarme_pi/state/global.dart';
import 'package:flutter/material.dart';
import 'package:alarme_pi/state/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TelaPrincipal extends StatelessWidget {
  //final store = UserStore();

  TelaPrincipal({super.key});

  static void navegar(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => TelaPrincipal()),
    );
  }

  static void sair(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginTela()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> alarmes = gerarAlarmeCard();

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: const Text('Alarme PI'),
          actions: [
            IconButton(
              onPressed: () => TelaPrincipal.sair(context),
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
              return (store.cards.isEmpty)
                  ? const Center(
                      child: Text(
                        "Adicione um novo alarme com o botão +",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView(children: store.cards);
            }),
            Padding(
              padding: EdgeInsets.only(
                top: 0.05 * height,
                left: 0.0667 * width,
                right: 0.0667 * width,
                bottom: 0.1 * height,
              ),
              child: Calendario(),
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
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Nenhum alarme foi ativado.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
