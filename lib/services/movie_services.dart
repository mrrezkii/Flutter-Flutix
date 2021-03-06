part of 'services.dart';

class MovieServices {
  static Future<List<MovieModel>> getMovies(int page,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&$page";

    client ??= http.Client();

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => MovieModel.fromJson(e)).toList();
  }

  static Future<MovieDetail> getDetails(MovieModel movie,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movie.id}?api_key=$apiKey&language=en-US";

    client ??= http.Client();

    var response = await client.get(Uri.parse(url));
    var data = json.decode(response.body);

    List genres = (data as Map<String, dynamic>)['genres'];
    String language;

    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = "Japanese";
        break;
      case 'id':
        language = "Indonesia";
        break;
      case 'ko':
        language = "Korean";
        break;
      case 'en':
        language = "English";
        break;
    }

    return MovieDetail(movie,
        genres: genres
            .map((e) => (e as Map<String, dynamic>)['name'].toString())
            .toList(),
        language: language);
  }

  static Future<List<Credit>> getCredits(int movieID,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieID}/credits?api_key=$apiKey&language=en-US";

    client ??= http.Client();

    var response = await client.get(Uri.parse(url));
    var data = json.decode(response.body);

    return ((data as Map<String, dynamic>)['cast'] as List)
        .map((e) => Credit(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        .take(8)
        .toList();
  }
}
