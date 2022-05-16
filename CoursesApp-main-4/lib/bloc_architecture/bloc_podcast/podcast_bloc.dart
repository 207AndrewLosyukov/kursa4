import 'dart:async';
import 'package:courses_app/bloc_architecture/bloc_podcast/podcast_handle_action_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'podcast_events.dart';

class PodcastBloc extends BlocBase with PodcastHandleActionEvent {
  // stream controllers
  final StreamController<int> _clickPodcastController = StreamController<int>();

  final StreamController<PodcastBlocEvent> _eventController =
      StreamController<PodcastBlocEvent>();

  Sink<int> get _inClickPodcast => _clickPodcastController.sink;
  Stream<int> get outClickPodcast => _clickPodcastController.stream;

  Sink<PodcastBlocEvent> get inEvent => _eventController.sink;
  Stream<PodcastBlocEvent> get _outEvent => _eventController.stream;

  PodcastBloc() : super(null) {
    // подписываемся на поток
    // здесь обрабатываются события, пришедшие со стороны UI
    _outEvent.listen(_handleEvent);
  }

  // альтернатива потоку с UI-событиями
  // void onIncrementButton() {
  //   _handleIncrementCounterEvent();
  // }

  @override
  void dispose() {
    // здесь мы закрываем открытые контроллеры
    _eventController.close();
    _clickPodcastController.close();
  }

  void _handleEvent(PodcastBlocEvent event) {
    switch (event.runtimeType) {
      case OnClickPodcastAction:
        handleOnClickPodcastEvent();
        break;
      case OnClickSearchPodcastAction:
        handleOnClickSearchPodcastEvent();
        break;
      default:
        // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
        assert(false, "Should never reach there");
        break;
    }
  }
}
