import 'dart:io';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pawon/cubit/auth_cubit.dart';
import 'package:pawon/cubit/page_cubit.dart';
import 'package:pawon/cubit/plan_cubit.dart';
import 'package:pawon/cubit/recipe_cubit.dart';
import 'package:pawon/models/models.dart';
import 'package:pawon/shared/shared.dart';
import 'package:pawon/ui/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


part 'step_page.dart';
part "onboarding.dart";
part "homepage.dart";
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'wrapper_page.dart';
part 'profile_page.dart';
part 'status_page.dart';
part 'plan_page.dart';
part 'ingredient_page.dart';
part 'instructions_page.dart';
part 'create_recipe_page.dart';
part 'history_page.dart';
part 'change_password_page.dart';
part 'custom_loader_page.dart';
part 'change_name_page.dart';
part 'plan_creator_page.dart';