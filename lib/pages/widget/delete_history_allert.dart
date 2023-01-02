import 'package:flutter/material.dart';

class DeleteHistoryAllert extends StatelessWidget {
  const DeleteHistoryAllert({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Image.asset('assets/images/deleted_ilustration.png'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Are you sure want to delete history?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Text(
                    'cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 0, 204, 240),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
