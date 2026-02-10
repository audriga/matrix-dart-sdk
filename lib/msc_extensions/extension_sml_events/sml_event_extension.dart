import 'package:matrix/matrix.dart';
import 'package:matrix/msc_extensions/extension_sml_events/models/sml_event_content.dart';

extension SmlEventExtension on Event {
  SmlEventContent get smlEventContent {
    assert([SmlEventContent.type, SmlEventContent.mscType].contains(type));
    return SmlEventContent.fromJson(content);
  }
}