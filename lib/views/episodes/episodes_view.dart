import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
// import 'package:provider_architecture/viewmodel_provider.dart';
// import 'package:stacked/stacked.dart';
import 'package:aea_payload/datamodels/season_details_model.dart';
import 'package:aea_payload/viewmodels/episodes_view_model.dart';
import 'package:aea_payload/widgets/episodes_list/episodes_list.dart';
import 'package:aea_payload/widgets/season_details/season_details.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EpisodesViewModel>.withConsumer(
      viewModelBuilder: () => EpisodesViewModel(),
      // viewModel: EpisodesViewModel(),
      onModelReady: (model) => model.getEpisodes(),
      builder: (context, model, child) => SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          SeasonDetails(
            details: SeasonDetailsModel(
              title: 'SEASON 1',
              description:
                  'This season covers the absolute basics of Flutter Web Dev to get us up and running with a basic web app.',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          model.episodes == null
              ? CircularProgressIndicator()
              : EpisodesList(episodes: model.episodes),
        ],
      )),
    );
  }
}
