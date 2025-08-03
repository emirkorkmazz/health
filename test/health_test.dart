import 'package:flutter_test/flutter_test.dart';
import 'package:health_hs/health.dart';

void main() {
  group('Health Plugin Tests', () {
    late Health health;

    setUp(() {
      health = Health();
    });

    test('Health plugin can be instantiated', () {
      expect(health, isNotNull);
    });

    test('Health platform type is correctly determined', () {
      expect(health.platformType, isA<HealthPlatformType>());
    });

    test('Health data types are available', () {
      expect(HealthDataType.values, isNotEmpty);
      expect(HealthDataType.STEPS, isNotNull);
      expect(HealthDataType.HEART_RATE, isNotNull);
    });

    test('Health data units are available', () {
      expect(HealthDataUnit.values, isNotEmpty);
      expect(HealthDataUnit.COUNT, isNotNull);
      expect(HealthDataUnit.BEATS_PER_MINUTE, isNotNull);
    });

    test('Health workout activity types are available', () {
      expect(HealthWorkoutActivityType.values, isNotEmpty);
      expect(HealthWorkoutActivityType.RUNNING, isNotNull);
      expect(HealthWorkoutActivityType.WALKING, isNotNull);
    });

    test('Health data access types are available', () {
      expect(HealthDataAccess.values, isNotEmpty);
      expect(HealthDataAccess.READ, isNotNull);
      expect(HealthDataAccess.WRITE, isNotNull);
    });

    test('Recording method types are available', () {
      expect(RecordingMethod.values, isNotEmpty);
      expect(RecordingMethod.automatic, isNotNull);
      expect(RecordingMethod.manual, isNotNull);
    });

    test('Health value types can be created', () {
      final numericValue = NumericHealthValue(numericValue: 100);
      expect(numericValue.numericValue, equals(100));
      expect(numericValue, isA<HealthValue>());
    });

    test('Health data point can be created', () {
      final dataPoint = HealthDataPoint(
        uuid: 'test-uuid',
        value: NumericHealthValue(numericValue: 100),
        type: HealthDataType.STEPS,
        unit: HealthDataUnit.COUNT,
        dateFrom: DateTime.now(),
        dateTo: DateTime.now(),
        sourcePlatform: HealthPlatformType.appleHealth,
        sourceDeviceId: 'test-device',
        sourceId: 'test-source',
        sourceName: 'test-source-name',
      );
      
      expect(dataPoint.uuid, equals('test-uuid'));
      expect(dataPoint.type, equals(HealthDataType.STEPS));
      expect(dataPoint.unit, equals(HealthDataUnit.COUNT));
    });

    test('Workout summary can be created', () {
      final workoutSummary = WorkoutSummary(
        workoutType: 'RUNNING',
        totalDistance: 5000,
        totalEnergyBurned: 300,
        totalSteps: 5000,
      );
      
      expect(workoutSummary.workoutType, equals('RUNNING'));
      expect(workoutSummary.totalDistance, equals(5000));
      expect(workoutSummary.totalEnergyBurned, equals(300));
      expect(workoutSummary.totalSteps, equals(5000));
    });

    test('Audiogram health value can be created', () {
      final audiogram = AudiogramHealthValue(
        frequencies: [250, 500, 1000, 2000, 4000, 8000],
        leftEarSensitivities: [10, 15, 20, 25, 30, 35],
        rightEarSensitivities: [12, 17, 22, 27, 32, 37],
      );
      
      expect(audiogram.frequencies.length, equals(6));
      expect(audiogram.leftEarSensitivities.length, equals(6));
      expect(audiogram.rightEarSensitivities.length, equals(6));
    });

    test('Workout health value can be created', () {
      final workout = WorkoutHealthValue(
        workoutActivityType: HealthWorkoutActivityType.RUNNING,
        totalEnergyBurned: 300,
        totalEnergyBurnedUnit: HealthDataUnit.KILOCALORIE,
        totalDistance: 5000,
        totalDistanceUnit: HealthDataUnit.METER,
        totalSteps: 5000,
        totalStepsUnit: HealthDataUnit.COUNT,
      );
      
      expect(workout.workoutActivityType, equals(HealthWorkoutActivityType.RUNNING));
      expect(workout.totalEnergyBurned, equals(300));
      expect(workout.totalDistance, equals(5000));
      expect(workout.totalSteps, equals(5000));
    });

    test('Nutrition health value can be created', () {
      final nutrition = NutritionHealthValue(
        name: 'Breakfast',
        calories: 500,
        protein: 25,
        fat: 15,
        carbs: 60,
      );
      
      expect(nutrition.name, equals('Breakfast'));
      expect(nutrition.calories, equals(500));
      expect(nutrition.protein, equals(25));
      expect(nutrition.fat, equals(15));
      expect(nutrition.carbs, equals(60));
    });

    test('Menstrual flow enum values are correct', () {
      expect(MenstrualFlow.values, isNotEmpty);
      expect(MenstrualFlow.light, isNotNull);
      expect(MenstrualFlow.medium, isNotNull);
      expect(MenstrualFlow.heavy, isNotNull);
    });

    test('Recording method conversion works', () {
      expect(RecordingMethod.fromInt(0), equals(RecordingMethod.unknown));
      expect(RecordingMethod.fromInt(1), equals(RecordingMethod.active));
      expect(RecordingMethod.fromInt(2), equals(RecordingMethod.automatic));
      expect(RecordingMethod.fromInt(3), equals(RecordingMethod.manual));
      
      expect(RecordingMethod.automatic.toInt(), equals(2));
      expect(RecordingMethod.manual.toInt(), equals(3));
    });

    test('Package can be imported and used', () {
      // Test that all main classes can be imported and instantiated
      expect(() => Health(), returnsNormally);
      expect(() => NumericHealthValue(numericValue: 100), returnsNormally);
      expect(() => HealthDataPoint(
        uuid: 'test',
        value: NumericHealthValue(numericValue: 100),
        type: HealthDataType.STEPS,
        unit: HealthDataUnit.COUNT,
        dateFrom: DateTime.now(),
        dateTo: DateTime.now(),
        sourcePlatform: HealthPlatformType.appleHealth,
        sourceDeviceId: 'test',
        sourceId: 'test',
        sourceName: 'test',
      ), returnsNormally);
    });
  });
}
