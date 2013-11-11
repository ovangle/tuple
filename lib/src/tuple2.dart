part of tuple;

class Tuple2<T1,T2> extends Tuple {
  final T1 $1;
  final T2 $2;
  
  List get _items => [$1, $2];
  
  const Tuple2(T1 this.$1, T2 this.$2);
  
  Tuple project([int ord1, int ord2]) {
    var ords = new List<int>();
    if (ord1 != null) ords.add(ord1);
    if (ord2 != null) ords.add(ord2);
    return _project(ords);
  }
}

class ZippedIterable2<T1,T2> extends _ZippedIterable {
  
  ZippedIterable2._(List<Iterable> iterables) : super(iterables);
  
  Iterator<Tuple2<T1,T2>> get iterator =>
      new ZippedIterator2._(new List.from(_iterables.map((i) => i.iterator)));
}

class ZippedIterator2<T1,T2> extends _ZippedIterator {
  ZippedIterator2._(List<Iterator> iterators) : super(iterators);
  
  Tuple2<T1,T2> get current => new Tuple2(_iterators[0].current, _iterators[1].current);
}