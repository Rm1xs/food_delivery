class CardModel {
  CardModel(this.number, this.dateTime, this.holder, this.cvv);

  final String number;
  final String dateTime;
  final String holder;
  final String cvv;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'number': number,
        'date': dateTime,
        'holder': holder,
        'cvv': cvv
      };
}
