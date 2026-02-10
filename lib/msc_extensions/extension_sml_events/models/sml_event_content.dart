class SmlEventContent {
  static const String type = 'm.sml';

  // todo 9999 is a placeholder, since this is not actually a msc yet.
  static const String mscType = 'org.matrix.msc9999.sml';
  final dynamic markup;

  const SmlEventContent({
    required this.markup,
  });

  factory SmlEventContent.fromJson(Map<String, dynamic> json) =>
      SmlEventContent(markup: json[type] ?? json[mscType]);

  bool get isMarkupValid {
    if (markup is Map<String, dynamic>) {
      return true;
    } else if (markup case final List markupList) {
      return markupList.whereType<Map<String, dynamic>>().length == markupList.length;
    } else {
      return false;
    }
  }
}
