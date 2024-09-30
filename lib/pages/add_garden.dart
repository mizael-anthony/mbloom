import 'package:flutter/material.dart';

class AddGarden extends StatefulWidget {
  const AddGarden({super.key});

  @override
  State<AddGarden> createState() => _AddGardenState();
}

class _AddGardenState extends State<AddGarden> {
  final _formKey = GlobalKey<FormState>();
  final gardenNameController = TextEditingController();
  final gardenDescriptionController = TextEditingController();
  String selectedGardenType = 'fruit';

  @override
  void dispose() {
    super.dispose();
    gardenDescriptionController.dispose();
    gardenNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nom du jardin',
                      hintText: "Entrer le nom de votre jardin",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tu dois remplir ce champs';
                    }
                    return null;
                  },
                  controller: gardenNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: "Décrivez votre jardin",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tu dois remplir ce champs';
                    }
                    return null;
                  },
                  controller: gardenDescriptionController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(value: 'fruit', child: Text('Fruit')),
                      DropdownMenuItem(value: 'legume', child: Text('Legume')),
                      DropdownMenuItem(value: 'fleur', child: Text('Fleur')),
                    ],
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    value: selectedGardenType,
                    onChanged: (value) {
                      setState(() {
                        selectedGardenType = value!;
                      });
                    }),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final gardenName = gardenNameController.text;
                        final gardenDescription =
                            gardenDescriptionController.text;

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Enregistrement en cours..')));
                        print('$gardenName & $gardenDescription');
                        print('Type de jardin $selectedGardenType');
                      }
                    },
                    child: const Text('Enregistrer')),
              )
            ],
          )),
    );
  }
}
