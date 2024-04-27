library core;

import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;


import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart' show kMinFlingVelocity;
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:paloma_test/foundation/routes/app_router/sets_map.dart';
import 'package:paloma_test/routers/app_router/app_router.dart';

part 'routes/app_router/app_router_base.dart';
part 'route_core/route_core.dart';
part 'route_core/route_controller.dart';
// part 'route_core/route_node.dart';
part 'route_core/repository_container.dart';
part 'ice_flutter_toolkit.g.dart';