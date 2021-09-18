
import '../../../data.dart';

class AnnouncesResponse {
  final int id;
  final String title;
  final String content;
  final DateTime dateCreate;
  final DateTime publishDate;
  final int buildingId;
  final int blockId;
  final bool inApp;
  final List<dynamic> apartmentIds;

  AnnouncesResponse({this.id, this.title, this.content, this.dateCreate, this.publishDate, this.buildingId, this.blockId, this.inApp, this.apartmentIds});

  factory AnnouncesResponse.fromJson(Map<String, dynamic> json) {
    return AnnouncesResponse(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      buildingId: json['buildingId'],
      apartmentIds: List<dynamic>.from(json['apartmentIds']).toList() ?? [],
    );
  }

  AnnounceModel toModel() {
    return AnnounceModel(
      id: id,
      title: title,
      content: content,
      dateCreate: dateCreate,
      publishDate: publishDate,
      buildingId: buildingId,
      blockId: blockId,
      inApp: inApp,
      apartmentIds: apartmentIds,
    );
  }
}
