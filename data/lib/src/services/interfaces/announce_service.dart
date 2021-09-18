import '../../../data.dart';

abstract class IAnnounceService {
  Future<AnnouncesResponse> getAllAnnounces({int page, int pageSize});
  Future<AnnouncesResponse> getAnnouncesDetail(int id);
}
