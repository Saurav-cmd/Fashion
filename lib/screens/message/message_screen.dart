import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors/colors_file.dart';

class FashionChat extends StatefulWidget {
  const FashionChat({Key? key}) : super(key: key);

  @override
  _FashionChatState createState() => _FashionChatState();
}

class _FashionChatState extends State<FashionChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1,
            // For iOS (dark icons)
            statusBarIconBrightness: Brightness.light),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text(
          'Fashion Colour Studio',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
                    }
                    ),
              ],
            ),
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'icons/chatImage.png',
                          ),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.60),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: const BorderRadius.all(Radius.circular(5))),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, left: 8, right: 8, bottom: 5),
                          child: Text(
                            'Hello Sir  ',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topRight,
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.60),

                  //width: 240,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xff0694C0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Yes Sir',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 5),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 45,
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff8F3F97),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                  suffixIcon: const Icon(
                    Icons.emoji_emotions,
                    color: Colors.grey,
                    size: 28,
                  ),
                  contentPadding: const EdgeInsets.only(top: 5, left: 55),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Type a message',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.black45)),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
        ),
      ]),

    );
  }
}
