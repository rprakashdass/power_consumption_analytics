import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/createuser.dart';
import 'package:power_consumption_analytics/widgets/main_dashboard.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainDashboard()));
            },
            icon: const Icon(Icons.arrow_back),color: Colors.white,),
        title: const Text(
          'User',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // _showFilterDialog(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 1, 202, 199),
                  ),
                  child: const Text('Filter'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Createuser()));
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 1, 202, 199),
                  ),
                  child: const Text('Create user'),
                ),
              ],
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(100, 250, 100, 100),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "No data found",
                    style: TextStyle(fontSize: 20),
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
//   void _showFilterDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('History Report Filter',
//               style: TextStyle(fontSize: 18)),
//           content: const History_FilterDialogContent(),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('Cancel',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 1, 202, 199),
//                       )),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle the submission logic here
//                     // For example, apply the filters
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('Submit',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 1, 202, 199),
//                       )),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
