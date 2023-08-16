import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BackButtonAlert(),
  ));
}

class BackButtonAlert extends StatelessWidget {
  const BackButtonAlert({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> showAlert() async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: Text("Are you sure?"), actions: [
              ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pop(true);
                  }),
                  child: const Text("Yes")),
              ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pop(false);
                  }),
                  child: const Text("No")),
              ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pop(false);
                  }),
                  child: const Text("Cancel"))
            ]);
          });
    }

    return WillPopScope(
      onWillPop: showAlert,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Back Button Alert'),
        ),
        body: Center(
          child: Text(
            "Press here to exit!!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
