import 'package:flutter/material.dart';
import 'package:reader_tracker/db/database_helper.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:sqflite/sqflite.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved"),
      ),
      body: FutureBuilder<List<Book>>(
        future: DatabaseHelper.instance.readAllBooks(),
        builder: (context, snapshot) => snapshot.hasData? ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context,index){
            Book book = snapshot.data![index];
            return ListTile(title: Text(book.title),);
        }) : const Center(child: const CircularProgressIndicator()),
        ),
    );
  }
}