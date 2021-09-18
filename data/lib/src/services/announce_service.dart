import '../../data.dart';
import '../responses/responses.dart';

class AnnounceService extends IAnnounceService {
  @override
  Future<AnnouncesResponse> getAllAnnounces({int page, int pageSize}) async {
//    return AnnouncesResponse.fromJson(response);
  }

  @override
  Future<AnnouncesResponse> getAnnouncesDetail(int id) async {
//    final response = await _rest.request(
//      'api/announces/$id',
//      Method.GET,
//    );
//    if (response == null) return null;
//    return ResultResponse<AnnouncesResponse>.fromJson(response);
  }
}
