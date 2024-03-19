import "package:flutter/material.dart";

class CodeReview extends StatelessWidget {
  const CodeReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Code Review"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Column(
        children: [
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
        ],
      ),
    );
  }
}
