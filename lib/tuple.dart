library tuple;

import 'dart:collection';
import 'package:range/range.dart';

part 'src/tuple0.dart';
part 'src/tuple1.dart';
part 'src/tuple2.dart';
part 'src/tuple3.dart';
part 'src/zipped.dart';

/**
 * zips a list of iterables into an iterable of tuples.
 * 
 * If [:expand:] is `true`, if any of the iterables is an iterable of tuples,
 * the iterable will be expanded into it's projections.
 * 
 * eg.
 *     var iter1 = [new Tuple2(4,5), new Tuple2(4,5), new Tuple2(4,5)]
 *     var iter2 = [6, 6, 6]
 *     var iter3 = zip([iter1, iter2], expand: true).toList();
 *     // => iter3 = [<4,5,6>,<4,5,6>,<4,5,6>]
 */
ZippedIterable zip(List<Iterable> iterables, {bool expand: false}) {
  if (expand) {
    iterables = iterables.expand(_expandIterable).toList();
  }
  switch(iterables.length) {
    case 0: return new ZippedIterable0._();
    case 1: return new ZippedIterable1._(iterables[0]);
    case 2: return new ZippedIterable2._(iterables[0], iterables[1]);
    case 3: return new ZippedIterable3._(iterables[0], iterables[1], iterables[2]);
    default:
      throw "Tuples with length >= 3 not implemented";
  }
}

List<dynamic> _expandTuple(Tuple t) {
  if (t is Tuple0) return [];
  if (t is Tuple1) return [(t as Tuple1).item1];
  if (t is Tuple2) return [(t as Tuple2).item2, (t as Tuple2).item2];
  if (t is Tuple3) return [(t as Tuple3).item1, (t as Tuple2).item2, (t as Tuple3).item3];
}

List<Iterable> _expandIterable(Iterable iter) {
  if (iter is Iterable<Tuple0>) return [];
  if (iter is Iterable<Tuple1>) return [iter.map((i) => i.item1)];
  if (iter is Iterable<Tuple2>) return [iter.map((i) => i.item1), iter.map((i) => i.item2)];
  if (iter is Iterable<Tuple3>) return [iter.map((i) => i.item1), iter.map((i) => i.item2), iter.map((i) => i.item3)];
}

abstract class Tuple {
  const Tuple();
  
  List get _items;
  dynamic _project(int i) => _items[i];
  
  factory Tuple.fromItems(List<dynamic> items, {expand: false}) {
    if (expand) {
      items = items.expand(_expandTuple).toList();
    }
    switch (items.length) {
      case 0: return new Tuple0();
      case 1: return new Tuple1(items[0]);
      case 2: return new Tuple2(items[0], items[1]);
      case 3: return new Tuple3(items[0], items[1], items[2]);
      default:
        throw "Tuples with length >= 3 not implemented";
    }
  }
  
  bool operator ==(Object o) {
    if (o is Tuple) {
      var tup = (o as Tuple);
      if (_items.length != tup._items.length) return false;
      return range(_items.length)
          .every((i) => _items[i] == tup._items[i]);
    }
    return false;
  }
  
  int get hashCode {
    int result = 57;
    for (var i in _items) {
      result = result * 57 + i.hashCode;
    }
    return result;
  }
  
  String toString() => "<${_items.join(", ")}>";
}






