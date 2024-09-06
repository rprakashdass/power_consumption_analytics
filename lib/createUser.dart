// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/dashboard.dart';

// ignore: must_be_immutable
class Createuser extends StatefulWidget {
  const Createuser({super.key});

  @override
  createUser createState() => createUser();
}

class createUser extends State<Createuser> {
  String name = "";
  String user_name = "";
  String user_email = "";
  String mobile_num = "";
  String create_date = "";
  String alt_mob_no = "";
  bool visible_1 = false;

  // createUser({super.key});

  String val(String n, String m) {
    if (n != "") return n;
    return "Enter your $m";
  }

  List<int> get_color(String n) {
    if (n == "") return [167, 88, 87, 87];
    return [229, 8, 8, 8];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'New user',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
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
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            // transformAlignment: Alignment.center,
          ),

          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 5, left: 0),
            child: const Row(
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
            padding:
                const EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                // list<int> x=get_color(n),
                fillColor: const Color.fromARGB(115, 181, 181, 183),
                filled: true,
                // enabled: false,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: const OutlineInputBorder(
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
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: const Row(
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
            padding:
                const EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(115, 181, 181, 183),
                filled: true,
                // enabled: false,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: const OutlineInputBorder(
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

          //password  field need to be added
          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 19,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              // controller: tc_1,
              decoration: InputDecoration(
                // list<int> x=get_color(n),
                fillColor: const Color.fromARGB(115, 181, 181, 183),
                filled: true,
                // enabled: false,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: const OutlineInputBorder(
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
                hintText: val(name, "Password"),
                // },
                hintStyle: TextStyle(
                    color: Color.fromARGB(
                        get_color(name)[0],
                        get_color(name)[1],
                        get_color(name)[2],
                        get_color(name)[3]),
                    fontWeight: FontWeight.bold),

                suffixIcon: IconButton(
                  icon: Icon(visible_1
                      ? Icons.visibility
                      : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() {
                      visible_1 = !visible_1;
                    });
                  },
                ),
              ),
              obscureText: !visible_1,
            ),
          ),

          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: const Row(
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
            padding:
                const EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(115, 181, 181, 183),
                filled: true,
                // enabled: false,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: const OutlineInputBorder(
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
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: const Row(
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
            padding:
                const EdgeInsets.only(top: 2, bottom: 25, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(115, 181, 181, 183),
                filled: true,
                // enabled: false,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: const OutlineInputBorder(
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
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: const Row(
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
            padding:
                const EdgeInsets.only(top: 2, bottom: 40, right: 3, left: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(115, 181, 181, 183),
                filled: true,
                // enabled: false,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 6,
                  // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                disabledBorder: const OutlineInputBorder(
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

          const Padding(padding: EdgeInsets.only(bottom: 20)),
          ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  // maximumSize: WidgetStatePropertyAll(Size.fromWidth(65)),

                  padding: WidgetStatePropertyAll(EdgeInsets.all(13)),
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(250, 78, 177, 199))),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))
        ],
        // child: Container(child:context(Icon(Icons.person,size: 50),),),
        // context('Account Page Content'),
      ),
    );
  }
}
