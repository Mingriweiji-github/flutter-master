import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';

class ProductListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateModel> (
        create: (context) => AppStateModel(),
        child: Consumer<AppStateModel> (
          builder: (context, model, child) {
            return CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: Text("Cupertino Store"),
                ),
              ],
            );
          },
        ),
    );
  }
}
