//кдасс Sight используется в sight_card.dart

class Sight {
  String name;
  List geoPosition;
  String url;
  String details;
  String type;
  String image;
  bool favorite;
  bool wantVisited;
  bool haveVisited;

  Sight(
    this.name,
    this.geoPosition,
    this.url,
    this.details,
    this.type,
    this.image,
    this.favorite,
    this.wantVisited,
    this.haveVisited,
  );
}
