import 'dart:html';

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
    getUsers() async {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('linguagem_programacao')
          .where('ano_lancamento', isLessThan: 2000)
          .orderBy('ano_lancamento', descending: false)
          .get();

      return snapshot.docs;
    }

    var testagem = getUsers();
    testagem.then((e) {
      print(e[1]['ano_lancamento']);
      print(e[1]['id_linguagem']);
      print(e[1]['nome_linguagem']);
      print("############################");
    });
    testagem.then((e) {
      for (var element in e) {
        print(element['ano_lancamento']);
        print(element['id_linguagem']);
        print(element['nome_linguagem']);
      }
    });
    print(testagem);

    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('startup').snapshots(),
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

// // EXEMPLO DA CONSULTA EM SQL
// // SELECT id_startup, nome_startup, cidade_sede
// // FROM startup

// class _ScreenReadState extends State<ScreenRead> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('programador')
//             .where('id_startup', whereIn: [10001, 10002]).snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Text('Espere um pouco');
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data?.docs.length,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot startups = snapshot.data!.docs[index];
//                 return Card(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             startups['nome_programador'],
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                             ),
//                           ),
//                           Text(
//                             startups['id_startup'].toString(),
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                             ),
//                           ),
//                           Text(
//                             startups['email'],
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// // EXEMPLO DA CONSULTA EM SQL
// // SELECT nome_programador, id_startup, email
// // FROM programador
// // WHERE id_startup = 10001 or id_startup = 10002

// class _ScreenReadState extends State<ScreenRead> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('linguagem_programacao')
//             .where('nome_linguagem', isNotEqualTo: "Dart")
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Text('Espere um pouco');
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data?.docs.length,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot startups = snapshot.data!.docs[index];
//                 return Card(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             startups['ano_lancamento'].toString(),
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                             ),
//                           ),
//                           Text(
//                             startups['id_linguagem'].toString(),
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                             ),
//                           ),
//                           Text(
//                             startups['nome_linguagem'],
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// EXEMPLO DA CONSULTA EM SQL
// SELECT ano_lançamento, id_linguagem, nome_linguagem
// FROM linguagem_programacao
// WHERE nome_linguagem NOT LIKE "dart";
