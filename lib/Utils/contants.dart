class Constants {
  static fanDeckNameToId(String? passedFanDeck) {
    double? id;
    if (passedFanDeck == "Fashion Paints Ambiance Plus CS") {
      id = 1;
    } else if (passedFanDeck == "Spirit 1050 Fandeck") {
      id = 2;
    } else if (passedFanDeck == "Color Symphony Fandeck") {
      id = 3;
    } else if (passedFanDeck == "Color Cosmos Fandeck") {
      id = 4;
    } else if (passedFanDeck == "BP-2300") {
      id = 5;
    } else if (passedFanDeck == "AP-CP") {
      id = 6;
    }
    return id;
  }

  static String baseUrl = "https://fashionpaints.bihanitech.com/api/";
  static String pdfBaseUrl = "https://fashionpaints.bihanitech.com";
  static String DATA_DOWNLOAD = "data_download";
}
