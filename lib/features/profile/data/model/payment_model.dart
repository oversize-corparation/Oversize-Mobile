class CardModel {
  final String? cardHolder;
  final String cardNumber;
  final String validDate;
  final String? cvv;
  final String cardType;

  CardModel({
    this.cardHolder,
    required this.cardNumber,
    required this.validDate,
    this.cvv,
    required this.cardType,
  });
}
