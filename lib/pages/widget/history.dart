import 'package:flutter/material.dart';
import 'package:g_parking/pages/widget/delete_history_allert.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'History',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  )),
                  context: context,
                  builder: (context) => const DeleteHistoryAllert(),
                );
              },
              child: Text(
                'Clear history?',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 204, 240),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
