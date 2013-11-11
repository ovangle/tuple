part of tuple;

class Tuple4<T1,T2,T3,T4> extends Tuple {
  final T1 $1;
  final T2 $2;
  final T3 $3;
  final T4 $4;
  
  List get _items => [$1, $2, $3, $4];
  
  const Tuple4(T1 this.$1, T2 this.$2, T3 this.$3, T4 this.$4);
  
  Tuple project([int proj1, int proj2, int proj3, int proj4]) {
    var proj = new List<int>();
    if (proj1 != null) proj.add(proj1);
    if (proj2 != null) proj.add(proj2);
    if (proj3 != null) proj.add(proj3);
    if (proj4 != null) proj.add(proj4);
    return _project(proj);
  }
}

class ZippedIterable4<T1,T2,T3,T4> extends _ZippedIterable {
  ZippedIterable4._(List<Iterable> iterables) : super(iterables);
  
  Iterator get iterator =>
      new ZippedIterator4<T1,T2,T3,T4>._(new List.from(_iterables.map((i) => i.iterator)));
}

class ZippedIterator4<T1,T2,T3,T4> extends _ZippedIterator {
  ZippedIterator4._(List<Iterator> iterators) : super(iterators);
  
  Tuple4<T1, T2,T3,T4> get current => 
      new Tuple4(_iterators[0].current, _iterators[1].current, _iterators[2].current, _iterators[3].current);
}