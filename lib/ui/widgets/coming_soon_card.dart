part of 'widgets.dart';

class ComingSoonCard extends StatelessWidget {
  final MovieModel movie;
  final Function onTap;

  ComingSoonCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(imageBaseURL + "w500" + movie.backdropPath),
              fit: BoxFit.cover)),
    );
  }
}
