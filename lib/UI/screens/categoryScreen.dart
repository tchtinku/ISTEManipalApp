import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/categoryWidget.dart';
import 'package:istemanipalapp/logic/models/Date.dart';
import 'package:istemanipalapp/logic/viewmodels/categoryViewModel.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var viewModel = Provider.of<BlogViewModel>(context, listen: true);
    return ChangeNotifierProvider<CategoryViewModel>(
      create: (context) => locator<CategoryViewModel>(),
      child: Consumer<CategoryViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            title: Text("Events Currently Active"),
          ),
          body: viewModel.isFetchingData
              ? CircularProgressIndicator()
              : ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: viewModel.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.white,
                      child: CategoryWidget(
                          events: viewModel.categories[index]['events'],
                          name: viewModel.categories[index]['name'],
                          startDate:
                              Date(viewModel.categories[index]['start_date']),
                          poster: viewModel.categories[index]['poster']),
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
