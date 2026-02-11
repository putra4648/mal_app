import 'dart:convert';

import '../../../constant/constant.dart';
import '../../models/models.dart';
import '../repository.dart';

class SeasonRepository extends BaseService {
  Future<List<Manga>> getMangaSeason() async {
    final res = await response(
      RequestType.GET,
      Url.url.season,
    );


    final resultMap = jsonDecode(res.body) as Map;
    final result = resultMap['data'] as List;

    return result.take(50).map((e) => Manga.fromJson(e)).toList();
  }
}
