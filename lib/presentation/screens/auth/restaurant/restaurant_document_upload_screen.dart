import 'package:flutter/material.dart';

class RestaurantDocumentUploadScreen extends StatefulWidget {
  const RestaurantDocumentUploadScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantDocumentUploadScreen> createState() => _RestaurantDocumentUploadScreenState();
}

class _RestaurantDocumentUploadScreenState extends State<RestaurantDocumentUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Documents')),
      body: Center(
        child: Text('Document Upload Form'),
      ),
    );
  }
}
