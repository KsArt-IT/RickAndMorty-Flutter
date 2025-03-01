final class Info {
  final int count;
  final int pages;
  final String next;
  final String prev;

  Info({required this.count, required this.pages, required this.next, required this.prev});

  factory Info.fromJson(data) => Info(
    count: data['count'] ?? 0,
    pages: data['pages'] ?? 0, 
    next: data['next'] ?? '', 
    prev: data['prev'] ?? '',
  );
}
