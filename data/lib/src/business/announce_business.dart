import '../../src/src.dart';
import '../responses/responses.dart';

import '../../data.dart';
import 'interfaces/announce_business.dart';

class AnnounceBusiness  implements IAnnounceBusiness {
  final IAnnounceService _service;

  AnnounceBusiness(this._service);
  @override
  Future<AnnouncesResponse> getAllAnnounces({int page, int pageSize}) {
    return _service.getAllAnnounces(page: page, pageSize: pageSize);
  }

  @override
  Future<AnnouncesResponse> getAnnouncesDetail(int id) {
    return _service.getAnnouncesDetail(id);
  }
}
