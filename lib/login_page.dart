

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_consumption_analytics/home_controller/Home_controller.dart';


class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl){
      return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome',
            style: TextStyle(fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 1, 202, 199),
            ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: ctrl.adminEmailctr,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.phone_android),
                labelText: 'Email Id',
                hintText:  'Enter your Email Address',

              ),
            ),

            const SizedBox(height: 20,),
            TextField(
              controller: ctrl.adminpasswardctr,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.phone_android),
                labelText: 'Password',
                hintText:  'Enter The Password',
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                ctrl.allowadmintoLogin();
              },style:ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 1, 202, 199),
              ) ,child: const Text('Login') ),
              // TextButton(onPressed: (){ 
               
                
              //   }, child:const Text("Sign up"))
          ],
        ),
      ),
    );

    },);
    
  }
}