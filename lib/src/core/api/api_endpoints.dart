class ApiEndpoints {
  static const String apiKey = 'c24275182775d1333225f5c0cd82ac21';
  static const String host = 'api.themoviedb.org';
  static const String baseUrl = 'https://$host';
  static const String imageHost = 'https://image.tmdb.org/t/p/original';
  static const String version = '/3';

  static const String createToken = '$version/authentication/token/new';
  static const String createSession = '$version/authentication/token/validate_with_login';

  static const String getUserDetails = '$version/account';

  static const String popularMovies = '$version/movie/popular';

  static String movieDetails(int id) => '$version/movie/$id';
}
