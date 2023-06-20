import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:halalpedia/database.dart';
import 'package:halalpedia/home/home_screen.dart';
import 'package:halalpedia/sign_up/sign_up_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget
{
  const Homepage({super.key});
  @override
  State<Homepage> createState()=> _HomepageState();
}

class _HomepageState extends State<Homepage>
{
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool showPassword = false;

  Future login() async{
    var url = Uri.http(Database().ip,'/login/login.php',{'q':'{http}'});
    var respone = await http.post(url,body: {
      "usename" : user.text.toString(),
      "pass" : pass.text.toString()
    });
    var data = json.decode(respone.body);
    if(data.toString() == "Succes"){
      Fluttertoast.showToast(
          msg: 'Login Successful',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>HomeScreen())
      );
    }
    else{
      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'Username Or Password Invalid',
          toastLength: Toast.LENGTH_SHORT
      );
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child:
        Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white, Colors.white]),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text("Login",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold, fontSize: 60),),
                      ),
                      const SizedBox(width: 50,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80).copyWith(
                              topRight: const Radius.circular(0),
                              bottomLeft: const Radius.circular(0),
                            ),
                            gradient: const LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(20).copyWith(right: 0, top: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80).copyWith(
                                topRight: const Radius.circular(0),
                                bottomLeft: const Radius.circular(0),
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
                                  gradient: const LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent])
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
                            controller: user,
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
                          TextField(
                            controller: pass,
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
                            height: 5,
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
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: login,
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
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50).copyWith(
                                    bottomLeft: const Radius.circular(0),
                                  ),
                                  gradient: const LinearGradient(colors: [
                                    Colors.red,
                                    Colors.purpleAccent
                                  ])
                              ),
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
