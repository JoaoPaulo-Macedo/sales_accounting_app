class WeekCommonValuesEntity {
  WeekCommonValuesEntity({
    required this.totalCards,
    required this.tax,
    required this.allowance,
  });

  int? totalCards;
  double? tax;
  double? allowance;

  @override
  String toString() {
    return 'cards: $totalCards, tax: $tax, allowance: $allowance.';
  }
}
