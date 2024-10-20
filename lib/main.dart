import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleQuizApp());
}

class SimpleQuizApp extends StatelessWidget {
  const SimpleQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz ',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Quelle est la capitale de la France ?',
      'answers': ['Paris', 'Londres', 'Berlin', 'Madrid'],
      'correct': 0,
    },
    {
      'question': 'Qui a écrit "Les Misérables" ?',
      'answers': ['Victor Hugo', 'Charles Dickens', 'Molière', 'Émile Zola'],
      'correct': 0,
    },
    {
      'question': 'Quelle est la plus grande planète du système solaire ?',
      'answers': ['Mars', 'Terre', 'Jupiter', 'Saturne'],
      'correct': 2,
    },
    {
      'question': 'Combien font 5 x 5 ?',
      'answers': ['20', '25', '30', '35'],
      'correct': 1,
    },
    {
      'question': 'Quel est l’élément chimique représenté par H2O ?',
      'answers': ['Oxygène', 'Hydrogène', 'Eau', 'Dioxyde de carbone'],
      'correct': 2,
    },
    {
      'question': 'Qui a peint la Joconde ?',
      'answers': ['Vincent van Gogh', 'Claude Monet', 'Léonard de Vinci', 'Pablo Picasso'],
      'correct': 2,
    },
    {
      'question': 'Quelle est la montagne la plus haute du monde ?',
      'answers': ['Mont Blanc', 'Mont Everest', 'K2', 'Kilimandjaro'],
      'correct': 1,
    },
    {
      'question': 'Quel est l’animal terrestre le plus rapide ?',
      'answers': ['Guépard', 'Lion', 'Léopard', 'Tigre'],
      'correct': 0,
    },
    {
      'question': 'Quelle est la langue la plus parlée au monde ?',
      'answers': ['Espagnol', 'Anglais', 'Chinois', 'Français'],
      'correct': 2,
    },
    {
      'question': 'Dans quel pays se trouve la Statue de la Liberté ?',
      'answers': ['France', 'États-Unis', 'Royaume-Uni', 'Brésil'],
      'correct': 1,
    },
    {
      'question': 'Qui a inventé l’ampoule électrique ?',
      'answers': ['Albert Einstein', 'Nikola Tesla', 'Thomas Edison', 'Isaac Newton'],
      'correct': 2,
    },
  ];

  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(int selectedAnswer) {
    if (selectedAnswer == _questions[_questionIndex]['correct']) {
      _score++;
    }

    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz '),
      ),
      body: _questionIndex < _questions.length
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            'Score: $_score',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Text(
            _questions[_questionIndex]['question'] as String,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          ...(_questions[_questionIndex]['answers'] as List<String>)
              .asMap()
              .entries
              .map((answer) {
            return ElevatedButton(
              onPressed: () => _answerQuestion(answer.key),
              child: Text(answer.value),
            );
          }).toList(),
        ],
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Votre score final est: $_score/${_questions.length}',
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetQuiz,
              child: const Text('Recommencer le Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
