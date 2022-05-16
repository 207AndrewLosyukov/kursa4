import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/podcast.dart';

class PodcastNetwork {
  PodcastNetwork();

  var p = [
    Podcast('7', 'Вегетарианство', 'Питаемся без мяса', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('8', 'Введение в буддизм', 'Культурно развиваемся', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('9', 'Будет ли кризис?', 'Подготавливаем финансовую подушку', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('10', 'Как выбрать ноутбук?', '16 Гб или 8Гб оперативы?', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('11', 'Зовем девушку на свидание', 'Говорим правильные вещи', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('12', 'Знакомимся с историей', 'Значимость Ивана Грозного', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('13', 'Учимся программировать', 'Знакомимся с Python', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('14', 'Зачем носить очки?', 'Поддерживаем зрение', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('15', 'Забота о себе', 'Следим за режимом', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('16', 'Делаем ремонт', 'Выбираем правильные цветы', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('17', 'Обработка фото', 'Знакомимся с Photoshop', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('18', 'Уборка дома', 'Как не устать?', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
  ];
  CollectionReference podcasts =
      FirebaseFirestore.instance.collection('podcasts');

  Future<void> addPodcastToDb(Podcast podcast) {
    return podcasts
        .add({
          'id': podcast.id,
          'title': podcast.title,
          'info': podcast.info,
          'section': podcast.section,
          'author': podcast.author,
          'coverImage': podcast.coverImage,
          'audio': podcast.audio,
        })
        .then((value) => print("Podcast Added"))
        .catchError((error) => print("Failed to add podcast: $error"));
  }

  Future<Podcast> getPodcastFromDb(String id) async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("podcasts")
        .doc(id)
        .get(); //get the data
    return Podcast.parse(data);
  }

  Future<List<Podcast>> getAllPodcastsFromDb() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('podcasts').get();
    return Podcast.parseAll(querySnapshot);
  }
}
