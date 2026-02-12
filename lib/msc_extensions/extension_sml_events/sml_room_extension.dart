import 'package:matrix/matrix.dart';
import 'package:matrix/msc_extensions/extension_sml_events/models/sml_event_content.dart';

extension SmlRoomExtension on Room {
  Future<String?> sendSml({
    required dynamic markup,
    String fallback = 'SML data',
    String? txid,
  }) async {
    if (markup == null) {
      throw Exception('Provided schema must not be null');
    }
    if (markup case final List schemaList) {
      if (schemaList.whereType<Map<String, dynamic>>().length != schemaList.length) {
        throw Exception('Provided schema is a list, but not a json list');
      }
    } else if (markup is! Map<String, dynamic>) {
      throw Exception('Provided schema is not json');
    }
    
    final newSmlEvent = SmlEventContent(
      mText: fallback,
        markup: markup,
    );
    
    return sendEvent(
      newSmlEvent.toJson(),
      type: SmlEventContent.type,
      txid: txid,
    );
}
}