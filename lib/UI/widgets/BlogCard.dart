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
    final x = MediaQuery
        .of(context)
        .size
        .height * 0.234;
    double bit = MediaQuery
        .of(context)
        .size
        .width * 0.2;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.13,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.91,
              decoration: BoxDecoration(
                color: Color.fromRGBO(47, 46, 65, 0.75),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: bit * 10,
                    height: x * 0.05,
                    child: TextButton(
                      onPressed: null,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(bit * 3.5, 0, 0, 0),
                        child: IconButton(
                          icon: Icon(Icons.more_horiz),
                          color: Colors.white,
                          onPressed: null,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(bit, x * 0.17, 0, 0),
                    child: Text(
                      blog.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: x * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(bit * 1.09, 0, 0, 0),
                    child: Text(
                      blog.author,
                      style: TextStyle(
                        fontSize: x * 0.05,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(bit * 0.27, x * 0.03, 0, 0),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.155,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.31,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(blog.imageUrl,
                  fit: BoxFit.fill,),
            ),
          ),
          ),
        ],
      ),
    );
  }


}