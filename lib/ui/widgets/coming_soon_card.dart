part of 'widgets.dart';

class ComingSoonCard extends StatelessWidget {
  final MovieModel movie;
  final Function onTap;

  ComingSoonCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text(movie.title);
  }
}
