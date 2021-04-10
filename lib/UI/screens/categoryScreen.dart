import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/SpinnerWidget.dart';
import 'package:istemanipalapp/UI/widgets/categoryWidget.dart';
import 'package:istemanipalapp/logic/viewmodels/categoryViewModel.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class CategoryScreen extends StatelessWidget {
  Widget rederBody(CategoryViewModel viewModel) {
    if (viewModel.isFetchingData) {
      return (Center(
        child: SpinnerWidget(),
      ));
    } else {
      if (viewModel.categories.isEmpty) {
        return (Center(child: Text('Sorry. No events to show at the moment')));
      } else {
        return (ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: viewModel.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: CategoryWidget(
                  events: viewModel.categories[index].events,
                  name: viewModel.categories[index].name,
                  startDate: viewModel.categories[index].startDate,
                  poster: viewModel.categories[index].poster),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryViewModel>(
      create: (context) => locator<CategoryViewModel>(),
      child: Consumer<CategoryViewModel>(
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              title: Text("Events Currently Active"),
            ),
            body: this.rederBody(viewModel)),
      ),
    );
  }
}
