import 'package:equatable/equatable.dart';

/// All Entities should implement this interface.
/// In other words, every Entity should also be of type [Equatable].
/// This is to ensure that all Entities can be compared for "value" equality
/// and not just by reference (dart's default behavior).
abstract class EntityIntf extends Equatable {
  const EntityIntf();
}
