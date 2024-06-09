import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://eksucuarcywfvaiblkjn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVrc3VjdWFyY3l3ZnZhaWJsa2puIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc0ODI3NjgsImV4cCI6MjAzMzA1ODc2OH0.-2D5Z1enXRhTzfhh6fKFnH6AbDE_VXgYDzyI9QLSVYE',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todos',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _notesStream =
      Supabase.instance.client.from('notes').stream(primaryKey: ['id']);
  final SupabaseService _supabaseService = SupabaseService();

  Future<void> _deleteItem(dynamic value) async {
    try {
      await _supabaseService.deleteData('notes', 'body', value);
      setState(() {
        // Optionally, you can refresh your data here after deletion
      });
    } catch (e) {
      // Handle the error, for example by showing a SnackBar
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to delete item: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: _notesStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final notes = snapshot.data!;

            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notes[index]['body']),
                    trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteItem(notes[index]['body'])),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return SimpleDialog(
                  title: const Text('Add a note'),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    TextFormField(
                      onFieldSubmitted: (value) async {
                        await Supabase.instance.client
                            .from('notes')
                            .insert({'body': value});
                      },
                    ),
                  ],
                );
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SupabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> deleteData(String table, String column, dynamic value) async {
    final response = await supabase.from(table).delete().eq(column, value);

    if (response.error != null) {
      throw Exception('Failed to delete data: ${response.error!.message}');
    }
  }
}
