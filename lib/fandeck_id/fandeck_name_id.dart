
class FanDeckNameId{
  double? id;

   fanDeckNameToId(String? passedFanDeck){
    if(passedFanDeck == "SPIRIT 1050"){
      id = 1;
    }else if(passedFanDeck == "SHADE CARD"){
      id = 2;
    }else if(passedFanDeck=="RELIANCE ULTRA PROTEC SC"){
      id = 3;
    }
    return id;
  }
}