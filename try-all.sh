#!/bin/sh

methods="Collections()
min(Collection<? extends T>, Comparator<? super T>)
emptyListIterator()
indexedBinarySearch(List<? extends T>, T, Comparator<? super T>)
singletonList(T)
checkedNavigableMap(NavigableMap<K, V>, Class<K>, Class<V>)
hasMoreElements()
max(Collection<? extends T>, Comparator<? super T>)
rotate2(List<?>, int)
emptyIterator()
frequency(Collection<? extends Object>, Object)
swap(List<? extends Object>, int, int)
checkedQueue(Queue<E>, Class<E>)
swap(Object[], int, int)
binarySearch(List<? extends T>, T, Comparator<? super T>)
unmodifiableSortedSet(SortedSet<T>)
unmodifiableMap(Map<? extends K, ? extends V>)
addAll(Collection<? super T>, T...)
rotate1(List<T>, int)
nCopies(int, T)
emptyEnumeration()
unmodifiableNavigableSet(NavigableSet<T>)
unmodifiableNavigableMap(NavigableMap<K, ? extends V>)
checkedSortedSet(SortedSet<E>, Class<E>)
nextElement()
reverse(List<? extends Object>)
checkedList(List<E>, Class<E>)
emptyList()
sort(List<T>, Comparator<? super T>)
zeroLengthArray(Class<T>)
emptyNavigableMap()
singleton(T)
checkedCollection(Collection<E>, Class<E>)
synchronizedNavigableSet(NavigableSet<T>)
checkedMap(Map<K, V>, Class<K>, Class<V>)
reverseOrder()
tryAdvance(Consumer<? super T>)
copy(List<? super T>, List<? extends T>)
synchronizedSortedSet(SortedSet<T>)
synchronizedSortedMap(SortedMap<K, V>)
unmodifiableSortedMap(SortedMap<K, ? extends V>)
synchronizedMap(Map<K, V>)
binarySearch(List<? extends Comparable<? super T>>, T)
synchronizedCollection(Collection<T>, Object)
rotate(List<? extends Object>, int)
fill(List<? super T>, T)
forEachRemaining(Consumer<? super E>)
synchronizedSet(Set<T>)
emptyNavigableSet()
synchronizedList(List<T>, Object)
hasNext()
checkedSortedMap(SortedMap<K, V>, Class<K>, Class<V>)
emptyMap()
synchronizedList(List<T>)
unmodifiableList(List<? extends T>)
reverseOrder(Comparator<T>)
next()
indexOfSubList(List<? extends Object>, List<? extends Object>)
emptySortedMap()
unmodifiableCollection(Collection<? extends T>)
asLifoQueue(Deque<T>)
unmodifiableSet(Set<? extends T>)
disjoint(Collection<? extends Object>, Collection<? extends Object>)
enumeration(Collection<T>)
trySplit()
synchronizedSet(Set<T>, Object)
lastIndexOfSubList(List<? extends Object>, List<? extends Object>)
max(Collection<? extends T>)
indexedBinarySearch(List<? extends Comparable<? super T>>, T)
checkedNavigableSet(NavigableSet<E>, Class<E>)
newSetFromMap(Map<E, Boolean>)
list(Enumeration<T>)
emptySortedSet()
replaceAll(List<T>, T, T)
checkedSet(Set<E>, Class<E>)
synchronizedCollection(Collection<T>)
forEachRemaining(Consumer<? super T>)
shuffle(List<? extends Object>, Random)
sort(List<T>)
singletonMap(K, V)
emptySet()
singletonIterator(E)
synchronizedNavigableMap(NavigableMap<K, V>)
eq(Object, Object)
singletonSpliterator(T)
get(ListIterator<? extends T>, int)
characteristics()
iteratorBinarySearch(List<? extends T>, T, Comparator<? super T>)
shuffle(List<? extends Object>)
min(Collection<? extends T>)
estimateSize()
remove()
"

OLD_IFS=${IFS}
IFS=$'\n'
for m in ${methods}; do
    echo "trying ${m}"
    rm -rf ISSUES/cf-691
    gsed -i "s/\"method\":.*$/\"method\": \"${m}\",/g" resources/test_data.json
    python3 main.py &> ${m}.out
    if [ -f ISSUES/cf-691/cf-691_error.txt ]; then
       cat ISSUES/cf-691/cf-691_error.txt >> ${m}.out
    fi
done

IFS=${OLD_IFS}