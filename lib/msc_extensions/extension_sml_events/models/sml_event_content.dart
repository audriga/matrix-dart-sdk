class SmlEventContent {
  static const String type = 'm.sml';

  static const String mTextJsonKey = 'org.matrix.msc1767.text';
  // todo 9999 is a placeholder, since this is not actually a msc yet.
  static const String mscType = 'org.matrix.msc9999.sml';
  final String mText;
  final dynamic markup;

  const SmlEventContent({
    required this.mText,
    required this.markup,
  });

  factory SmlEventContent.fromJson(Map<String, dynamic> json) =>
      SmlEventContent(
          mText: json[mTextJsonKey],
          markup: json[type] ?? json[mscType],
      );

  bool get isMarkupValid {
    if (markup is Map<String, dynamic>) {
      return true;
    } else if (markup case final List markupList) {
      return markupList.whereType<Map<String, dynamic>>().length == markupList.length;
    } else {
      return false;
    }
  }

  Map<String, dynamic> toJson() => {
    mTextJsonKey: mText,
    SmlEventContent.type: markup,
  };
}
