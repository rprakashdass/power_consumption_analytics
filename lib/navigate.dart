

















import 'package:flutter/material.dart';
import 'report_menu.dart';
// void main()
// {
//   runApp(const MyApp_1());
// }


// ignore: camel_case_types
class MyAPPs extends StatelessWidget {
  const MyAPPs({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
          title: const Center(
            child: Text('M-POWER',textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(244, 254, 252, 252),fontSize:30),),
          ),
          actions: [
            IconButton(onPressed: (){
              const ReportMenu();
          },
          icon: const Icon(Icons.notification_add,size: 30,),

            ),
          ],
          backgroundColor: const Color.fromARGB(255, 1, 202, 200),
          ) ,
          backgroundColor:const Color.fromARGB(235, 206, 255, 252) ,
          drawer: Drawer(
            child: Container(
            color:const Color.fromARGB(255, 1, 202, 200),
              
            child: ListView(
              children: <Widget>[
                    const DrawerHeader(
                      child: Center(
                        child: Text('M-POWER',style: TextStyle(fontSize: 33,color:  Color.fromARGB(255, 233, 233, 221),),
                        ),
                      ),
                    ),

                    const ListTile(
                   leading: Icon(Icons.account_circle, size: 30,color: Color.fromARGB(255, 233, 233, 221),),
                   title: Text('Admin',style: TextStyle(fontSize:20,color: Color.fromARGB(255, 250, 250, 250) ),),
                    ),
      
                    const ListTile(
                    leading: Icon(Icons.home,size:25,color: Color.fromARGB(255, 200, 236, 33),),
                    title: Text('Home',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 250, 250, 250)),),
                    ),

                  const ListTile(
                   leading:Icon(Icons.mobile_friendly, size: 25,color: Color.fromARGB(255, 200, 236, 33),),
                   title: Text('Device',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 250, 250, 250)),),
                   hoverColor:Color.fromARGB(255, 234, 241, 241),
                  ),

                  const ListTile(
                    leading: Icon(Icons.people,size:25,color: Color.fromARGB(255, 200, 236, 33),),
                    title: Text('User',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 250, 250, 250)),),
                   ),
                  
                  
                    
                    // DropdownMenu(dropdownMenuEntries: ),
                    ListTile(
                    leading:const Icon(Icons.note_alt,color: Color.fromARGB(255, 200, 236, 33),),
                    title: const Text('Report',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 250, 250, 250)),),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ReportMenu(),)
                      );
                    },
                    ),

                  const ListTile(
                    
                    leading: Icon(Icons.subscriptions,color: Color.fromARGB(255, 200, 236, 33),),
                    title: Text('Subscriptions',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 250, 250, 250)),),
                  ),

                   const ListTile( 
                    leading: Icon(Icons.notifications_active,color: Color.fromARGB(255, 200, 236, 33),),
                     title: Text('Notification settings',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 250, 250, 250)),),
                   ),

                   const ListTile(
                   leading:  Icon(Icons.lock_outline_rounded,color: Color.fromARGB(255, 200, 236, 33),),
                   title:  Text('Change passward',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 250, 250, 250)),),
                   ),

                   const ListTile(
                    leading: Icon(Icons.logout,color: Color.fromARGB(255, 200, 236, 33),),
                    title: Text('Logout',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 250, 250, 250)),),
                   ),

              ],
                   
            ),
          
            )
          ),
          
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(label:'home', icon:Icon(Icons.home)),
            BottomNavigationBarItem(label:'thunder', icon:Icon(Icons.flash_on)),
          ],backgroundColor:const Color.fromARGB(255, 1, 202, 200),),
          body: Title(color: Colors.white, child: const Text('Dashboard')),
          
         ),

      ),

      );
}
}

// // // class ReportMenu extends StatelessWidget {
// // //   const ReportMenu({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ListView(
// // //       children: <Widget>[
// // //         ExpansionTile(
// // //           leading: const Icon(
// // //             Icons.note_alt,
// // //             color: Color.fromARGB(255, 200, 236, 33),
// // //           ),
// // //           title: const Text(
// // //             'Report',
// // //             style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 250, 250, 250)),
// // //           ),
// // //           children: <Widget>[
// // //             ListTile(
// // //               leading: const Icon(Icons.assignment, color: Colors.yellow),
// // //               title: const Text('Reading Report'),
// // //               onTap: () {
// // //                 // Handle the tap for Reading Report
// // //               },
// // //             ),
// // //             ListTile(
// // //               leading: const Icon(Icons.pie_chart, color: Colors.yellow),
// // //               title: const Text('Consumption Report'),
// // //               onTap: () {
// // //                 // Handle the tap for Consumption Report
// // //               },
// // //             ),
// // //             ListTile(
// // //               leading: const Icon(Icons.bar_chart, color: Colors.yellow),
// // //               title: const Text('History Report'),
// // //               onTap: () {
// // //                 // Handle the tap for History Report
// // //               },
// // //             ),
// // //             ListTile(
// // //               leading: const Icon(Icons.notifications, color: Colors.yellow),
// // //               title: const Text('Notification Report'),
// // //               onTap: () {
// // //                 // Handle the tap for Notification Report
// // //               },
// // //             ),
// // //             ListTile(
// // //               leading: const Icon(Icons.warning, color: Colors.yellow),
// // //               title: const Text('Alert Report'),
// // //               onTap: () {
// // //                 // Handle the tap for Alert Report
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //         ListTile(
// // //           leading: const Icon(Icons.subscriptions, color: Colors.yellow),
// // //           title: const Text('Subscription'),
// // //           onTap: () {
// // //             // Handle the tap for Subscription
// // //           },
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }