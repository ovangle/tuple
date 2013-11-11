part of tuple;


class Tuple3<T1,T2, T3> extends Tuple {
  final T1 item1;
  final T2 item2;
  final T3 item3;
  
  List get _items => [item1, item2, item3];
  
  const Tuple3(T1 this.item1, T2 this.item2, T3 this.item3);
 
  Tuple project([int ord1, int ord2, int ord3]) {
    var ords = new List<int>();
    if (ord1 != null) ords.add(ord1);
    if (ord2 != null) ords.add(ord2);
    if (ord3 != null) ords.add(ord3);
    return _project(ords);
  }
}
class ZippedIterable3<T1,T2,T3> extends _ZippedIterable {
  
  ZippedIterable3._(List<Iterable> iterables) : super(iterables);
  
  Iterator<Tuple3<T1,T2,T3>> get iterator => 
      new ZippedIterator3<T1,T2,T3>._(new List.from(_iterables.map((i) => i.iterator)));
}

class ZippedIterator3<T1,T2,T3> extends _ZippedIterator {
  ZippedIterator3._(List<Iterator> iterators) : super(iterators);
  
  Tuple3<T1,T2,T3> get current => new Tuple3<T1,T2,T3>(_iterators[0].current, _iterators[1].current, _iterators[2].current);
}