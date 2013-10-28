part of tuple;

class Tuple1<T1> extends Tuple {
  final T1 item1;
  
  List get _items => [item1];
  
  const Tuple1(T1 this.item1);
  
  Tuple1<dynamic> update1(dynamic f(T1 i)) => new Tuple1(f(item1));
}

class ZippedIterable1<T1> extends ZippedIterable {
  ZippedIterable1._(Iterable<T1> iter1) : super._(iter1);
  ZippedIterator get iterator => new ZippedIterator1._(_iterables[0]);
  
  ZippedIterable1<dynamic> mapProjection(dynamic f(Tuple1<T1> tuples)) => new ZippedIterable1._(map(f));
}

class ZippedIterator1<T1> extends ZippedIterator {
  ZippedIterator1._(Iterable<T1> iter1) : super._([iter1]);
  Tuple1<T1> get current => new Tuple1<T1>(_iterators[0].current);
}