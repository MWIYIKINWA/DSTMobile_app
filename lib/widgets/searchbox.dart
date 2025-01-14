import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key, required this.onchanged});

  final Function(String) onchanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: (String val) {
          onchanged(val);
        },
        decoration: const InputDecoration(
          hintText: "Search",
          labelStyle: TextStyle(fontSize: 16, fontFamily: "Poppins"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        ),
      ),
    );
  }
}
