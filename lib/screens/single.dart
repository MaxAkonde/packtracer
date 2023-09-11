import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:packtracer/bloc/history_bloc/history_bloc.dart';
import 'package:packtracer/data/models/colis_model.dart';
import 'package:packtracer/data/models/history_model.dart';

import '../components/my_time_card.dart';
import '../components/my_time_line_tile.dart';

class Single extends StatefulWidget {
  final int? idColis;
  final ColisModel colisCurrent;
  const Single({Key? key, this.idColis, required this.colisCurrent})
      : super(key: key);

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  HistoryBloc historyBloc = HistoryBloc();

  @override
  void initState() {
    historyBloc.add(LoadHistoryEvent(widget.idColis));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Tracking Number :'),
                          Text(widget.colisCurrent.trackingNumber),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Entrepot :'),
                          Text(widget.colisCurrent.location)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Status :'),
                          Text(widget.colisCurrent.status),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "History",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                BlocProvider(
                  create: (context) => historyBloc,
                  child: BlocBuilder<HistoryBloc, HistoryState>(
                    builder: (context, state) {
                      if (state is LaodingHistoryState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is LoadedHistoryState) {
                        return SingleChildScrollView(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.history.length,
                            itemBuilder: (context, index) {
                              HistoryModel historyCurrent =
                                  state.history[index];
                              return MyTimelineTile(
                                isFirst:
                                    state.history.first.id == historyCurrent.id
                                        ? true
                                        : false,
                                isLast:
                                    state.history.last.id == historyCurrent.id
                                        ? true
                                        : false,
                                endChild: MyTimeCard(
                                    date: "Le 20-09-2023 a 17h30min",
                                    status: historyCurrent.status),
                              );
                            },
                          ),
                        );
                      }

                      if (state is ErrorHistoryState) {
                        return Center(
                          child: Text(state.error.toString()),
                        );
                      }
                      return const Row();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
