import 'package:get/get.dart';
import 'package:latihan1_11pplg1/models/football_models.dart';

class FootballControl extends GetxController{
  var players = <Football> [
    Football(name: "Jack ka huna laguna", position: "kipper", number: 25, imageUrl: "https://i.pinimg.com/736x/6a/70/43/6a70430861c3574fcfc20e6697abe2de.jpg"),
    Football(name: "William ", position: "back", number: 15, imageUrl: "https://static.wikia.nocookie.net/whumpapedia/images/0/0a/Will_Turner.jpeg/revision/latest?cb=20210413214910"),
    Football(name: "Smith", position: "penyerang", number: 20, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKbIip41dP4L-we-b8YIpjLP3Epzbzcm1rTQ&s"),
    Football(name: "gibbs", position: "gelandang", number: 30, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W_cjaLkNqBGoz3lsx701QTGRJfRDqnhzrw&s"),

  ].obs;

  void updatePlayer(int index, Football newPlayer){
    players[index] = newPlayer;
    update();
  }
}