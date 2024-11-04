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
    var theme = Theme.of(context).textTheme;
    final args = ModalRoute.of(context)?.settings.arguments as BookDetailsArgs;
    final book = args.itemBook;
    return  Scaffold(
      appBar:  AppBar(title:  Text(book.title)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if(book.imageLinks.isNotEmpty) Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.network(book.imageLinks['smallThumbnail']??'',
                fit: BoxFit.cover,
                ),
              ),
              Text(book.title, style: theme.headlineSmall,),
              Text(book.authors.join(', '), style: theme.bodySmall,),
              Text('Punlished: ${book.publishedDate}', style: theme.bodySmall,),
              Text('Page count: ${book.pageCount}', style: theme.bodySmall,),
              Text('Language: ${book.language}', style: theme.bodySmall,),
              
            ],
          ),
        ),
      ),
    );
  }
}