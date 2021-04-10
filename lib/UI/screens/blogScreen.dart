import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/BlogCard.dart';
import 'package:istemanipalapp/UI/widgets/SpinnerWidget.dart';
import 'package:istemanipalapp/logic/viewmodels/blogViewModel.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var viewModel = Provider.of<BlogViewModel>(context, listen: true);
    return ChangeNotifierProvider<BlogViewModel>(
      create: (context) => locator<BlogViewModel>(),
      child: Consumer<BlogViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            title: Text("Blog"),
          ),
          body: viewModel.isFetchingData
              ? SpinnerWidget()
              : ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: viewModel.blogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.white,
                      child: BlogsCard(
                        blog: viewModel.blogs[index],
                        launchUrl: viewModel.launchUrl,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
        ),
      ),
    );
  }
}
