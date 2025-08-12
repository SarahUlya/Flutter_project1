import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/Controllers/football_control.dart';
import 'package:latihan1_11pplg1/models/football_models.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});
  final FootballControl footballControl = Get.find();
  final Map args = Get.arguments;

  late final Football player = args['player'];
  late final int index = args['index'];

  final TextEditingController nameControl = TextEditingController();
  final TextEditingController positionControl = TextEditingController();
  final TextEditingController numberControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameControl.text = player.name;
    positionControl.text = player.position;
    numberControl.text = player.number.toString();

    return Scaffold(
      appBar: AppBar(title: Text('edit ${player.name}')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(player.imageUrl),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nameControl,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextFormField(
              controller: positionControl,
              decoration: InputDecoration(labelText: 'Posisi'),
            ),
            TextFormField(
              controller: numberControl,
              decoration: InputDecoration(labelText: 'Nomor Punggung'),
            ),
            TextFormField(
              initialValue: player.imageUrl,
              decoration: InputDecoration(labelText: 'Image Url'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatePlayer = Football(
                  name: nameControl.text,
                  position: positionControl.text,
                  number: int.tryParse(numberControl.text) ?? player.number,
                  imageUrl: player.imageUrl,
                );
                footballControl.players[index]=updatePlayer;
                footballControl.players.refresh();
                Get.back();
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
