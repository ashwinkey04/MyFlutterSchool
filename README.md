# MyFlutterSchool

Reference: [Appbrewery](https://www.appbrewery.co/p/intro-to-flutter) 

### Adding assets
1. Create a directory under the project's topmost directory (Say 'images')
2. Mention the created directory in `pubspec.yaml` under the `flutter:` keyword
```yaml
flutter:  
  uses-material-design: true  
  assets:
    - images/
#Each child has two spaces prefixed
```
3. Use in project with the AssetImage class
```dart
image: AssetImage('images/diamond.png'),
```

### App Icon
1. Generate platform-wise icons in an [AppIconGenerator](https://appicon.co)
2. Replace `mipmap` folders under `/android/app/../res/` with the generated ones
>Instead you can also use the Create New Image asset option on res folder.
3. Replace `Assets.xcassets` under `/ios/runner/` with the generated ones for ios devices.
 ### Stateless
> In order for hot reload to work, your app be returned from a class that extends stateless widget

* Type in stless and hit enter, a class which extends steless will automatically be created!
* Instead of returning a container, return, say a MaterialApp class

### SafeArea

Wrap the SafeArea() widget around any widget, so that it doesn't overlap with system resources such as the topBar, navigationBar, notch area, etc.
> Just Alt+Enter on any widget, select 'Wrap with widget' and rename widget to SafeArea

> Declaring and not initializing a variable in Dart creates a dynamic variable i.e., it's data type can be changed at a later point of time.

### Polymorphism in dart
```dart
class Car{
	int seats=5;
	void drive(){
		print('Start Engine');
	}
}
class Tesla extends Car{
@override //Uses the below function if it is overloaded 
//with a function from the parent class
void drive(){ //Overloading as drive() exists in car
	super.drive();//Calls() drive of parent. 'super' points 
	//to parent class
	print('Autopilot engaged');
	}
}
```
In the above snippet, when the drive function of a `Tesla` object is called, Engine is started (as inherited from `Car`) and Autopilot is engaged as it comes under `drive()` of `Tesla`. A `Car` object can not engage Autopilot