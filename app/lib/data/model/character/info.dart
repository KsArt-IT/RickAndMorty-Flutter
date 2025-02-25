final class Info {
  final int count;
  final int pages;
  final String next;
  final String prev;

  Info({required this.count, required this.pages, required this.next, required this.prev});

  static Info fromJson(data) {
    return Info(
      count: data['count'],
      pages: data['pages'],
      next: data['next'],
      prev: data['prev'],
    );
  }
}
