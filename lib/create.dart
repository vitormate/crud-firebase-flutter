import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'components/form.dart';
import 'components/button.dart';

class ScreemCreate extends StatefulWidget {
  const ScreemCreate({super.key});

  @override
  State<ScreemCreate> createState() => _ScreemCreateState();
}

class _ScreemCreateState extends State<ScreemCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: startupForm(),
    );
  }

  startupForm() {
    final idStartup = TextEditingController();
    final nomeStartup = TextEditingController();
    final cidadeSede = TextEditingController();

    Future createStartup({
      required int idStartup,
      required String nomeStartup,
      required String cidadeSede,
    }) async {
      final docStartup = FirebaseFirestore.instance.collection('startup').doc();

      final json = {
        'cidade_sede': cidadeSede,
        'id_startup': idStartup,
        'nome_startup': nomeStartup,
      };

      // Criando documento na coleção startup
      await docStartup.set(json);
    }

    return Column(
      children: [
        const Text('id_startup'),
        Forms(
          controller: idStartup,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text('nome_startup'),
        Forms(
          controller: nomeStartup,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text('cidade_sede'),
        Forms(
          controller: cidadeSede,
        ),
        const SizedBox(
          height: 30,
        ),
        Button(
            text: 'Enviar',
            fn: () {
              createStartup(
                cidadeSede: cidadeSede.text,
                nomeStartup: nomeStartup.text,
                idStartup: int.parse(idStartup.text),
              );
            }),
      ],
    );
  }
}
