import 'package:flutter/material.dart';
class Read_FilterDialogContent extends StatefulWidget {
  @override
  Read_FilterDialogContentState createState() => Read_FilterDialogContentState();
}
class Read_FilterDialogContentState extends State<Read_FilterDialogContent> {
  DateTime? fromDate;
  DateTime? toDate;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
    
        children: [
          // From Date Picker
          Divider(),
          ListTile(
            title: Text('From Date'),
            subtitle: Text(fromDate != null
                ? '${fromDate!.toLocal()}'.split(' ')[0]
                : 'Select From Date'),
            trailing: Icon(Icons.calendar_today),
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
            title: Text('To Date'),
            subtitle: Text(toDate != null
                ? '${toDate!.toLocal()}'.split(' ')[0]
                : 'Select To Date'),
            trailing: Icon(Icons.calendar_today),
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
          // From Time Picker
          ListTile(
            title: Text('From Time'),
            subtitle: Text(fromTime != null
                ? fromTime!.format(context)
                : 'Select From Time'),
            trailing: Icon(Icons.access_time),
            onTap: () async {
              TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: fromTime ?? TimeOfDay.now(),
              );
              if (time != null) {
                setState(() {
                  fromTime = time;
                });
              }
            },
          ),
          // To Time Picker
          ListTile(
            title: Text('To Time'),
            subtitle: Text(toTime != null
                ? toTime!.format(context)
                : 'Select To Time'),
            trailing: Icon(Icons.access_time),
            onTap: () async {
              TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: toTime ?? TimeOfDay.now(),
              );
              if (time != null) {
                setState(() {
                  toTime = time;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

class Consumption_FilterDialogContent extends StatefulWidget {
  @override
  Consumption_FilterDialogContentState createState() => Consumption_FilterDialogContentState();
}


class Consumption_FilterDialogContentState extends State<Consumption_FilterDialogContent> {
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
    
        children: [
          // From Date Picker
          Divider(),
          ListTile(
            title: Text('From Date'),
            subtitle: Text(fromDate != null
                ? '${fromDate!.toLocal()}'.split(' ')[0]
                : 'Select From Date'),
            trailing: Icon(Icons.calendar_today),
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
            title: Text('To Date'),
            subtitle: Text(toDate != null
                ? '${toDate!.toLocal()}'.split(' ')[0]
                : 'Select To Date'),
            trailing: Icon(Icons.calendar_today),
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
        ],
      ),
    );
  }
}
