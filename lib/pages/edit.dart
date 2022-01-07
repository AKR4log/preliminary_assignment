import 'package:flutter/material.dart';
import 'package:fluttertest/pages/profile.dart';

class Edit extends StatefulWidget {
  const Edit({Key key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  Widget container(String name, String placeholder) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(hintText: placeholder),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Edit',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profile(),
                    ),
                  ),
              icon: const Icon(
                Icons.done_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            container('Name', 'Edit name'),
            container('Username', 'Edit username'),
            container('Email', 'Edit email'),
            container('Phone', 'Edit Phone')
          ],
        ),
      ),
    );
  }
}
