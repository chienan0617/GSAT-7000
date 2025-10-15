import 'package:flutter/material.dart';
import 'package:vocabulary/base.dart';

class VocabularyTextbookPage extends StatefulWidget {
  const VocabularyTextbookPage({super.key});

  @override
  State<VocabularyTextbookPage> createState() => _VocabularyTextbookPageState();
}

class _VocabularyTextbookPageState extends State<VocabularyTextbookPage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: background3,
      appBar: AppBar(
        backgroundColor: background1,
        leading: iconButton(
          icon(Icons.arrow_back, 26),
          () => Navigator.pop(ctx),
        ),
      ),
    );
  }
}
