import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/Controllers/football_control.dart';
import 'package:latihan1_11pplg1/Pages/football_edit_page.dart';
import 'package:latihan1_11pplg1/Routes/routes.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});

  final FootballControl footballController = Get.put(FootballControl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("My Football Players Page"),),
      backgroundColor: const Color.fromARGB(255, 103, 235, 96),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              final player = footballController.players[index];
              return Card(
                shadowColor: Color.fromARGB(255, 191, 65, 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Color.fromRGBO(
                    191,
                    65,
                    3,
                    0.3,
                  ), // warna saat klik
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.footballedit,
                      arguments: {'player': player, 'index': index},
                    );
                  },
                  child: ListTile(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.footballedit,
                        arguments: {'player': player, 'index': index},
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(player.imageUrl),
                    ),
                    title: Text(player.name),
                    subtitle: Text('${player.position} . #${player.number}'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
