import 'package:flutter/material.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool notificationsEnabled = false;
  bool isSaving = false;
  DateTime? birthDate;

  String formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  // Open the date picker
  Future<void> selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: birthDate ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (!mounted) return;

    if (selectedDate != null) {
      setState(() {
        birthDate = selectedDate;
      });
    }
  }

  // Simulate saving preferences
  Future<void> savePreferences() async {
    setState(() {
      isSaving = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isSaving = false;
    });
  }

  // Display the confirmation dialog
  void showConfirmation() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text(
            'Voulez-vous sauvegarder vos préférences ?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                savePreferences();
              },
              child: const Text('Confirmer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Préférences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Username input
            const TextField(
              decoration: InputDecoration(
                labelText: "Nom d'utilisateur",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Notifications switch
            SwitchListTile(
              title: const Text('Notifications'),
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Date picker button
            ElevatedButton(
              onPressed: selectDate,
              child: const Text(
                'Choisir ma date de naissance',
              ),
            ),

            const SizedBox(height: 10),

            // Selected date
            Text(
              birthDate == null
                  ? 'Aucune date sélectionnée'
                  : 'Date sélectionnée : ${formatDate(birthDate!)}',
            ),

            const SizedBox(height: 30),

            // Save button
            ElevatedButton(
              onPressed: isSaving ? null : showConfirmation,
              child: const Text('Sauvegarder'),
            ),
          ],
        ),
      ),

      // Loading indicator at the bottom
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 60,
          child: Center(
            child: isSaving
                ? const CircularProgressIndicator()
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}