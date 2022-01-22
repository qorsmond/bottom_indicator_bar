# bottom_indicator_bar_svg

A flutter bottom tab with indicator, similar to the bottom tab of facebook app

## Forked Mods

- Allow svg icon assets for the icons

- Add labels to nav items

- Full credit to original repo by [Juan Jose Carracedo](https://github.com/DonsWayo)

![ezgif-2-f7cff4c02f](https://user-images.githubusercontent.com/4716711/150628594-1f1e96db-4bec-4809-977f-245a6fc546fc.gif "bottom_indicator_bar_svg")

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  bottom_indicator_bar_svg: lastest_version
```

## Basic Usage


```dart
class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomIndicatorNavigationBarItem> items = [
    BottomIndicatorNavigationBarItem(icon: Icons.home, label: Text('Home')),
    BottomIndicatorNavigationBarItem(icon: Icons.search, label: 'Search'),
    BottomIndicatorNavigationBarItem(icon: 'assets/svgIcon.svg', label: 'Svg'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indicator Bottom Bar"),
        backgroundColor: Colors.black87,
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
        iconSize: 30.0,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        indicatorColor: Colors.blue,
        backgroundColor: Colors.black87,
      ),
    );
  }
}
```
