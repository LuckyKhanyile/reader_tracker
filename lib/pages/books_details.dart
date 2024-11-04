import 'package:flutter/material.dart';
import 'package:reader_tracker/utils/books_details_args.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as BookDetailsArgs;
    final book = args.itemBook;
    return  Scaffold(
      appBar:  AppBar(title:  Text(book.title)),
    );
  }
}