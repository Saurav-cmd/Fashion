class Constants {
  static fanDeckNameToId(String? passedFanDeck) {
    double? id;
    if (passedFanDeck == "SPIRIT 1050") {
      id = 1;
    } else if (passedFanDeck == "SHADE CARD") {
      id = 2;
    } else if (passedFanDeck == "RELIANCE ULTRA PROTEC SC") {
      id = 3;
    }
    return id;
  }

  static String baseUrl = "http://reliancetint.bihanitech.com/api/";
  static String DATA_DOWNLOAD = "data_download";
}
