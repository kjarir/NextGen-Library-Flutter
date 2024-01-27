import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'bookDetails.dart';
import 'package:flutter/cupertino.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchTextFieldExample(),
    );
  }
}

class SearchTextFieldExample extends StatefulWidget {
  const SearchTextFieldExample({Key? key}) : super(key: key);

  @override
  State<SearchTextFieldExample> createState() => _SearchTextFieldExampleState();
}

class _SearchTextFieldExampleState extends State<SearchTextFieldExample> {
  String text = '';
  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final url = Uri.parse(
        'https://dev.alphadigitall.com/NextGenLibrary/api/Book/GetAllBooks/GetAllBooks');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        filteredBooks =
            responseData.map((data) => Book.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load books');
    }
  }

  void filterBooks(String query) {
    setState(() {
      filteredBooks = filteredBooks
          .where((book) =>
              book.bookName.toLowerCase().contains(query.toLowerCase()) ||
              book.author.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(
              15, 10, 15, 0), // Adjust margin as needed
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: CupertinoSearchTextField(
              onChanged: (String value) {
                filterBooks(value);
              },
              onSubmitted: (String value) {
                filterBooks(value);
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 0, bottom: 0), // Adjust margin as needed
            child: BookList(books: filteredBooks),
          ),
        ),
      ],
    );
  }
}

class BookList extends StatelessWidget {
  final List<Book> books;

  const BookList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 0), // Adjust margin as needed
          child: BookCard(
            book: books[index],
          ),
        );
      },
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({
    required this.book,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardbg = const Color(0xFFFFFFFF);

    return Card(
      color: cardbg,
      elevation: 2,
      margin:
          const EdgeInsets.fromLTRB(15, 6, 15, 10), // Adjust margin as needed
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 150,
            child: Image.network(
              book.coverImg,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    book.bookName,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Author: ${book.author}',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8), // Adjust horizontal margin
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetails(book: book),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF0080), Color(0xFF7928CA)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.grey
                                .withOpacity(0.2), // Adjust opacity as needed
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 26, // Adjust horizontal padding
                            ),
                            child: Text(
                              'Read',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
