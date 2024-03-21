import 'package:cg_flutter_implementation/core/utils/search_util.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Test highlightText',
    () {
      test(
        'highlightText to check null or empty',
        () {
          expect(
            highlightText(
              '',
              '',
              true,
            ),
            const TextSpan(text: ''),
          );
        },
      );
    },
  );
  test(
    'highlightText to searchQuery empty',
    () {
      expect(
        highlightText(
          'Robert',
          '',
          true,
        ),
        const TextSpan(text: 'Robert'),
      );
    },
  );
  test(
    'highlightText to searchQuery check highlighted',
    () {
      expect(
        highlightText(
          'Robert',
          'R',
          true,
        ),
        TextSpan(
          children: [
            TextSpan(
              text: 'Robert'.substring(0, 0),
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
            ),
            TextSpan(
              text: 'Robert'.substring(0, 1),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFF0597AA),
              ),
            ),
            TextSpan(
              text: 'Robert'.substring(1),
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      );
    },
  );
}
