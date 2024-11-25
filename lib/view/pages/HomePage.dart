import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goatmitra/view/pages/Adduser.dart';
import 'package:goatmitra/view/pages/ChatBot.dart';
import 'package:goatmitra/view/widgets/drawer.dart';
import 'package:goatmitra/view/widgets/userCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("user"),
          ),
      drawer: const MyDrawer(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddUser()),
              );
            },
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatBot()),
              );
            },
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.chat,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back,",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
            ),
            const Text(
              "Utkarsh!",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 16, right: 16),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('applications')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) =>
                          UserCard(snap: snapshot.data?.docs[index]));
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
