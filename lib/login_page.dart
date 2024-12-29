import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller/home_controller.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Admin Login",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                   TextField(
                    controller:ctrl.adminEmailctr ,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: ctrl.adminpasswardctr,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ctrl.allowadmintoLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(1, 202, 199, 1),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      print("Forgot Credentials tapped");
                    },
                    child: const Text(
                      "Forgot Credentials?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(1, 202, 199, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                          text: "Signup",
                          style: const TextStyle(
                            color: Color.fromRGBO(1, 202, 199, 1),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Signup tapped");
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:get/get.dart';

// import 'home_controller/home_controller.dart';

// class AdminLoginPage extends StatefulWidget {
//   const AdminLoginPage({super.key});
  
//   @override
//   State<AdminLoginPage> createState() => _AdminLoginPageState();
// }

// class _AdminLoginPageState extends State<AdminLoginPage> {
//     bool visible = true;

//   // get backgroundColor => null;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (ctrl){
//        return Center(
//          child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: Scaffold(
//             backgroundColor: const Color.fromARGB(255, 1, 202, 199),
//             body: SingleChildScrollView(
//               child: Stack(children: [
//                 // Container(
//                 //   color: Color.fromARGB(255, 1, 202, 199),
//                 //     decoration: const BoxDecoration(
//                 // )),
//                 const Padding(
//                   padding: EdgeInsets.only(
//                       left: 140.0,
//                       top: 230.0,
//                       right: 100.0,
//                       bottom: 300.0), //EdgeInsets.all(100.0),
//                   child: Text("M-Power",
//                       style: TextStyle(
//                         fontSize: 30.0,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       )),
//                 ),
//                 Container(
//                     padding: const EdgeInsets.all(10),
//                     width: 410,
//                     height: 500,
//                     margin: const EdgeInsets.only(
//                         left: 20.0, right: 20.0, top: 280.0, bottom: 10.0),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment:
//                               CrossAxisAlignment.center, // Align label to the left
//                           children: [
                           
//                             const Padding(
//                               padding: EdgeInsets.only(top: 10),
//                               child: Text(
//                                 'Username*', // Label Text
//                                 style: TextStyle(
//                                   fontSize: 18.0, // Customize label size
//                                   fontWeight: FontWeight.bold, // Make label bold
//                                   color: Colors.black, // Label color
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: ctrl.adminEmailctr,
//                               decoration: InputDecoration(
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10)),
//                                     gapPadding: 6,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10)),
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(255, 199, 200, 201),
//                                         width: 1.0),
//                                   ),
//                                   hintText: 'Enter your username',
//                                   hintStyle: TextStyle(
//                                     color: Color.fromARGB(255, 221, 220, 220),
//                                   )),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.all(10.0),
//                               child: Text(
//                                 'Password*', // Label Text
//                                 style: TextStyle(
//                                   fontSize: 18.0, // Customize label size
//                                   fontWeight: FontWeight.bold, // Make label bold
//                                   color: Colors.black, // Label color
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height:8.0),
//                             TextField(
//                               controller: ctrl.adminpasswardctr,
//                               obscureText: visible,
//                               decoration: InputDecoration(
//                                   suffix: 
//                                   IconButton(
//                                        icon:
//                                        Icon(visible
//                                           ? Icons.visibility_off_outlined
//                                           // ignore: dead_code
//                                           : Icons.visibility,),
//                                       // style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(250, 201, 0, 0)),padding:WidgetStatePropertyAll(EdgeInsets.all(0))),
//                                       onPressed: () {
//                                         setState(() {
//                                           {
//                                             print("pressed the icon:");
//                                             visible = !visible;
//                                           }
//                                         });
//                                       }),
//                                   border: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10)),
//                                   ),
//                                   enabledBorder: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10)),
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(255, 199, 200, 201),
//                                         width: 1.0),
//                                   ),
//                                   hintText: 'Enter your password',
//                                   hintStyle: const TextStyle(
//                                     color: Color.fromARGB(255, 221, 220, 220),
//                                   )),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(
//                                 top: 10.0,
//                                 left: 160,
//                               ),
//                               child: Text(
//                                 'Forgot Credentials', // Label Text
//                                 style: TextStyle(
//                                   fontSize: 20.0, // Customize label size
//                                   fontWeight: FontWeight.bold, // Make label bold
//                                   color: Color.fromRGBO(
//                                       1, 202, 199, 1), // Label color
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 10.0, left: 90, right: 100.0),
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     ctrl.allowadmintoLogin();
//                                   },
//                                   child: const Text(
//                                     "Login",
//                                     style: TextStyle(fontSize: 18.0),
//                                   ),
//                                   style: ElevatedButton.styleFrom(
//                                     foregroundColor: Colors.white,
//                                     backgroundColor: const Color.fromRGBO(
//                                         1, 202, 199, 1), // Text color
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 38.0,
//                                         vertical: 16.0), // Increased padding
//                                     minimumSize: const Size(250, 40), // Padding
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(
//                                           8.0), // Rounded corners
//                                     ),
//                                   ),
//                                 )),
//                             Padding(
//                               padding: EdgeInsets.only(top: 10.0, left: 39.0),
//                               child: RichText(
//                                 text: TextSpan(
//                                   children: [
//                                     const TextSpan(
//                                       text: 'Don' 't have an acccount?',
//                                       style: TextStyle(
//                                         color: Color.fromARGB(255, 23, 23, 23),
//                                         fontSize: 19.0,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: 'Signup',
//                                       style: const TextStyle(
//                                         color: Color.fromARGB(255, 24, 170, 184),
//                                         fontSize: 19.0,
//                                         fontWeight: FontWeight
//                                             .bold, // Optional, for emphasis
//                                       ),
//                                       recognizer: TapGestureRecognizer()
//                                         ..onTap = () {
//                                           // Handle the signup action
//                                           print('Signup clicked');
//                                         },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )))
//               ]
//               ),
//             ),
//           )
//              ),
//        );
        
//     });
    
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:power_consumption_analytics/home_controller/home_controller.dart';


// // class AdminLoginPage extends StatelessWidget {
// //   const AdminLoginPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GetBuilder<HomeController>(builder: (ctrl){
// //       return Scaffold(
// //       body: Container(
// //         width: double.maxFinite,
// //         padding: const EdgeInsets.all(20),
// //         decoration: BoxDecoration(
// //           color: Colors.blueGrey[50],
// //         ),
// //         child:Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Text('Welcome',
// //             style: TextStyle(fontSize: 28,
// //             fontWeight: FontWeight.bold,
// //             color: Color.fromARGB(255, 1, 202, 199),
// //             ),
// //             ),
// //             const SizedBox(height: 20,),
// //             TextField(
// //               controller: ctrl.adminEmailctr,
// //               decoration: InputDecoration(
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 prefixIcon: const Icon(Icons.phone_android),
// //                 labelText: 'Email Id',
// //                 hintText:  'Enter your Email Address',

// //               ),
// //             ),

// //             const SizedBox(height: 20,),
// //             TextField(
// //               controller: ctrl.adminpasswardctr,
// //               decoration: InputDecoration(
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 prefixIcon: const Icon(Icons.phone_android),
// //                 labelText: 'Password',
// //                 hintText:  'Enter The Password',
// //               ),
// //             ),
// //             const SizedBox(height: 20,),
// //             ElevatedButton(
// //               onPressed: (){
// //                 ctrl.allowadmintoLogin();
// //               },style:ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.white,
// //                 backgroundColor: const Color.fromARGB(255, 1, 202, 199),
// //               ) ,child: const Text('Login') ),
// //               // TextButton(onPressed: (){ 
               
                
// //               //   }, child:const Text("Sign up"))
// //           ],
// //         ),
// //       ),
// //     );

// //     },);
    
// //   }
// // }