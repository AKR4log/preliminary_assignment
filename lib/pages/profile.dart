// ignore_for_file: missing_return, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertest/pages/edit.dart';
import 'package:http/http.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var user;
  bool load = false;
  var photoData = [];

  Future<List> fetchPhotos() async {
    try {
      final response =
          await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/'));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        photoData = jsonData;
      });
    } catch (error) {
      print(error);
    }
  }

  Future getData() async {
    try {
      final response =
          await get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
      final jsonData = jsonDecode(response.body);

      setState(() {
        user = jsonData;
        load = true;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    getData();
    fetchPhotos();
    super.initState();
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
            'Profile',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Edit(),
                      ),
                    ),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                load
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user['username'].toString().toLowerCase(),
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black),
                              ),
                              Text(
                                user['name'],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            user['email'].toString().toLowerCase(),
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Phone: ' + user['phone'],
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Website: ' + user['website'],
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green.shade300),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Address',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Street: ' + user['address']['street'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  'Suite: ' + user['address']['suite'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  'City: ' + user['address']['city'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  'Zipcode: ' + user['address']['zipcode'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  'GEO: ' +
                                      user['address']['geo']['lat'] +
                                      ' ' +
                                      user['address']['geo']['lng'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue.shade300),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Company: ' + user['company']['name'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Catch Phrase: ' +
                                      user['company']['catchPhrase'],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  'BS: ' + user['company']['bs'],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 240,
                            child: PageView.builder(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemCount: 3,
                                allowImplicitScrolling: true,
                                pageSnapping: true,
                                itemBuilder: (context, position) {
                                  final photo = photoData[position];
                                  return Image.network(
                                    photo['url'],
                                  );
                                }),
                          )
                        ],
                      )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        ));
  }
}
