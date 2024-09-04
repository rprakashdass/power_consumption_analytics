import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/drawer.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          size: 35,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the drawer menu icon color to white
        ),
        centerTitle: true,
        title: const Text(
          'Subscription',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      drawer: main_drawer(),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 25, bottom: 30, left: 15, right: 15),
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            margin: const EdgeInsets.only(
              bottom: 30,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Shadow color
                  blurRadius: 10, // Softness of the shadow
                  offset: Offset(0, 4), // Position of the shadow (x, y)
                ),
              ],
              // boxShadow: BoxShadow(color:Color.fromARGB(232, 0, 0, 255)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  width: 700,
                  child: Center(
                    child: Text(
                      // padding: EdgeInsets.only(top: 10, bottom: 10),
                      "M Power Pro",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                            child: Text(
                          "\$ 4999.00(12 month)",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        const Padding(padding: EdgeInsets.only(bottom: 8)),
                        const Text(
                          "🌟 An Premium Plan",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "🌟 Affordable Price",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "🌟 416/Month (1000 less than Lite Plan)",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "🌟 12 Months Validity...",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        // TextStyle(fontSize: 20),
                        const Padding(padding: EdgeInsets.only(top: 12)),
                        ElevatedButton(
                          iconAlignment: IconAlignment.end,
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            "select",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Shadow color
                  blurRadius: 10, // Softness of the shadow
                  offset: Offset(0, 4), // Position of the shadow (x, y)
                ),
              ],
              // boxShadow: BoxShadow(color:Color.fromARGB(232, 0, 0, 255)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  width: 700,
                  child: Center(
                    child: Text(
                      // padding: EdgeInsets.only(top: 10, bottom: 10),
                      "M Power Lite",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                            child: Text(
                          "\$ 500.00(1 month)",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        const Padding(padding: EdgeInsets.only(bottom: 8)),
                        const Text(
                          "🌟 An Basic Plan",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "🌟 Standard Price",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        const Text(
                          "🌟 1 Month Validity",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        // TextStyle(fontSize: 20),
                        const Padding(padding: EdgeInsets.only(top: 12)),
                        ElevatedButton(
                          iconAlignment: IconAlignment.end,
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            "select",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//////////////
///
///


