class AnnounceModel {
  int id;
  String title;
  String content;
  DateTime dateCreate;
  DateTime publishDate;
  int buildingId;
  int blockId;
  bool inApp;
  List<dynamic> apartmentIds;

  AnnounceModel({
    this.id,
    this.title,
    this.content,
    this.dateCreate,
    this.publishDate,
    this.buildingId,
    this.blockId,
    this.inApp,
    this.apartmentIds,
  });
}
