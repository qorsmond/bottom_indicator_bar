# bottom_indicator_bar_svg

A flutter bottom tab with indicator, similar to the bottom tab of facebook app

## Forked Mods

- Allow svg icon assets for the icons

- Add labels to nav items

- Full credit to origanal repo by [Juan Jose Carracedo](https://github.com/DonsWayo)

![ezgif-2-f9b44356a4](https://user-images.githubusercontent.com/4716711/150592290-a2fcf5a9-d3bc-46f9-84f0-04d0cb84cfa8.gif "bottom_indicator_bar")

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
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        indicatorColor: Colors.blue,
        backgroundColor: Colors.black87,
      ),
    );
  }
}
```
