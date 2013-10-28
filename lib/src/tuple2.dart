part of tuple;

class Tuple2<T1,T2> extends Tuple {
  final T1 item1;
  final T2 item2;
  
  List get _items => [item1, item2];
  
  const Tuple2(T1 this.item1, T2 this.item2);
  
  Tuple2<dynamic, T2> update1(dynamic f(T1 i)) => new Tuple2(f(item1), item2);
  Tuple2<T1, dynamic> update2(dynamic f(T2 i)) => new Tuple2(item1, f(item2));
}

class ZippedIterable2<T1,T2> extends ZippedIterable {
  
  ZippedIterable2._(Iterable<T1> iterator1, Iterable<T2> iterator2)
      : super._([iterator1, iterator2]);
  
  ZippedIterator get iterator => new ZippedIterator2<T1,T2>._(_iterables[0].iterator, _iterables[1].iterator);
  
  Iterable<T1> get proj1 => map((e) => e._project(1));
  Iterable<T2> get proj2 => map((e) => e._project(2));
  
  ZippedIterable2<dynamic, dynamic> mapProjection(Tuple f(Tuple2<T1,T2> item)) {
    return new ZippedIterable.fromZip(map(f));
  }
  ZippedIterable2<dynamic, T2> mapProjection1(dynamic f(T1 item)) {
    return zip([proj1.map(f), proj2]);
  }
  ZippedIterable2<T1, dynamic> mapProjection2(dynamic f(T2 item)) {
    return zip([proj1, proj2.map(f)]);
  }
}

class ZippedIterator2<T1,T2> extends ZippedIterator {
  ZippedIterator2._(Iterator<T1> iterator1, Iterator<T2> iterator2) 
    : super._([iterator1, iterator2]);
  
  Tuple2<T1,T2> get current => new Tuple2(_iterators[0].current, _iterators[1].current);
}