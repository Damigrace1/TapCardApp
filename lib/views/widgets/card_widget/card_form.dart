import 'package:flutter/material.dart';
import '../../../controllers/cards_controller.dart';
// import '../controllers/cards_controller.dart';

class CardForm extends StatefulWidget {
  final BusinessCard? card;
  final Function(BusinessCard) onSave;

  const CardForm({super.key, this.card, required this.onSave});

  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _titleController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _websiteController;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.card?.name ?? '');
    _titleController = TextEditingController(text: widget.card?.title ?? '');
    _emailController = TextEditingController(text: widget.card?.email ?? '');
    _phoneController = TextEditingController(text: widget.card?.phone ?? '');
    _websiteController =
        TextEditingController(text: widget.card?.website ?? '');
    _selectedColor = widget.card?.color ?? Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a name' : null,
            ),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a title' : null,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => value!.isEmpty || !value.contains('@')
                  ? 'Please enter a valid email'
                  : null,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a phone number' : null,
            ),
            TextFormField(
              controller: _websiteController,
              decoration: const InputDecoration(labelText: 'Website'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a website' : null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave(BusinessCard(
                    name: _nameController.text,
                    title: _titleController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    website: _websiteController.text,
                    color: _selectedColor,
                  ));
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _titleController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    super.dispose();
  }
}
