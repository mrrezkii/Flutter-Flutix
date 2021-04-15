part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final PromoModel promo;

  PromoCard(this.promo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 80,
          decoration: BoxDecoration(
              color: mainColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    promo.title,
                    style: whiteTextFont,
                  ),
                  Text(
                    promo.subtitle,
                    style: whiteTextFont.copyWith(
                        fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "OFF ",
                    style: yellowNumberFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${promo.discount}%",
                    style: yellowNumberFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
