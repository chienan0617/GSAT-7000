import 'package:flutter/material.dart';
import 'package:vocabulary/base.dart';

class VocabularyDetailPage extends StatefulWidget {
  const VocabularyDetailPage({super.key});

  @override
  State<VocabularyDetailPage> createState() => _VocabularyDetailPageState();
}

class _VocabularyDetailPageState extends State<VocabularyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background3,
      appBar: AppBar(
        backgroundColor: background1,
        centerTitle: true,
        shadowColor: textColor,
        elevation: 0.25,
        scrolledUnderElevation: 1,
        surfaceTintColor: Colors.transparent,
        title: textNt("Detailed", 20, fw7),
        leading: iconButton(
          icon(Icons.arrow_back, 26),
          () => Navigator.pop(context),
        ),
      ),
    );
  }
}
