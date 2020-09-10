import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
// import 'package:provider_architecture/viewmodel_provider.dart';
// import 'package:stacked/stacked.dart';
import 'package:aea_payload/datamodels/episode_item_model.dart';
import 'package:aea_payload/viewmodels/episode_list_view_model.dart';

import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final List<EpisodeItemModel> episodes;
  EpisodesList({this.episodes});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EpisodeListViewModel>.withConsumer(
      viewModelBuilder: () => EpisodeListViewModel(),
      // viewModel: EpisodeListViewModel(),
      builder: (context, model, child) => Wrap(
        spacing: 30,
        runSpacing: 30,
        children: <Widget>[
          ...episodes.map((episode) => EpisodeItem(model: episode)).toList()
        ],
      ),
    );
  }
}
