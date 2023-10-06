# signin_example

This project is about how to write a Flutter app that looks natural on the web.
- Basic structure of a Flutter app.
- How to implement a Tween animation.
- How to implement a stateful widget.
- How to use the debugger to set breakpoints.

Observations
The entire code for this example lives in the lib/main.dart file.
If you know Java, the Dart language should feel very familiar.
All of the app’s UI is created in Dart code. For more information, see Introduction to declarative UI.
The app’s UI adheres Material Design, a visual design language that runs on any device or platform. You can customize the Material Design widgets, but if you prefer something else, Flutter also offers the Cupertino widget library, which implements the current iOS design language. Or you can create your own custom widget library.
In Flutter, almost everything is a Widget. Even the app itself is a widget. The app’s UI can be described as a widget tree.


The _showWelcomeScreen() function is used in the build() method as a callback function. Callback functions are often used in Dart code and, in this case, this means “call this method when the button is pressed”.
The const keyword in front of the constructor is very important. When Flutter encounters a constant widget, it short-circuits most of the rebuilding work under the hood making the rendering more efficient.
Flutter has only one Navigator object. This widget manages Flutter’s screens (also called routes or pages) inside a stack. The screen at the top of the stack is the view that is currently displayed. Pushing a new screen to this stack switches the display to that new screen. This is why the _showWelcomeScreen function pushes the WelcomeScreen onto the Navigator’s stack. The user clicks the button and, voila, the welcome screen appears. Likewise, calling pop() on the Navigator returns to the previous screen. Because Flutter’s navigation is integrated into the browser’s navigation, this happens implicitly when clicking the browser’s back arrow button.


Calling a widget’s setState() method tells Flutter that the widget needs to be updated on screen. The framework then disposes of the previous immutable widget (and its children), creates a new one (with its accompanying child widget tree), and renders it to screen. For this to work seamlessly, Flutter needs to be fast. The new widget tree must be created and rendered to screen in less than 1/60th of a second to create a smooth visual transition—especially for an animation. Luckily Flutter is fast.
The progress field is defined as a floating value, and is updated in the _updateFormProgress method. When all three fields are filled in, _formProgress is set to 1.0. When _formProgress is set to 1.0, the onPressed callback is set to the _showWelcomeScreen method. Now that its onPressed argument is non-null, the button is enabled. Like most Material Design buttons in Flutter, TextButtons are disabled by default if their onPressed and onLongPress callbacks are null.
Notice that the _updateFormProgress passes a function to setState(). This is called an anonymous function and has the following syntax:
content_copy
methodName(() {...});
Where methodName is a named function that takes an anonymous callback function as an argument.

The Dart syntax in the last step that displays the welcome screen is:
content_copy
onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
This is a Dart conditional assignment and has the syntax: condition ? expression1 : expression2. If the expression _formProgress == 1 is true, the entire expression results in the value on the left hand side of the :, which is the _showWelcomeScreen method in this case.



Use an AnimationController to run any animation.
AnimatedBuilder rebuilds the widget tree when the value of an Animation changes.
Using a Tween, interpolation between almost any value, in this case, Color.
