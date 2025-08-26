import 'dart:io';

void main() {
  print('Enter the name of the feature (e.g., payments):');
  String featureName = stdin.readLineSync() ?? '';

  if (featureName.isEmpty) {
    print('Feature name cannot be empty!');
    return;
  }

  // Define the child folder structure
  List<String> subfolders = [
    'models',
    'notifiers',
    'pages',
    'widgets',
    'repositories',
  ];

  // Create the parent folder
  String featurePath = 'lib/features/$featureName';
  Directory(featurePath).createSync(recursive: true);
  print('Created parent folder: $featurePath');

  // Create the subfolders inside the parent folder
  for (var subfolder in subfolders) {
    Directory('$featurePath/$subfolder').createSync();
    print('Created subfolder: $featurePath/$subfolder');
  }
}
