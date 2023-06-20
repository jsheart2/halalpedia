import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:halalpedia/database.dart';
import 'package:halalpedia/sign_in/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUppage(),
    ); // Mengambil dari material app
  }
}

class SignUppage extends StatefulWidget
{
  const SignUppage({super.key});
  @override
  State<SignUppage> createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage>
{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  bool showPassword = false;
  Future register() async{

    var url = Uri.http(Database().ip,'/login/register.php',{'q':'{http}'});
    var respone = await http.post(url,body: {
      "email" : email.text.toString(),
      "password": password.text.toString()
    });
    var data = json.encode(respone.body);
    if(data=="Error"){
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        msg: 'User already exist',
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.black87,
      );
    }else{
      Fluttertoast.showToast(
          backgroundColor: Colors.green,
          textColor: Colors.black87,
          msg: 'Registration Successful',
          toastLength: Toast.LENGTH_SHORT
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) =>SignInScreen()));
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white,
                  Colors.white
                ])
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text("Signup", style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 60),),
                      ),
                      const SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80).copyWith(
                                topRight: const Radius.circular(0),
                                bottomLeft: const Radius.circular(0)
                            ),
                            gradient: const LinearGradient(colors: [Colors.blue,Colors.greenAccent]),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(20).copyWith(right: 0, top: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80).copyWith(
                                  topRight: const Radius.circular(0),
                                  bottomLeft: const Radius.circular(0)
                              ),
                              gradient: const LinearGradient(colors: [Colors.green,Colors.cyanAccent]),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(20).copyWith(right: 0, top: 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80).copyWith(
                                      topRight: const Radius.circular(0),
                                      bottomLeft: const Radius.circular(0)
                                  ),
                                  gradient: const LinearGradient(colors: [Colors.deepPurple,Colors.purpleAccent])
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: 320,
                    height: 320,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Column(
                        children: [
                          TextField(
                            controller: email,
                            style: const TextStyle(
                              color: Colors.black87,fontSize: 15,
                            ),
                            cursorColor: Colors.black87,
                            decoration: const InputDecoration(
                                hintText: 'Enter Email',
                                hintStyle: TextStyle(
                                    color: Colors.black87,fontSize: 15
                                ),
                                prefixIconConstraints: BoxConstraints(maxHeight: 10),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.person, color: Colors.black87, size: 20,),
                                ),
                                contentPadding: EdgeInsets.only(top: 14, right: 10),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black87, width: .2
                                    )
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black87, width: .2
                                  ),
                                )
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: password,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 15
                            ),
                            cursorColor: Colors.black87,
                            obscureText: showPassword?false:true,
                            decoration: InputDecoration(
                                hintText: 'Enter Password',
                                hintStyle: const TextStyle(
                                    color: Colors.black87, fontSize: 15
                                ),
                                contentPadding: const EdgeInsets.only(top: 14,right: 10),
                                prefixIconConstraints: const BoxConstraints(
                                    maxHeight: 10
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(right:  10),
                                  child: Icon(Icons.lock, color: Colors.black87, size: 19,),
                                ),
                                suffixIconConstraints: const BoxConstraints(
                                    maxHeight: 10
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(
                                      showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black87, width: .2

                                    )
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black87, width: .2
                                    )
                                )
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: (){},
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Colors.black87.withOpacity(.8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: register,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50).copyWith(
                                    topRight: const Radius.circular(0),
                                  ),
                                  gradient: const LinearGradient(colors: [
                                    Colors.deepPurpleAccent,
                                    Colors.greenAccent
                                  ])
                              ),
                              child: Text(
                                'Sign Up Here!',
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(.8),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
