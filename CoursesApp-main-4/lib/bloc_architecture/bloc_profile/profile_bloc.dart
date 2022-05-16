import 'dart:async';
import 'package:courses_app/bloc_architecture/bloc_profile/profile_handle_action_event.dart';
import 'package:courses_app/models/podcast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_events.dart';

class ProfileBloc extends BlocBase with ProfileHandleActionEvent {
  // данные Bloc-а
static var p = [
    Podcast('7', 'Вегетарианство', 'Питаемся без мяса', 'd', 'Мария', '',
        'https://images.pexels.com/photos/6647911/pexels-photo-6647911.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),

    Podcast('8', 'Введение в буддизм', 'Культурно развиваемся', 'd', 'Мария', '',
        'https://images.pexels.com/photos/9408318/pexels-photo-9408318.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Podcast('9', 'Будет ли кризис?', 'Подготавливаем финансовую подушку', 'd', 'Мария', '',
        'https://images.pexels.com/photos/258644/pexels-photo-258644.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Podcast('10', 'Как выбрать ноутбук?', '16 Гб или 8Гб оперативы?', 'd', 'Мария', '',
        'https://images.pexels.com/photos/5698417/pexels-photo-5698417.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),

    Podcast('11', 'Зовем девушку на свидание', 'Говорим правильные вещи', 'd', 'Мария', '',
        'https://images.pexels.com/photos/2145/sea-sunset-beach-couple.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Podcast('12', 'Знакомимся с историей', 'Значимость Ивана Грозного', 'd', 'Мария', '',
        'https://images.pexels.com/photos/1172018/pexels-photo-1172018.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Podcast('13', 'Учимся программировать', 'Знакомимся с Python', 'd', 'Мария', '',
        'https://images.pexels.com/photos/5749818/pexels-photo-5749818.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Podcast('14', 'Зачем носить очки?', 'Поддерживаем зрение', 'd', 'Мария', '',
        'https://images.pexels.com/photos/874158/pexels-photo-874158.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Podcast('15', 'Забота о себе', 'Следим за режимом', 'd', 'Мария', '',
        'https://images.pexels.com/photos/7162257/pexels-photo-7162257.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Podcast('16', 'Делаем ремонт', 'Выбираем обои', 'd', 'Мария', '',
        'https://images.pexels.com/photos/3933229/pexels-photo-3933229.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Podcast('17', 'Обработка фото', 'Знакомимся с Photoshop', 'd', 'Мария', '',
        'https://images.pexels.com/photos/3680219/pexels-photo-3680219.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Podcast('18', 'Уборка дома', 'Как не устать?', 'd', 'Мария', '',
        'https://images.pexels.com/photos/4108709/pexels-photo-4108709.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
  ];
  final StreamController<ProfileBlocEvent> _eventController =
      StreamController<ProfileBlocEvent>();

  Sink<ProfileBlocEvent> get inEvent => _eventController.sink;
  Stream<ProfileBlocEvent> get _outEvent => _eventController.stream;

  ProfileBloc() : super(null) {
    // подписываемся на поток
    // здесь обрабатываются события, пришедшие со стороны UI
    _outEvent.listen(_handleEvent);
  }

  @override
  void dispose() {
    // здесь мы закрываем открытые контроллеры
    _eventController.close();
  }

  void _handleEvent(ProfileBlocEvent event) {
    switch (event.runtimeType) {
      case OnFavouritesClick:
        handleOnClickFavouriteEvent();
        break;
      case OnPassedClick:
        handleOnClickPassedEvent();
        break;
      default:
        // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
        assert(false, "Should never reach there");
        break;
    }
  }
}
