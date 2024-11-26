import 'package:flutter/material.dart';
import 'package:objetos_perdidos/services/comments_create.dart';

class CreateCommentScreen extends StatefulWidget {
  final String postId; // ID del post al que se le agregará el comentario

  const CreateCommentScreen({super.key, required this.postId});

  @override
  _CreateCommentScreenState createState() => _CreateCommentScreenState();
}

class _CreateCommentScreenState extends State<CreateCommentScreen> {
  final _formKey = GlobalKey<FormState>();
  String _content = '';
  bool _isLoading = false;

  void _submitComment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    _formKey.currentState!.save();

    final result = await createComment(widget.postId, _content);

    setState(() {
      _isLoading = false;
    });

    if (result['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'])),
      );
      Navigator.pop(context); // Volver a la pantalla anterior
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Comentario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contenido del comentario',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El contenido no puede estar vacío';
                  }
                  return null;
                },
                onSaved: (value) {
                  _content = value!;
                },
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitComment,
                      child: const Text('Publicar Comentario'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
