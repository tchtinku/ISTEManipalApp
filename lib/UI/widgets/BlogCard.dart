import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:istemanipalapp/logic/models/Blog.dart';

class BlogsCard extends StatelessWidget {
  final Blog blog;
  final Function launchUrl;

  const BlogsCard({
    Key key,
    @required this.blog,
    @required this.launchUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.blue,
        onTap: () {
          launchUrl(blog.postUrl);
        },
        child: Container(
          color: Theme.of(context).cardColor,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                child: CachedNetworkImage(
                  width: 100.0,
                  height: 100.0,
                  imageUrl: blog.imageUrl,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator(value: progress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.0,
                    child: Text(
                      blog.title,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    blog.author,
                  ),
                  Text(
                    blog.timeToRead.toString() + "min Read",
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
