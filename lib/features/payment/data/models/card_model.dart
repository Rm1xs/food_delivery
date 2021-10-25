class CardModel {
  final String number;
  final String dateTime;
  final String holder;
  final String cvv;

  CardModel(this.number, this.dateTime, this.holder, this.cvv);

  Map<String, dynamic> toJson() =>
      {'number': number, 'date': dateTime, 'holder': holder, 'cvv': cvv};
}
