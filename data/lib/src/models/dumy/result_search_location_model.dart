import '../../../data.dart';

class ResultSearchLocationModel {
  final String title;
  final String subTitle;
  final ResultSearchLocation type;

  ResultSearchLocationModel(
      {this.title, this.subTitle, this.type = ResultSearchLocation.location});
}
