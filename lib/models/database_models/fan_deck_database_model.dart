
class FanDeck{
  int id;
  String name;
  double colorLite;
  double laxmiDisTemper;
  double springDisTemper;
  double homeGuardExtra;
  double primeEmulsion;
  double primeGoldEmulsion;

  FanDeck({
      required this.id,
      required this.name,
      required this.colorLite,
      required this.laxmiDisTemper,
      required this.springDisTemper,
      required this.homeGuardExtra,
      required this.primeEmulsion,
      required this.primeGoldEmulsion
  });

  factory FanDeck.fromMap(Map<String,dynamic>json)=>FanDeck(
      id:json["id"],
      name:json["name"],
      colorLite:json["colorLite"],
      laxmiDisTemper:json["laxmiDisTemper"],
      springDisTemper:json["springDisTemper"],
      homeGuardExtra:json["homeGuardExtra"],
      primeEmulsion:json["primeEmulsion"],
      primeGoldEmulsion:json["primeGoldEmulsion"]
  );

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "name":name,
      "colorLite":colorLite,
      "laxmiDisTemper":laxmiDisTemper,
      "springDisTemper":springDisTemper,
      "homeGuardExtra":homeGuardExtra,
      "primeEmulsion":primeEmulsion,
      "primeGoldEmulsion":primeGoldEmulsion,
    };
  }
}