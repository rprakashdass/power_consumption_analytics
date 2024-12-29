import 'package:flutter/material.dart';

class ReadFilterDialogContent extends StatefulWidget {
  const ReadFilterDialogContent({super.key});

  @override
  ReadFilterDialogContentState createState() =>
      ReadFilterDialogContentState();
}

class ReadFilterDialogContentState extends State<ReadFilterDialogContent> {
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
          const Divider(),
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
          // From Time Picker
          ListTile(
            title: const Text('From Time'),
            subtitle: Text(fromTime != null
                ? fromTime!.format(context)
                : 'Select From Time'),
            trailing: const Icon(Icons.access_time),
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
            title: const Text('To Time'),
            subtitle: Text(
                toTime != null ? toTime!.format(context) : 'Select To Time'),
            trailing: const Icon(Icons.access_time),
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

class ConsumptionFilterDialogContent extends StatefulWidget {
  const ConsumptionFilterDialogContent({super.key});

  @override
  ConsumptionFilterDialogContentState createState() =>
      ConsumptionFilterDialogContentState();
}

class ConsumptionFilterDialogContentState
    extends State<ConsumptionFilterDialogContent> {
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // From Date Picker
          const Divider(),
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
        ],
      ),
    );
  }
}
class HistoryFilterDialogContent extends StatefulWidget {
  const HistoryFilterDialogContent({super.key});

  @override
  HistoryFilterDialogContentState createState() =>
      HistoryFilterDialogContentState();
}

class HistoryFilterDialogContentState
    extends State<HistoryFilterDialogContent> {
  DateTime? fromDate;
  DateTime? toDate;
  var dropdownValue="Select Type";
  var list_items = ["Select Type","Pin 1","Pin 2","Pin 3","Relay 1","Relay 2"]; 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                items: list_items.map((String dropdownStringItem) {
                  return DropdownMenuItem(
                    value: dropdownStringItem,
                    child: Text(dropdownStringItem,style: const TextStyle(color: Colors.black38),),
                  );
                }).toList(),
                onChanged: (String? newItem) {
                  _DropItemSelected(newItem!);
                },
                value: dropdownValue,
              ),
            ),
              ],
            )
        );
  }
void _DropItemSelected(String newelement){
    setState(() {
      dropdownValue=newelement;
    });
    }
}

class NotificationFilterDialogContent extends StatefulWidget {
  const NotificationFilterDialogContent({super.key});

  @override
  NotificationFilterDialogContentState createState() =>
      NotificationFilterDialogContentState();
}

class NotificationFilterDialogContentState
    extends State<NotificationFilterDialogContent> {
  DateTime? fromDate;
  DateTime? toDate;
  var dropdownValue="Select Type";
  var list_items = ["Select Type","Pin 1","Pin 2","Pin 3","Relay 1","Relay 2"]; 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                items: list_items.map((String dropdownStringItem) {
                  return DropdownMenuItem(
                    value: dropdownStringItem,
                    child: Text(dropdownStringItem,style: const TextStyle(color: Colors.black38),),
                  );
                }).toList(),
                onChanged: (String? newItem) {
                  _DropItemSelected(newItem!);
                },
                value: dropdownValue,
              ),
            ),
              ],
            )
        );
  }
void _DropItemSelected(String newelement){
    setState(() {
      dropdownValue=newelement;
    });
    }
}


class AlertFilterDialogContent extends StatefulWidget {
  const AlertFilterDialogContent({super.key});

  @override
  AlertFilterDialogContentState createState() =>
      AlertFilterDialogContentState();
}

class AlertFilterDialogContentState
    extends State<AlertFilterDialogContent> {
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // From Date Picker
          const Divider(),
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
        ],
      ),
    );
  }
}