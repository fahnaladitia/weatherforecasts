part of '../common.dart';

EventTransformer<E> restartableTranformer<E>(Duration duration) {
  return (events, mapper) {
    return restartable<E>().call(events.debounce(duration), mapper);
  };
}
