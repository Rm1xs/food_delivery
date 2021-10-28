import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Hero(
          tag: 'search',
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: IconTheme(
                data: IconThemeData(
                  color: const Color.fromRGBO(218, 99, 23, 1)
                      .withOpacity(1),
                ),
                child: const Icon(Icons.search),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.transparent, width: 0.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.transparent, width: 0.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true,
              hintStyle: TextStyle(
                  color: const Color.fromRGBO(218, 99, 23, 1)
                      .withOpacity(0.4)),
              hintText: 'What do you want to order?',
              contentPadding: EdgeInsets.all(10.0),
              fillColor: const Color.fromRGBO(218, 99, 23, 1)
                  .withOpacity(0.08),
            ),
          ),
        ),
      ),
    );
  }
}
