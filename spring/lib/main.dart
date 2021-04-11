import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spring Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Spring(),
    );
  }
}

class Spring extends StatefulWidget {
  Spring({Key key}) : super(key: key);
  @override
  _SpringState createState() => _SpringState();
}

class _SpringState extends State<Spring> with SingleTickerProviderStateMixin {
  final _springDescription = SpringDescription(
    mass: 1.0,
    stiffness: 500.0,
    damping: 15.0,
  );
  SpringClass _springClass;

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _springClass =
        SpringClass(tickerProvider: this, springDescription: _springDescription)
          ..addListener(() {
            setState(() {});
          });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _springClass
        ..anchorPosition = details.localPosition
        ..startSpring();
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _springClass.springPosition += details.delta;
    });
  }

  void _onPanStart(DragStartDetails details) {
    _springClass.endSpring();
  }

  void _onPanEnd(DragEndDetails details) {
    _springClass.startSpring();
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        RenderBox box = context.findRenderObject() as RenderBox;
        if (box != null && box.hasSize) {
          _initialized = true;
          _springClass.springPosition = box.size.center(Offset.zero);
          _springClass.anchorPosition = _springClass.springPosition;
        }
      });
      return SizedBox();
    }
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTapUp: _onTapUp,
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Stack(
          children: [
            _buildBackGround(),
            CustomPaint(
              painter: WebPainter(
                springAnchor: _springClass.anchorPosition,
                springPosition: _springClass.springPosition,
              ),
              size: Size.infinite,
            ),
            Transform.translate(
              offset: _springClass.springPosition,
              child: FractionalTranslation(
                  translation: Offset(-0.5, -0.5), child: _buildItem()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackGround() {
    return SizedBox.expand(
      child: Container(
        color: Colors.black.withOpacity(0.6),
      ),
    );
  }

  Widget _buildItem() {
    return Icon(
      Icons.casino,
      size: 60,
      color: Colors.white,
    );
  }
}

class SpringClass extends ChangeNotifier {
  SpringClass({
    @required TickerProvider tickerProvider,
    @required SpringDescription springDescription,
  })  : _tickerProvider = tickerProvider,
        _springDescription = springDescription;

  final TickerProvider _tickerProvider;
  final SpringDescription _springDescription;
  SpringSimulation _springSimulationX;
  SpringSimulation _springSimulationY;
  Offset _previousVelocity = Offset.zero;

  Ticker _ticker;

  Offset get springPosition => _springPosition;
  Offset _springPosition = Offset.zero;
  set springPosition(Offset newSpringPosition) {
    endSpring();
    _springPosition = newSpringPosition;
  }

  Offset get anchorPosition => _anchorPosition;
  Offset _anchorPosition = Offset.zero;
  set anchorPosition(Offset newAnchorPosition) {
    endSpring();
    _anchorPosition = newAnchorPosition;
  }

  void startSpring() {
    _springSimulationX = SpringSimulation(
      _springDescription,
      _springPosition.dx,
      _anchorPosition.dx,
      _previousVelocity.dx,
    );

    _springSimulationY = SpringSimulation(
      _springDescription,
      _springPosition.dy,
      _anchorPosition.dy,
      _previousVelocity.dy,
    );

    if (_ticker == null) {
      _ticker = _tickerProvider.createTicker(_onTick);
    }
    _ticker.start();
  }

  void _onTick(Duration elapsedTime) {
    final elapsedSecondsFraction = elapsedTime.inMilliseconds / 1000.0;
    _springPosition = Offset(
      _springSimulationX.x(elapsedSecondsFraction),
      _springSimulationY.x(elapsedSecondsFraction),
    );

    _previousVelocity = Offset(
      _springSimulationX.dx(elapsedSecondsFraction),
      _springSimulationY.dx(elapsedSecondsFraction),
    );
    if (_springSimulationX.isDone(elapsedSecondsFraction) &&
        _springSimulationY.isDone(elapsedSecondsFraction)) {
      endSpring();
    }
    notifyListeners();
  }

  void endSpring() {
    if (_ticker != null) {
      _ticker.stop();
    }
  }
}

class WebPainter extends CustomPainter {
  WebPainter({
    @required this.springAnchor,
    @required this.springPosition,
  });

  final Offset springPosition;
  final Offset springAnchor;
  final Paint springPaint = Paint()
    ..color = Colors.grey
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(springAnchor, springPosition, springPaint);
  }

  @override
  bool shouldRepaint(WebPainter oldDelegate) {
    return springAnchor != oldDelegate.springAnchor ||
        springPosition != oldDelegate.springPosition;
  }
}
