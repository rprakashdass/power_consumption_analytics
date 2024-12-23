import 'package:flutter/material.dart';

class Dataviews extends StatelessWidget {
  final List<dynamic>? data_1;
  const Dataviews({super.key, this.data_1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data_1 != null ? "${data_1!}" : "No Data Available",
        ),
        ),
      body: ListView.builder(
        itemCount: data_1?.length,
        itemBuilder: (context, index) {
          return Text(data_1![index]['field3']);
        },
        ),
    );
  }
}