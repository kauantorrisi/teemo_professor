class HomeHelper {
  static String rankedModeSoloQNameHelper(String text) {
    return text
        .replaceAll('_', ' ')
        .replaceAll('5x5', '')
        .replaceAll('ANKED', 'anked')
        .replaceAll('OLO', 'olo');
  }

  static String rankedModeFlexNameHelper(String text) {
    return text
        .replaceAll('_', ' ')
        .replaceAll('5x5', '')
        .replaceAll('ANKED', 'anked')
        .replaceAll('SR', '')
        .replaceAll('LEX', 'lex');
  }

  static String rankedModeTFTNameHelper(String text) {
    return text.replaceAll('_', ' ').replaceAll('DOUBLE UP', '');
  }

  static String eloNameHelper(String text) {
    return text
        .replaceAll('IRON', 'Ferro')
        .replaceAll('BRONZE', 'Bronze')
        .replaceAll('SILVER', 'Prata')
        .replaceAll('GOLD', 'Ouro')
        .replaceAll('PLATINUM', 'Platina')
        .replaceAll('DIAMOND', 'Diamante')
        .replaceAll('MASTER', 'Mestre')
        .replaceAll('GRANDMASTER', 'Grão-mestre')
        .replaceAll('CHALLENGER', 'Desafiante');
  }
}
