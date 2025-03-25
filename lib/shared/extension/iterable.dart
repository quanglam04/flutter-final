import 'package:flutter/material.dart';

extension IterableExtensions<E> on Iterable<E> {
  int count(bool test(E element)) => where(test).length;

  bool containLeast(List<E> lists) {
    for (final item in lists) {
      if (contains(item)) {
        return true;
      }
    }
    return false;
  }
}

extension ListExtensions<E> on List<E> {
  E? safeFirstWhere(bool Function(E element) compare) {
    for (final element in this) {
      if (compare(element)) {
        return element;
      }
    }
    return null;
  }

  List<E> copy() => List.from(this);

  List<E> clone() {
    final copy = toList();
    final List<Object?> untypedCopy = copy;
    for (var i = 0; i < untypedCopy.length; i++) {
      final element = untypedCopy[i];
      if (element is List) {
        untypedCopy[i] = element.clone();
      }
    }
    return copy;
  }

  List<E> replace(index, E Function(E element) func) {
    this[index] = func(this[index]);

    return this;
  }

  List<E> difference(List<E> list,
      bool Function(E element1, E element2) equalCondition,) {
    final newList = <E>[];
    forEach((e) {
      if (!list.any((element) => equalCondition(e, element))) {
        newList.add(e);
      }
    });

    return newList;
  }
}

extension ListColors on List<Color> {
  List<Color> getColorsBaseOn(int chartLength) {
    final currentLength = length;
    final colorLength = chartLength != 0
        ? (chartLength % currentLength == 0
            ? chartLength
            : chartLength % currentLength)
        : 0;
    return sublist(0, colorLength);
  }
}
