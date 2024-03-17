import "dart:developer";

import "package:flutter/material.dart";

TextSpan highlightText(String? text, String? searchQuery, bool isName) {
  log("searchQuery $searchQuery");
  if (text == null || searchQuery == null) return const TextSpan(text: "");
  if (searchQuery.isEmpty) return TextSpan(text: text);
  final lowerText = text.toLowerCase();
  final lowerSearchQuery = searchQuery.toLowerCase();
  final startIndex = lowerText.indexOf(lowerSearchQuery);
  if (startIndex < 0) return TextSpan(text: text);
  final endIndex = startIndex + lowerSearchQuery.length;
  return TextSpan(
    children: [
      TextSpan(
        text: text.substring(0, startIndex),
        style: TextStyle(
          fontSize: isName ? 15 : 14,
          color: Colors.grey.shade700,
        ),
      ),
      TextSpan(
        text: text.substring(startIndex, endIndex),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: isName ? 15 : 14,
          color: const Color(0xFF0597AA),
        ),
      ),
      TextSpan(
        text: text.substring(endIndex),
        style: TextStyle(
          fontSize: isName ? 15 : 14,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}
