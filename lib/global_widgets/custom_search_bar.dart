import 'package:emoodie_spotify_test/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final Function(String) onSearch;
  final VoidCallback? onClear;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.onSearch,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            size: 30,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              onChanged: onSearch,
            ),
          ),
        ],
      ),
    );
  }
}
