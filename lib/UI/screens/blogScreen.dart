import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/BlogCard.dart';
import 'package:istemanipalapp/logic/viewmodels/blogViewModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<BlogViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog"),
      ),
      body: model.isFetchingData
          ? CircularProgressIndicator()
          : ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: model.blogs.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  child: BlogsCard(
                    blog: model.blogs[index],
                    launchUrl: model.launchUrl,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
    );
  }
}
