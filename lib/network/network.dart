import 'package:reader_tracker/models/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  //api endpoint

  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<Book>> searchBooks(String query) async {
    
    var url = Uri.parse('$_baseUrl?q=$query');
    var response = await http.get(url);

    if(response.statusCode==200){
      //we have got data
      var data = json.decode(response.body);
      if(data['items'] != null && data['items'] is List ){
          List<Book> books = (data['items'] as List<dynamic>)
                              .map((item)=> Book.fromJson(item as Map<String, dynamic>))
                              .toList();
          return books;
      }else{
        return [];
      }
    }else{
      print("Reponse is not 200");
      throw Exception('Failed to load books');
    }

  }
}