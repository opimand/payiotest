abstract class NetworkPath {
  static const String _host = "https://rickandmortyapi.com/api";
  static String characters = "$_host/character";
  static String findItemById(int id) => "${NetworkPath.characters}/$id";
}
