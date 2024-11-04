import 'package:flutter/material.dart';
import 'package:reader_tracker/db/database_helper.dart';
import 'package:reader_tracker/models/book.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  ElevatedButton(onPressed: () async{
                    //save a book to the database
                    try {
                      int savedInt = await DatabaseHelper.instance.insert(book);
                      SnackBar snackBar = SnackBar(content: Text("Book Saved $savedInt"),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } catch (e) {
                      print("Error: $e");
                    }
                  }, child: const Text("Save")),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.favorite),
                    onPressed: () async{
                      await DatabaseHelper.instance.readAllBooks()
                              .then((books)=>{
                                for(Book book in books){
                                  print("Title: ${book.title}")
                                }
                              });
                    }, 
                    label: const Text("Favorites"),
                    )
                ],
              ),
              const SizedBox(height: 10,),
              Text("Description", style: theme.titleMedium),
               const SizedBox(height: 5,),
               Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary
                  )
                ),
                child:  Text(book.description),

               )
            ],
          ),
        ),
      ),
    );
  }
}