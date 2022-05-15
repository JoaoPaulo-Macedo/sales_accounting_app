import 'package:reckoning/app/domain/entities/week_common_values_entity.dart';

extension WeekCommonValuesDTO on WeekCommonValuesEntity {
  static WeekCommonValuesEntity fromJson(Map json) {
    return WeekCommonValuesEntity(
      totalCards: json['total_cards'],
      tax: json['tax'],
      allowance: json['allowance'],
    );
  }

  Map toJson() {
    final json = {};

    json['total_cards'] = totalCards;
    json['tax'] = tax;
    json['allowance'] = allowance;

    return json;
  }
}
