class ApiEndpoints {
  static const apiKey = 'c24275182775d1333225f5c0cd82ac21';
  static const host = 'api.themoviedb.org';
  static const baseUrl = 'https://$host/3';

  static const createToken = '/authentication/token/new';
  static const createSession = '/authentication/token/validate_with_login';

  static String movieDetails(int id) => '/movie/$id';
}
