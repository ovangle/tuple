part of tuple;


class Tuple3<T1,T2, T3> extends Tuple {
  final T1 item1;
  final T2 item2;
  final T3 item3;
  
  List get _items => [item1, item2, item3];
  
  const Tuple3(T1 this.item1, T2 this.item2, T3 this.item3);
  
  Tuple3<dynamic,T2,T3> update1(dynamic f(T1 i)) => new Tuple3(f(item1), item2, item3);
  Tuple3<T1,dynamic,T3> update2(dynamic f(T2 i)) => new Tuple3(item1, f(item2), item3);
  Tuple3<T1,T2,dynamic> update3(dynamic f(T3 i)) => new Tuple3(item1, item2, f(item3));
}

class ZippedIterable3<T1,T2,T3> extends ZippedIterable {
  
  ZippedIterable3._(Iterable<T1> iter1, Iterable<T2> iter2, Iterable<T3> iter3)
      : super._([iter1, iter2, iter3]);
  
  ZippedIterator get iterator => new ZippedIterator3<T1,T2,T3>._(_iterables[0].iterator, _iterables[1].iterator, _iterables[2].iterator);
  
  Iterable<T1> get proj1 => map((e) => e._project(1));
  Iterable<T2> get proj2 => map((e) => e._project(2));
  Iterable<T3> get proj3 => map((e) => e._project(3));
  
  ZippedIterable mapProjection(Tuple f(Tuple3<T1,T2,T3> item)) {
    return new ZippedIterable.fromZip(map(f));
  }
  ZippedIterable3<dynamic, T2, T3> mapProjection1(dynamic f(T1 item)) {
    return zip([proj1.map(f), proj2, proj3]);
  }
  ZippedIterable3<T1, dynamic, T3> mapProjection2(dynamic f(T2 item)) {
    return zip([proj1, proj2.map(f), proj3]);
  }
  ZippedIterable3<T1, T2, dynamic> mapProjection3(dynamic f(T3 item)) {
    return zip([proj1, proj2, proj3.map(f)]);
  }
}

class ZippedIterator3<T1,T2,T3> extends ZippedIterator {
  ZippedIterator3._(Iterator<T1> iterator1, Iterator<T2> iterator2, Iterator<T3> iterator3) 
    : super._([iterator1, iterator2, iterator3]);
  
  Tuple3<T1,T2,T3> get current => new Tuple3<T1,T2,T3>(_iterators[0].current, _iterators[1].current, _iterators[2].current);
}