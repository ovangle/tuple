part of tuple;


class Tuple5<T1,T2,T3,T4,T5> extends Tuple {
  final T1 $1;
  final T2 $2;
  final T3 $3;
  final T4 $4;
  final T5 $5;
  
  List get _items => [$1, $2, $3, $4, $5];
  
  const Tuple5(T1 this.$1, T2 this.$2, T3 this.$3, T4 this.$4, T5 this.$5);
  
  Tuple project([int proj1, int proj2, int proj3, int proj4, int proj5]) {
    var proj = new List<int>();
    if (proj1 != null) proj.add(proj1);
    if (proj2 != null) proj.add(proj2);
    if (proj3 != null) proj.add(proj3);
    if (proj4 != null) proj.add(proj4);
    if (proj5 != null) proj.add(proj5);
    return _project(proj);
  }
}

class ZippedIterable5<T1,T2,T3,T4,T5> extends _ZippedIterable {
  ZippedIterable5._(List<Iterable> iterables) : super(iterables);
  
  Iterator get iterator =>
      new ZippedIterator5<T1,T2,T3,T4,T5>._(new List.from(_iterables.map((i) => i.iterator)));
}

class ZippedIterator5<T1,T2,T3,T4,T5> extends _ZippedIterator {
  ZippedIterator5._(List<Iterator> iterators) : super(iterators);
  
  Tuple5<T1, T2,T3,T4,T5> get current => 
      new Tuple5(_iterators[0].current,
                 _iterators[1].current, 
                 _iterators[2].current, 
                 _iterators[3].current,
                 _iterators[4].current);
}