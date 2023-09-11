import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:packtracer/bloc/demande_bloc/demande_bloc.dart';
import 'package:packtracer/data/repository/demande_repository.dart';

import '../../components/my_button.dart';
import '../../components/my_text_form_field.dart';

class Collect extends StatefulWidget {
  const Collect({Key? key}) : super(key: key);

  @override
  State<Collect> createState() => _CollectState();
}

class _CollectState extends State<Collect> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final adressController = TextEditingController();
  final telephoneController = TextEditingController();
  final detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DemandeRepository(),
      child: BlocProvider(
        create: (context) => DemandeBloc(
          demandeRepository: RepositoryProvider.of<DemandeRepository>(context),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Demande de collecte"),
          ),
          body: BlocListener<DemandeBloc, DemandeState>(
            listener: (context, state) {
              if (state is FormDemandeSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text("Demande envoyée avec success !"),
                  ),
                );
              }
              if (state is FormDemandeError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            },
            child: BlocBuilder<DemandeBloc, DemandeState>(
              builder: (context, state) {
                if (state is DemandeInitial) {
                  return SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    controller: nameController,
                                    hintText: "Nom Complet",
                                    validator: _nameValidator,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  MyTextFormField(
                                    controller: adressController,
                                    hintText: "Adresse de collecte",
                                    validator: _adresseValidator,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  MyTextFormField(
                                    controller: telephoneController,
                                    hintText: "Contact téléphonique",
                                    validator: _telephoneValidator,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  MyTextFormField(
                                    controller: detailController,
                                    hintText: "Détail du colis et instructions",
                                    maxLines: 6,
                                    validator: _detailsValidator,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  MyButton(
                                    text: "Enovyez la demande",
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<DemandeBloc>(context)
                                            .add(
                                          DemandeRequest(
                                            nameController.text,
                                            adressController.text,
                                            telephoneController.text,
                                            detailController.text,
                                          ),
                                        );
                                        // nameController.clear();
                                        // adressController.clear();
                                        // telephoneController.clear();
                                        // detailController.clear();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Row();
              },
            ),
          ),
        ),
      ),
    );
  }

  String? _nameValidator(String value) {
    if (value.isEmpty) {
      return "Veuillez saisir votre name";
    } else {
      return null;
    }
  }

  String? _adresseValidator(String value) {
    if (value.isEmpty) {
      return "Veuillez saisir votre name";
    } else {
      return null;
    }
  }

  String? _telephoneValidator(String value) {
    if (value.isEmpty) {
      return "Veuillez saisir votre name";
    } else {
      return null;
    }
  }

  String? _detailsValidator(String value) {
    if (value.isEmpty) {
      return "Veuillez saisir votre name";
    } else {
      return null;
    }
  }
}
