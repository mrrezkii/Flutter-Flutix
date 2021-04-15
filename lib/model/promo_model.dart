part of 'models.dart';

class PromoModel extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  PromoModel({
    @required this.title,
    @required this.subtitle,
    @required this.discount,
  });

  @override
  List<Object> get props => throw [title, subtitle, discount];
}

List<PromoModel> dummyPromo = [
  PromoModel(
      title: "Student Holiday",
      subtitle: "Maximal only for two peole",
      discount: 50),
  PromoModel(
      title: "Family Club",
      subtitle: "Maximal only for three peole",
      discount: 70),
  PromoModel(
      title: "Subscription Promo", subtitle: "Min. one year", discount: 40)
];
