import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/Reports/filter.dart';

class history_report extends StatelessWidget {
  const history_report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
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
            const Text(
              'History Report',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showFilterDialog(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 1, 202, 199),
                  ),
                  child: const Text('Filter'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle download action
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 1, 202, 199),
                  ),
                  child: const Text('Download'),
                ),
              ],
            ),
        const Padding(padding: EdgeInsets.fromLTRB(100, 250, 100, 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("No data found",style: TextStyle(fontSize: 20),)
          ])
        ),
        ] ,
      ),  
    ),
  );
}
void _showFilterDialog(BuildContext context) {
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: const Text('History Report Filter',style: TextStyle(fontSize: 18)),
      content: const History_FilterDialogContent(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 202, 199),
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the submission logic here
                // For example, apply the filters
                Navigator.of(context).pop();
              },
              child: const Text('Submit',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 202, 199),
                  )),
            ),
          ],
        ),
      ],
    );
  },
);
}
}




/*


import 'package:flutter/material.dart';

class History_FilterDialogContent extends StatefulWidget {
  const History_FilterDialogContent({super.key});

  @override
  History_FilterDialogContentState createState() =>
      History_FilterDialogContentState();
}

class History_FilterDialogContentState
    extends State<History_FilterDialogContent> {
  DateTime? fromDate;
  DateTime? toDate;
  var dropdownValue = "Select Type";
  var listItems = ["Select Type", "Pin 1", "Pin 2", "Pin 3", "Relay 1", "Relay 2"];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("History Report Filter"),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // From Date Picker
            ListTile(
              title: const Text('From Date'),
              subtitle: Text(fromDate != null
                  ? '${fromDate!.toLocal()}'.split(' ')[0]
                  : 'Select From Date'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: fromDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() {
                    fromDate = date;
                  });
                }
              },
            ),
            // To Date Picker
            ListTile(
              title: const Text('To Date'),
              subtitle: Text(toDate != null
                  ? '${toDate!.toLocal()}'.split(' ')[0]
                  : 'Select To Date'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: toDate ?? (fromDate ?? DateTime.now()),
                  firstDate: fromDate ?? DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() {
                    toDate = date;
                    if (toDate != null && toDate!.isBefore(date)) {
                      toDate = null;
                    }
                  });
                }
              },
            ),
            // Type Dropdown
            ListTile(
              title: const Text('Type'),
              trailing: DropdownButton<String>(
                items: listItems.map((String dropdownStringItem) {
                  return DropdownMenuItem(
                    child: Text(dropdownStringItem),
                    value: dropdownStringItem,
                  );
                }).toList(),
                onChanged: (String? newItem) {
                  _DropItemSelected(newItem!);
                },
                value: dropdownValue,
              ),
            ),
            const SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      fromDate = null;
                      toDate = null;
                      dropdownValue = "Select Type";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColor,
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Submit action
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('Submit'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _DropItemSelected(String newElement) {
    setState(() {
      dropdownValue = newElement;
    });
  }
}*/