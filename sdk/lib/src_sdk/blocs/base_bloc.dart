import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends dynamic> {
  BaseBloc({T state}) {
    _controller = BehaviorSubject<T>.seeded(state);
  }

  BehaviorSubject<T> _controller;
  final BehaviorSubject<dynamic> _listenerController = BehaviorSubject<dynamic>();
  final BehaviorSubject<bool> _loadingController = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> _waitingController = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loadingStream => _loadingController?.stream;
  Stream<bool> get waitingStream => _waitingController?.stream;
  Stream<T> get stateStream => _controller?.stream;
  Stream<dynamic> get listenerStream => _listenerController?.stream;

  T get state => _controller?.value;

  @mustCallSuper
  void dispose() {
    _controller?.close();
    _listenerController?.close();
    _loadingController?.close();
    _waitingController?.close();
  }

  void emitLoading(bool loading) {
    if (_loadingController?.isClosed ?? true) return;
    _loadingController?.sink?.add(loading);
  }

  void emitWaiting(bool waiting) {
    if (_waitingController?.isClosed ?? true) return;
    _waitingController?.sink?.add(waiting);
  }

  void emitListener(dynamic payload) {
    if (_listenerController?.isClosed ?? true) return;
    _listenerController?.sink?.add(payload);
  }

  @mustCallSuper
  void onResume() {}

  @mustCallSuper
  void onPause() {}

  @mustCallSuper
  void onDetach() {}

  @mustCallSuper
  void onInactive() {}

  void emit(dynamic state) => _controller?.sink?.add(state);
}
