import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'components/button.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'CRUD',
          style: TextStyle(
            fontSize: 36,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Button(
          text: 'CREATE',
          fn: () {
            final docStartup =
                FirebaseFirestore.instance.collection('startup').doc('6');

            docStartup.set({
              'id_startup': 10007,
              'nome_startup': 'Vitor',
              'cidade_sede': 'Camaragibe',
            });

            // Ir para a página onde se adiciona por um formulário
            // Navigator.pushNamed(context, '/create');
          },
        ),
        const SizedBox(
          height: 50,
        ),
        Button(
          text: 'READ',
          fn: () {
            Navigator.pushNamed(context, '/read');
          },
        ),
        const SizedBox(
          height: 50,
        ),
        Button(
          text: 'UPDATE',
          fn: () {
            final docStartup =
                FirebaseFirestore.instance.collection('startup').doc('6');

            docStartup.update({
              'cidade_sede': 'Recife',
            });
          },
        ),
        const SizedBox(
          height: 50,
        ),
        Button(
          text: 'REMOVE',
          fn: () {
            final docStartup =
                FirebaseFirestore.instance.collection('startup').doc('6');
            // .delete();

            // Exclui um campo específico do documento
            docStartup.update({
              'cidade_sede': FieldValue.delete(),
            });
          },
        ),
      ],
    );
  }
}
