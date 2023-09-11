import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:packtracer/bloc/colis_bloc/colis_bloc.dart';
import 'package:packtracer/data/models/colis_model.dart';
import 'package:packtracer/screens/demande/collect.dart';
import 'package:packtracer/screens/single.dart';

import '../components/my_text_field.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ColisBloc colisBloc = ColisBloc();

  @override
  void initState() {
    colisBloc.add(LoadColisEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PackTracer'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Liste de mes colis'),
              leading: const Icon(Icons.list_alt),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Demande de collecte'),
              leading: const Icon(Icons.contact_support_outlined),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Collect(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => colisBloc,
        child: BlocBuilder<ColisBloc, ColisState>(
          builder: (context, state) {
            if (state is LaodingColisState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoadedColisState) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const MyTextField(
                        hintText: "Search",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.colis.length,
                          itemBuilder: (context, index) {
                            ColisModel colisCurrent = state.colis[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Single(
                                      idColis: colisCurrent.id,
                                      colisCurrent: colisCurrent,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: ListTile(
                                  title: Text(colisCurrent.trackingNumber),
                                  subtitle: Text(colisCurrent.location),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.timelapse_outlined,
                                          color: Colors.green),
                                      Text(colisCurrent.status),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is ErrorColisState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
