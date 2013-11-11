library tuple;

import 'dart:collection';
import 'package:range/range.dart';

part 'src/tuple0.dart';
part 'src/tuple1.dart';
part 'src/tuple2.dart';
part 'src/tuple3.dart';
part 'src/tuple4.dart';
part 'src/tuple5.dart';
part 'src/zipped.dart';



Iterable<Tuple> zip([Iterable iter1, Iterable iter2, Iterable iter3, Iterable iter4, Iterable iter5]) {
  List<Iterable> iterables;
  if (iter1 == null) {
    return new ZippedIterable0._(iterables);
  }
  iterables.add(iter1);
  if (iter2 == null) {
    return new ZippedIterable1._(iterables);
  }
  iterables.add(iter2);
  if (iter3 == null) {
    return new ZippedIterable2._(iterables);
  }
  iterables.add(iter3);
  if (iter4 == null) {
    return new ZippedIterable3._(iterables);
  }
  iterables.add(iter4);
  if (iter5 == null) {
    return new ZippedIterable4._(iterables);
  }
  return new ZippedIterable5._(iterables);
}


abstract class Tuple {
  const Tuple();
  List get _items;
  int get _length => _items.length;
  
  Tuple _project(List<int> ords) {
    for (var ord in ords) {
      if (ord >= _items.length)
        throw new RangeError("Invalid ordinate $ord for ${this.runtimeType}");
    }
    final s = _items;
    switch(ords.length) {
      case 0: return new Tuple0();
      case 1: return new Tuple1(s[ords[0]]);
      case 2: return new Tuple2(s[ords[0]], s[ords[1]]);
      case 3: return new Tuple3(s[ords[0]], s[ords[1]], s[ords[2]]);
      case 4: return new Tuple4(s[ords[0]], s[ords[1]], s[ords[2]], s[ords[3]]);
      case 5: return new Tuple5(s[ords[0]], s[ords[1]], s[ords[2]], s[ords[3]], s[ords[4]]);
    }
  }
  
  bool operator ==(Object o) => o is Tuple
                             && o._length == _length
                             && range(_length).every((i) => _items[i] == o._items[i]);
  
  int get hashCode => _items.fold(7, (h, i) => h * 7 + i.hashCode);
}







