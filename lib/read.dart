import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScreenRead extends StatefulWidget {
  const ScreenRead({super.key});

  @override
  State<ScreenRead> createState() => _ScreenReadState();
}

class _ScreenReadState extends State<ScreenRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('startup')
            // .where('cidade_sede', isEqualTo: 'Recife')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Espere um pouco');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot startups = snapshot.data!.docs[index];
                return Card(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            startups['id_startup'].toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            startups['nome_startup'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            startups['cidade_sede'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
