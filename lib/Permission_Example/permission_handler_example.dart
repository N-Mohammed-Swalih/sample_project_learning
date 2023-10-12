import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(GetMaterialApp(
    home: CheckPermission(),
  ));
}

class CheckPermission extends StatefulWidget {
  @override
  State<CheckPermission> createState() => _CheckPermissionState();
}

class _CheckPermissionState extends State<CheckPermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permission Buttons"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: requestCameraPermission,
              child: const Text("Request Camera Permission")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: requestMultiplePermission,
              child: const Text("Request Multiple Permission")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: requestPermissionWithOpenSettings,
              child: const Text("Request Settings Permission")),
        ],
      ),
    );
  }

  void requestCameraPermission() async {
    //status can be either denied,granted,restricted or permenently denied
    var status = await Permission.camera.status;
    if (status.isGranted) {
      ImagePicker picker = ImagePicker();
      picker.pickImage(source: ImageSource.camera);
      print("Permission is granted");
    } else if (status.isDenied) {
      Get.snackbar("Error", "Permission Denied");
      //We didn't ask for permission yet or the permission has been denied before
      if (await Permission.camera.request().isGranted) {
        //Either the permission was already granted before the user just granted
        print("Permission Was Granted");
      }
    }
  }

  void requestMultiplePermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.phone,
      Permission.photos,
    ].request();
    print("location permission: ${statuses[Permission.location]},"
        "Storage permission: ${statuses[Permission.storage]}");
  }

  //the user opted to never again see the permission request dialog for this app
  //the only way to change the permission's status now is to let the user manually enable it in the settings
  void requestPermissionWithOpenSettings() {
    openAppSettings();
  }
}
