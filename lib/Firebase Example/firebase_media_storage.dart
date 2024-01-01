import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDt-fGL6T4paXZy5aCH_XLPqRSkqhMN9ZU",
    projectId: "movieapp-b8922",
    appId: '1:34070684426:android:9d31a348611f77ac2850f3',
    messagingSenderId: '',
    storageBucket: "movieapp-b8922.appspot.com",
  ));
  runApp(MaterialApp(
    home: FireMediaStorage(),
  ));
}

class FireMediaStorage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FireMediaStorageState();
}

class _FireMediaStorageState extends State {
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store Media"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                    onPressed: () => upload('camera'),
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text("Camera")),
                ElevatedButton.icon(
                    onPressed: () => upload('gallery'),
                    icon: const Icon(Icons.photo),
                    label: const Text("Gallery"))
              ],
            ),
            Expanded(
                child: FutureBuilder(
                    //if firebase connection is success load data
                    future: loadData(),
                    builder: (context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final Map<String, dynamic> image =
                                  snapshot.data![index];
                              //each map value from list images stored in map image
                              return Card(
                                child: ListTile(
                                  leading: Image.network(image['imageurl']),
                                  title: Text(image['uploadedBy']),
                                  subtitle: Text(image['description']),
                                  trailing: IconButton(
                                      onPressed: () =>
                                          deleteData(image['path']),
                                      icon: Icon(Icons.delete)),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }

  Future<void> upload(String imageSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;

    try {
      pickedImage = await picker.pickImage(
          source: imageSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);
      final String fileName = path.basename(pickedImage!.path);
      File imagefile = File(pickedImage.path); // import dart.io;
      try {
        await storage.ref(fileName).putFile(
            imagefile,
            SettableMetadata(customMetadata: {
              'uploadedBy': "Its Me Xxxx",
              'description': "Some Description"
            }));
        setState(() {}); // refresh ui
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (error) {
      print(error);
    }
  }

//load the data from firebase
  Future<List<Map<String, dynamic>>> loadData() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage.ref().list();
    final List<Reference> allfiles =
        result.items; // all the data from firebase stored as reference
    //all items one by one
    await Future.forEach(allfiles, (singlefile) async {
      final String fileurl = await singlefile
          .getDownloadURL(); // to fetch image patch(path as network image path)
      final FullMetadata metadata =
          await singlefile.getMetadata(); //to fetch metadata from firebase

      images.add({
        'imageurl': fileurl,
        'path': singlefile.fullPath,
        'uploadedBy': metadata.customMetadata?['uploadedBy'] ?? 'No Data',
        'description':
            metadata.customMetadata?['descriptiion'] ?? 'No Description'
      });
    });
    return images;
  }

  Future<void> deleteData(String imagepath) async {
    await storage.ref(imagepath).delete();
    setState(() {});
  }
}
