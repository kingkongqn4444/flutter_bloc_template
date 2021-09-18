import '../../../data.dart';
import '../../../src/src.dart';

abstract class IAnnounceBusiness {
  Future<AnnouncesResponse> getAllAnnounces({int page, int pageSize});
  Future<AnnouncesResponse> getAnnouncesDetail(int id);
}
