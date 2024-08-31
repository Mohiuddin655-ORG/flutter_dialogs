import 'package:flutter/material.dart';
import 'package:flutter_androssy_dialogs/dialogs.dart';

void main() {
  Dialogs.init(
    alertDialogConfig: AlertDialogConfig(
      builder: (context, content) {
        return Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: Text(content.title ?? "Alert dialog"),
        );
      },
    ),
    messageDialogConfig: MessageDialogConfig(
      builder: (context, content) => DemoMessage(content: content),
    ),
    dialogs: {
      "custom": DialogConfig(
        duration: const Duration(seconds: 3),
        reverseDuration: const Duration(seconds: 3),
        builder: (context, content) {
          return Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          );
        },
      )
    },
    snackBarConfig: SnackBarConfig(
      builder: (context, content) => DemoSnackBar(content: content),
    ),
    errorSnackBarConfig: SnackBarConfig(
      builder: (context, content) => DemoSnackBar(content: content),
    ),
    warningSnackBarConfig: SnackBarConfig(
      builder: (context, content) => DemoSnackBar(content: content),
    ),
    infoSnackBarConfig: SnackBarConfig(
      builder: (context, content) => DemoSnackBar(content: content),
    ),
    waitingSnackBarConfig: SnackBarConfig(
      builder: (context, content) => DemoSnackBar(content: content),
    ),
  );
  runApp(const MyApp());
}

class DemoMessage extends StatelessWidget {
  final MessageDialogContent content;

  const DemoMessage({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(24),
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: Center(child: Text(content.title ?? "Message")),
        ),
      ],
    );
  }
}

class DemoSnackBar extends StatelessWidget {
  final SnackBarContent content;

  const DemoSnackBar({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(24),
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: Center(child: Text(content.title ?? "Error snack bar")),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.show("custom");
              },
              child: const Text("Show Custom Dialog"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.showAlert(
                  title: "This is a title!",
                  message: "This is a alert message",
                );
              },
              child: const Text("Show Alert Dialog"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.showEditor(
                  hint: "Write something...",
                  title: "This is a title!",
                );
              },
              child: const Text("Show Editable Dialog"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.showLoader();
              },
              child: const Text("Show Loading Dialog"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.showMessage("This is a message", title: "Successful!");
              },
              child: const Text("Show Message Dialog"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.showSnackBar("This is a snack bar message!");
              },
              child: const Text("Show Snack Bar"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.showErrorSnackBar("This is a error snack bar message!");
              },
              child: const Text("Show Error Snack Bar"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.showWarningSnackBar(
                    "This is a warning snack bar message!");
              },
              child: const Text("Show Warning Snack Bar"),
            ),
          ],
        ),
      ),
    );
  }
}
