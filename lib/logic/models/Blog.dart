class Blog {
  String title;
  String description;
  int views;
  String author;
  int timeToRead;
  String category;
  String postUrl;
  String imageUrl;
  Blog(this.title, this.description, this.views, this.author, this.category,
      this.imageUrl, this.postUrl, this.timeToRead);

  Blog.fromJson(Map<dynamic, dynamic> json)
      : title = json['title'],
        description = json['shortDescription'],
        views = json['views'],
        author = json['author'],
        timeToRead = json['timeToRead'],
        category = json['category'],
        postUrl =
            "https://blog.istemanipal.com/articles/single//${json['_id']}/",
        imageUrl = "https://blog.istemanipal.com/mobile/" + json['imageurl'];
}
