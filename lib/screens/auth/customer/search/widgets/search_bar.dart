import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: TextField(
          onChanged: onChanged,
          decoration: const InputDecoration(
            hintText: "Search food...",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}