import 'dart:math';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  final String category;
  const PlayScreen({Key? key, this.category = 'truth'}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late List<String> _prompts;
  String _currentPrompt = '';
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _loadPrompts();
    _nextPrompt();
  }

  void _loadPrompts() {
    const truths = [
      'What is your biggest fear?',
      'What is a secret you have never told anyone?',
      'Who was your first crush?',
      'What is the most embarrassing thing you have done?',
      'Have you ever lied to your best friend?'
    ];
    const dares = [
      'Do 20 push-ups.',
      'Sing a song out loud.',
      'Dance without music for 1 minute.',
      'Talk in a silly voice for the next round.',
      'Do your best animal impression.'
    ];
    _prompts = widget.category == 'dare' ? dares : truths;
  }

  void _nextPrompt() {
    setState(() {
      _currentPrompt = _prompts[_random.nextInt(_prompts.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.category == 'dare' ? 'Dare' : 'Truth';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  _currentPrompt,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _nextPrompt,
              child: const Text('New'),
            ),
          ],
        ),
      ),
    );
  }
}
