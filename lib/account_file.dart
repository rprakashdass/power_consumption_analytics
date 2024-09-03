import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountPage extends StatelessWidget {
  @override
  String name = "admin";
  String user_name = "admin2024";
  String user_email = "adminge@gmail.com";
  String mobile_num = "7708049840";
  String create_date = "2024-06-01 15:39:54 PM";
  String alt_mob_no = "";

  String val(String n, String m) {
    if (n != "") return n;
    return "Enter your $m";
  }

  List<int> get_color(String n) {
    if (n == "") return [167, 88, 87, 87];
    return [229, 8, 8, 8];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, size: 30),
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications,
                size: 30,
              ))
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(250, 78, 177, 199),
      ),
      body: ListView(
        // color: Color.fromARGB(134, 252, 252, 252),
        padding:
            const EdgeInsets.only(right: 30, left: 30, top: 30, bottom: 100),

        children: [
          // Theme(
          //   data: ThemeData(hintColor: Colors.white),
          // ),
          Container(
            // transformAlignment: Alignment.center,
            child: const Icon(
              Icons.person,
              color: Color.fromARGB(243, 90, 195, 190),
              size: 150,
            ),

            padding: EdgeInsets.only(bottom: 10, top: 10),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 5, top: 5, left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 21,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            // List<int> x=get_color(name),
            padding: EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                // list<int> x=get_color(n),
                fillColor: Color.fromARGB(115, 181, 181, 183),
                filled: true,
                enabled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                      13)), // Same border radius as enabled border
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                        115, 181, 181, 183), // Border color for disabled state
                    width: 2.0, // Border width for disabled state
                  ),
                  gapPadding: 6,
                ),
                // if(name!=""){
                hintText: val(name, "name"),
                // },
                hintStyle: TextStyle(
                    color: Color.fromARGB(
                        get_color(name)[0],
                        get_color(name)[1],
                        get_color(name)[2],
                        get_color(name)[3]),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 21,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color.fromARGB(115, 181, 181, 183),
                filled: true,
                enabled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                      13)), // Same border radius as enabled border
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                        115, 181, 181, 183), // Border color for disabled state
                    width: 2.0, // Border width for disabled state
                  ),
                  gapPadding: 6,
                ),
                hintText: val(user_name, "user_name"),
                hintStyle: TextStyle(
                    color: Color.fromARGB(
                        get_color(user_name)[0],
                        get_color(user_name)[1],
                        get_color(user_name)[2],
                        get_color(user_name)[3]),
                    fontWeight: FontWeight.bold),
                // contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 21,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color.fromARGB(115, 181, 181, 183),
                filled: true,
                enabled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                      13)), // Same border radius as enabled border
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                        115, 181, 181, 183), // Border color for disabled state
                    width: 2.0, // Border width for disabled state
                  ),
                  gapPadding: 6,
                ),
                hintText: val(user_email, "email"),
                hintStyle: TextStyle(
                    color: Color.fromARGB(
                        get_color(user_email)[0],
                        get_color(user_email)[1],
                        get_color(user_email)[2],
                        get_color(user_email)[3]),
                    fontWeight: FontWeight.bold),
                // contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Mobile',
                  style: TextStyle(
                    fontSize: 21,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color.fromARGB(115, 181, 181, 183),
                filled: true,
                enabled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                      13)), // Same border radius as enabled border
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                        115, 181, 181, 183), // Border color for disabled state
                    width: 2.0, // Border width for disabled state
                  ),
                  gapPadding: 6,
                ),
                hintText: val(mobile_num, "mobile number"),
                hintStyle: TextStyle(
                    color: Color.fromARGB(
                        get_color(mobile_num)[0],
                        get_color(mobile_num)[1],
                        get_color(mobile_num)[2],
                        get_color(mobile_num)[3]),
                    fontWeight: FontWeight.bold),
                // contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Alternate mobile',
                  style: TextStyle(
                    fontSize: 21,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color.fromARGB(115, 181, 181, 183),
                filled: true,
                enabled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                      13)), // Same border radius as enabled border
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                        115, 181, 181, 183), // Border color for disabled state
                    width: 2.0, // Border width for disabled state
                  ),
                  gapPadding: 6,
                ),
                hintText: val(alt_mob_no, "alternate mobile number"),
                hintStyle: TextStyle(
                    color: Color.fromARGB(
                        get_color(alt_mob_no)[0],
                        get_color(alt_mob_no)[1],
                        get_color(alt_mob_no)[2],
                        get_color(alt_mob_no)[3]),
                    fontWeight: FontWeight.bold),
                // contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Created At',
                  style: TextStyle(
                    fontSize: 21,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color.fromARGB(115, 181, 181, 183),
                filled: true,
                enabled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                      13)), // Same border radius as enabled border
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                        115, 181, 181, 183), // Border color for disabled state
                    width: 2.0, // Border width for disabled state
                  ),
                  gapPadding: 6,
                ),
                hintText: val(create_date, "Create date"),
                hintStyle: TextStyle(
                    color: Color.fromARGB(
                        get_color(create_date)[0],
                        get_color(create_date)[1],
                        get_color(create_date)[2],
                        get_color(create_date)[3]),
                    fontWeight: FontWeight.bold),
                // contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),
        ],
        // child: Container(child:context(Icon(Icons.person,size: 50),),),
        // context('Account Page Content'),
      ),
    );
  }
}
