import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
bool _isObscure = true;
class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:ChooseColor(0).appBarColor2, // For iOS (dark icons)
        ),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor2,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushNamed("Button_Navigation_Bar");
          },
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black38,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: size.width*0.070,vertical: size.height*0.020),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                        width: size.width*0.50,
                        child: Image.asset("icons/logo 2.png",fit: BoxFit.fill,)
                    ),

                    SizedBox(height: size.height*0.010),
                    Text("Product of Fashion Paints Pvt.Ltd",style: TextStyle(fontSize: size.height*0.012+size.width*0.012,fontWeight: FontWeight.w500),),
                    SizedBox(height: size.height*0.050),

                    Container(
                      decoration: BoxDecoration(
                        color: ChooseColor(0).appBarColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding:EdgeInsets.symmetric(horizontal: size.width*0.040,vertical: size.height*0.020),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Login",style: TextStyle(color: Colors.white,fontSize: size.height*0.014+size.width*0.014,fontWeight: FontWeight.w600),),
                            SizedBox(height: size.height*0.020),
                            Form(
                              key: _form,
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Dealer Code",style: TextStyle(color: Colors.white,fontSize: size.height*0.010+size.width*0.010,fontWeight: FontWeight.w400),),
                                    SizedBox(height: size.height*0.005),
                                    TextFormField(
                                      decoration:InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(vertical: size.height*0.001,horizontal: size.width*0.030),
                                          errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.red,width: 1),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          // labelText: 'Phone Number',
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Dealer Code',
                                          hintStyle:TextStyle(fontSize: size.height*0.012+size.width*0.012,color: Colors.black26),
                                      ),
                                    ),
                                    SizedBox(height: size.height*0.020),
                                    Text("Password",style: TextStyle(color: Colors.white,fontSize: size.height*0.010+size.width*0.010,fontWeight: FontWeight.w400),),
                                    SizedBox(height: size.height*0.005),
                                    TextFormField(
                                      obscureText: _isObscure,
                                      textAlign: TextAlign.start,
                                      decoration:  InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: size.height*0.001,horizontal: size.width*0.030),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Colors.red,width: 1),
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(right:size.width*0.005),
                                          child: IconButton(color: Colors.black45,iconSize: size.height*0.020+size.width*0.020,
                                            icon: Icon(
                                              _isObscure ? Icons.visibility : Icons.visibility_off,

                                            ),
                                            onPressed: (){
                                              setState(() {
                                                _isObscure = !_isObscure;

                                              });
                                            },
                                          ),
                                        ),

                                        hintText:'Password',
                                        hintStyle:TextStyle(fontSize: size.height*0.012+size.width*0.012,color: Colors.black26),
                                      ),
                                    ),
                                  ],
                            )
                            ),
                            SizedBox(height: size.height*0.035),
                            ConstrainedBox(
                              constraints:BoxConstraints.tightFor(width: double.infinity,height:size.height*0.055),
                              child: ElevatedButton(
                                child:Text('LOGIN',maxLines: 1,style: TextStyle(fontSize:size.height*0.014+size.width*0.014),),
                                onPressed: (){
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  Navigator.of(context).pushReplacementNamed("Dealer_button_Navigation_Bar");
                                },
                                style: ElevatedButton.styleFrom(
                                  primary:ChooseColor(0).buttonColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.15),

                    Text("Ver 1.0.7",style: TextStyle(color: Colors.black26,fontSize: size.height*0.010+size.width*0.010))

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
