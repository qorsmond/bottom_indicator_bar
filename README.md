# bottom_indicator_bar

A flutter bottom tab with indicator, similar to the bottom tab of facebook app (with small modification to allow svg icons)


![Screen Recording 2022-01-21 at 21 48 54](https://user-images.githubusercontent.com/4716711/150591400-195c7567-2c4d-4469-91ec-ac245ab79d0f.gif "bottom_indicator_bar")



## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  bottom_indicator_bar: lastest_version
```

## Basic Usage


```dart
class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomIndicatorNavigationBarItem> items = [
    BottomIndicatorNavigationBarItem(icon: Icons.home),
    BottomIndicatorNavigationBarItem(icon: Icons.search),
    BottomIndicatorNavigationBarItem(icon: 'assets/accountIcon.svg'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indicator Bottom Bar"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          ],
        ),
      ),
      bottomNavigationBar: BottomIndicatorBar(
        onTap: (index) => {},
        items: items,
        activeColor: Colors.teal,
        inactiveColor: Colors.grey,
        indicatorColor: Colors.teal,
      ),
    );
  }
}
```
