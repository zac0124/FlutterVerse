# friendly_chat

The app displays text messages in real time.
Users can enter a text string message, and send it either by pressing the Return key or the Send button.
The UI runs on Android and iOS devices, as well as the web.

Steps:
- Build the main user interface
- Add a UI for composing messages
- Add UI for displaying messages
- Message animation
-Apply finishing touches


The part of the user interface represented by a widget in its build() method. The framework calls the build() methods for FriendlyChatApp and ChatScreen when inserting these widgets into the widget hierarchy and when their dependencies change.

@override is a Dart annotation that indicates that the tagged method overrides a superclass's method.

Some widgets, like Scaffold and AppBar, are specific to Material Design apps. Other widgets, like Text, are generic and can be used in any app. Widgets from different libraries in the Flutter framework are compatible and can work together in a single app.

Simplifying the main() method enables hot reload because hot reload doesn't rerun main().

In Flutter, stateful data for a widget is encapsulated in a State object. The State object is then associated with a widget that extends the StatefulWidget class. _buildTextComposer() that returns a Container widget with a configured TextField widget.

The Container widget adds a horizontal margin between the edge of the screen and each side of the input field.
The units passed to EdgeInsets.symmetric are logical pixels that get translated into a specific number of physical pixels, depending on a device's pixel ratio. You might be familiar with the equivalent term for Android (density-independent pixels) or for iOS (points).

The onSubmitted property provides a private callback method, _handleSubmitted(). At first, this method just clears the field, but later you extend it to send the chat message.
The TextField with the TextEditingController gives you control over the text field. This controller will clear the field and read its value.

The IconButton displays the Send button. The icon property specifies the Icons.send constant from the Material library to create a new Icon instance.

Placing the IconButton inside a Container widget lets user customize the margin spacing of the button so that it visually fits better next to its input field.

The onPressed property uses an anonymous function to invoke the _handleSubmitted() method and passes the contents of the message using the _textController.
In Dart, the arrow syntax ( => expression) is sometimes used in declaring functions. This is shorthand for { return expression; } and is only used for one-line functions. For an overview of Dart function support, including anonymous and nested functions, see the Dart Language Tour.

Icons inherit their color, opacity, and size from an IconTheme widget, which uses an IconThemeData object to define these characteristics.
The IconTheme's data property specifies the ThemeData object for the current theme. This gives the button (and any other icons in this part of the widget tree) the accent color of the current theme.
A BuildContext object is a handle to the location of a widget in your app's widget tree. Each widget has its own BuildContext, which becomes the parent of the widget returned by the StatelessWidget.build or State.build function. This means that _buildTextComposer() can access the BuildContext object from its encapsulating State object. You don't need to pass the context to the method explicitly.


The build() method for ChatMessage returns a Row that displays a simple graphical avatar to represent the user who sent the chat message, a Column widget containing the sender's name, and the text of the message.

The CircleAvatar is personalized by labeling it with the user's first initial by passing the first character of the _name variable's value to a child Text widget.

The crossAxisAlignment parameter specifies CrossAxisAlignment.start in the Row constructor to position the avatar and messages relative to their parent widgets. For the avatar, the parent is a Row widget whose main axis is horizontal, so CrossAxisAlignment.start gives it the highest position along the vertical axis. For messages, the parent is a Column widget whose main axis is vertical, so CrossAxisAlignment.start aligns the text at the furthest left position along the horizontal axis.

Next to the avatar, two Text widgets are vertically aligned to display the sender's name on top and the text of the message below.
Theme.of(context)provides the default Flutter ThemeData object for the app. In a later step, you override this default theme to style your app differently for Android and iOS.

The ThemeData's textTheme property gives you access to Material Design logical styles for text like headline4, so you can avoid hard-coding font sizes and other text attributes. In this example, the sender's name is styled to make it larger than the message text.

Each item in the list is a ChatMessage instance.
The list is initialized to be empty.
Calling setState() to modify _messages lets the framework know that this part of the widget tree changed, and it needs to rebuild the UI. Only synchronous operations should be performed in setState() because otherwise the framework could rebuild the widgets before the operation finishes. When making multiple changes to the internal state of a State object, it is generally considered idiomatic to combine all of the changes into a single setState() call.
In general, it is possible to call setState() with an empty closure after some private data changed outside of this method call. However, updating data inside setState's closure is preferred, so you don't forget to call it afterward.

The ListView.builder factory method builds a list on demand by providing a function that is called once per item in the list. The function returns a new widget at each call. The builder also automatically detects mutations of its children parameter and initiates a rebuild.
The parameters passed to the ListView.builder constructor customize the list contents and appearance:
padding creates whitespace around the message text.
itemCount specifies the number of messages in the list.
itemBuilder provides the function that builds each widget in [index]. Because you don't need the current build context, you can ignore the first argument of IndexedWidgetBuilder. Naming the argument with an underscore (_) and nothing else is a convention indicating that the argument won't be used.

The body property of the Scaffold widget now contains the list of incoming messages as well as the input field and Send button. The layout uses the following widgets:
- Column: Lays out its direct children vertically. The Column widget takes a list of child widgets (same as a Row) that becomes a scrolling list and a row for an input field.
- Flexible, as a parent of ListView: Tells the framework to let the list of received messages expand to fill the Column height while TextField remains a fixed size.
- Divider: Draws a horizontal line between the UI for displaying messages and the text input field for composing messages.
- Container, as a parent of the text composer: Defines background images, padding, margins, and other common layout details.
- Decoration: Creates a new BoxDecoration object that defines the background color. In this case you're using the cardColor defined by the ThemeData object of the default theme. This gives the UI for composing messages a different background from the messages list.


The AnimationController specifies the animation's runtime duration to be 700 milliseconds. (This longer duration slows the animation effect so you can see the transition happen more gradually. In practice, you probably want to set a shorter duration when running your app.)
The animation controller is attached to a new ChatMessage instance, and specifies that the animation should play forward whenever a message is added to the chat list.
When creating an AnimationController, you must pass it a vsync argument. The vsync is the source of heartbeats (the Ticker) that drives the animation forward. This example uses _ChatScreenState as the vsync, so it adds a TickerProviderStateMixin mixin to the _ChatScreenState class definition.
In Dart, a mixin allows a class body to be reused in multiple class hierarchies. For more information, see Adding features to a class: mixins, a section in the Dart Language Tour.



The CurvedAnimation object, in conjunction with the SizeTransition class, produces an ease-out animation effect. The ease-out effect causes the message to slide up quickly at the beginning of the animation and slow down until it comes to a stop.
The SizeTransition widget behaves as an animating ClipRect that exposes more of the text as it slides in.


The onChanged callback notifies the TextField that the user edited its text. TextField calls this method whenever its value changes from the current value of the field.
The onChanged callback calls setState() to change the value of _isComposing to true when the field contains some text.
When _isComposing is false, the onPressed property is set to null.
The onSubmitted property was also modified so that it won't add an empty string to the message list.
The _isComposing variable now controls the behavior and the visual appearance of the Send button.
If the user types a string in the text field, then _isComposing is true. When the user presses the Send button, the framework invokes _handleSubmitted().
If the user types nothing in the text field, then _isComposing is false, and the widget's onPressed property is set to null, disabling the Send button. The framework automatically changes the button's color to Theme.of(context).disabledColor.


The Expanded widget allows its child widget (like Column) to impose layout constraints (in this case the Column's width) on a child widget. Here, it constrains the width of the Text widget, which is normally determined by its contents.

Customize for Android and iOS

The kDefaultTheme ThemeData object specifies colors for Android (purple with orange accents).
The kIOSTheme ThemeData object specifies colors for iOS (light grey with orange accents).