part of tuple;

class Tuple0 extends Tuple {
  const Tuple0();
  
  List get _items => [];
}

class ZippedIterable0 extends _ZippedIterable {
  ZippedIterable0._(Iterable iterator) : super(iterator);
  
  _ZippedIterator get iterator => new ZippedIterator0._();
}

class ZippedIterator0 extends _ZippedIterator {
  ZippedIterator0._() : super([]);
  
  Tuple0 get current => new Tuple0();
  
  bool moveNext() => false;
}