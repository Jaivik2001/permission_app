import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: use_function_type_syntax_for_parameters
  snackBar(Text text) async {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await Permission.camera.status).toString()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Permission App",
          style: TextStyle(color: CupertinoColors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  "Camera Permission",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: CupertinoColors.black),
                ),
                onPressed: () async {
                  var per = await Permission.camera.request();
                  if (per.isGranted) {
                    snackBar(Text("Permission Granted"));
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  "Storage Permission",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: CupertinoColors.black),
                ),
                onPressed: () async {
                  var per = await Permission.storage.request();
                  if (per.isGranted) {
                    snackBar(Text("Permission Granted"));
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  "Location Permission",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: CupertinoColors.black),
                ),
                onPressed: () async {
                  var per = await Permission.location.request();
                  if (per.isGranted) {
                    snackBar(Text("Permission Granted"));
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  "Contacts Permission",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: CupertinoColors.black),
                ),
                onPressed: () async {
                  var per = await Permission.contacts.request();
                  if (per.isGranted) {
                    snackBar(Text("Permission Granted"));
                  }
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text(
                "Notification",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: CupertinoColors.black),
              ),
              onPressed: () async {
                Map<Permission, PermissionStatus> per = await [
                  Permission.location,
                  Permission.storage,
                  Permission.camera,
                  Permission.contacts,
                  Permission.notification
                ].request();
                if (per[1]!.isGranted ||
                    per[2]!.isGranted ||
                    per[3]!.isGranted ||
                    per[4]!.isGranted ||
                    per[5]!.isGranted) {
                  snackBar(Text("Permission Granted"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
