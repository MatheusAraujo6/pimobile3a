import 'package:alarme_pi/data/alarme.dart';
import 'package:alarme_pi/widgets/card_alarme.dart';

class GlobalState {
  GlobalState._privateConstructor();

  static final GlobalState instance = GlobalState._privateConstructor();

  List<Alarme> alarmes = [];
}

List<AlarmeCard> gerarAlarmeCard() {
  List<AlarmeCard> cards = [];

  for (var alarme in GlobalState.instance.alarmes) {
    //cards.add(AlarmeCard(alarme));
  }

  return cards;
}
