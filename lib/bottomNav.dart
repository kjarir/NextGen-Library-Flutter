import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextgen/bookDetails.dart';
import 'package:nextgen/home.dart';
import 'package:nextgen/profile.dart';
import 'package:nextgen/scanner.dart';
import 'package:nextgen/search.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:convert/convert.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NextGen(),
    );
  }
}

class NextGen extends StatefulWidget {
  const NextGen({Key? key}) : super(key: key);

  @override
  _NextGenState createState() => _NextGenState();
}

class _NextGenState extends State<NextGen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    const Search(),
    ScannerPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.nfc,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initNFC();
  }

  Future<void> _initNFC() async {
    try {
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          debugPrint('NFC Tag Detected: ${tag.data['ndef']['identifier']}');
          var str = hex.encoder.convert(tag.data['ndef']['identifier']);
          print(str);
          // Fetch book details from the API
          final book = await fetchBookDetails(str);
          if (book != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetails(
                  book: book,
                ),
              ),
            );
          } else {
            // Handle case when book details couldn't be fetched
            print('Failed to fetch book details.');
          }
        },
      );
    } catch (e) {
      print('Error initializing NFC: $e');
    }
  }

  Future<Book?> fetchBookDetails(String nfc) async {
    final url = Uri.parse(
        'https://dev.alphadigitall.com/NextGenLibrary/api/Book/GetBookByNFC/' + nfc);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        // Check if the jsonData is not null and is a non-empty list
        if (jsonData != null) {
          return Book.fromJson(jsonData);
        }
      } else {
        print('Failed to fetch book details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching book details: $e');
    }

    return null; // Return null if there's an error or no data
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession();
    super.dispose();
  }
}
