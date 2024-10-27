import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/notes_view.dart';
import '../widgets/tasks_view.dart';
import '../screens/note_editor_screen.dart';
import '../screens/task_editor_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    NotesView(),
    TasksView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.doc_text),
            selectedIcon: Icon(CupertinoIcons.doc_text_fill),
            label: 'Notes',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.checkmark_circle),
            selectedIcon: Icon(CupertinoIcons.checkmark_circle_fill),
            label: 'Tasks',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'home_fab',
        onPressed: () {
          if (_selectedIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NoteEditorScreen(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TaskEditorScreen(),
              ),
            );
          }
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
