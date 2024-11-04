import 'package:flutter/material.dart';
import 'package:reader_tracker/pages/books_details.dart';
import 'pages/home_screen.dart';
import 'pages/saved_screen.dart';
import 'pages/favourites_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/home':(context)=>const HomeScreen(), 
        '/Saved':(context)=>const SavedScreen(),
        '/Favourites':(context)=>const FavouritesScreen(),
        '/details':(context)=>const BookDetailsScreen(),
      },
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SavedScreen(),
    const FavouritesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("A.Reader"),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Saved'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites')
      ],
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
      onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
      },
      ),
      
    );
  }
}