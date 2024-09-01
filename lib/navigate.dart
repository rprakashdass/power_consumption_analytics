import 'package:flutter/material.dart';

// void main()
// {
//   runApp(const MyApp_1());
// }


// ignore: camel_case_types
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
          title: const Text('M-POWER',
          style: TextStyle(color: Color.fromARGB(244, 237, 6, 6),fontSize:28),),
          actions: [
            IconButton(onPressed: (){
          },
          icon: const Icon(Icons.notification_add),
            ),
          ],
          backgroundColor: const Color.fromARGB(223, 99, 120, 224),
          ) ,
          backgroundColor:const Color.fromARGB(223, 254, 243, 67) ,
          drawer: Drawer(
            child: Container(
            color:const Color.fromARGB(224, 7, 222, 7),
              
            child: ListView(
              children: const [
                    DrawerHeader(
                      child: Center(
                        child: Text('M-POWER',style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                    
                   Icon(Icons.account_circle, size: 30,applyTextScaling: true,semanticLabel:String.fromEnvironment('profile'),),
                  //  SizedBox(width: 10),
                   Text(
                      'Account', // Name of the icon
                      style: TextStyle(fontSize: 25),
                     ),
                    ListTile(
                      title: Text('page1'),
                    ),
                    ListTile(
                      title: Text('page2'),
                    ),
                    ListTile(
                      title: Text('page3'),
                    ),
                    ListTile(
                      title: Text('page4'),
                    ),
              ],
            ),
          
            )
          ),
          
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(label:'home', icon:Icon(Icons.home)),
            BottomNavigationBarItem(label:'thunder', icon:Icon(Icons.show_chart_outlined)),
          ],backgroundColor:const Color.fromARGB(122, 456, 234, 34),),
          body: TextButton.icon(onPressed:(){
      
           } ,icon:const Icon(Icons.add), label:const Text('icon'))
         ),
      ),
      );
}
}
