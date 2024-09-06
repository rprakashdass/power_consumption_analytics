import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/createUser.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        title: const Text(
          'Users',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 30),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
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
