import 'package:features_force_update/force_update.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Version - Value Object', () {
    test('should create a valid version', () {
      // Arrange
      const versionString = '1.2.3';

      // Act
      final version = Version(versionString);

      // Assert
      expect(version.value, equals(versionString));
    });

    test('should throw ArgumentError for invalid version format', () {
      // Arrange
      const invalidVersions = ['1.2', '1.2.3.4', '1.2.a', ''];

      // Act & Assert
      for (final invalidVersion in invalidVersions) {
        // Act
        Version createVersion() => Version(invalidVersion);

        // Assert
        expect(
          createVersion,
          throwsArgumentError,
          reason: 'Version $invalidVersion should throw ArgumentError',
        );
      }
    });

    test('should correctly parse version parts', () {
      // Arrange
      const versionString = '1.2.3';
      final expectedParts = [1, 2, 3];

      // Act
      final version = Version(versionString);
      final actualParts = version.versionParts;

      // Assert
      expect(actualParts, equals(expectedParts));
    });

    group('comparison operators', () {
      test('> operator should correctly compare versions', () {
        // Arrange
        final version1 = Version('1.2.3');
        final version2 = Version('1.2.2');
        final version3 = Version('1.1.4');
        final version4 = Version('2.0.0');
        final version5 = Version('1.9.9');
        final sameVersion = Version('1.2.3');

        // Act & Assert
        // Test case 1
        final isGreaterThan1 = version1 > version2;
        expect(
          isGreaterThan1,
          isTrue,
          reason: '1.2.3 should be greater than 1.2.2',
        );

        // Test case 2
        final isGreaterThan2 = version1 > version3;
        expect(
          isGreaterThan2,
          isTrue,
          reason: '1.2.3 should be greater than 1.1.4',
        );

        // Test case 3
        final isGreaterThan3 = version4 > version5;
        expect(
          isGreaterThan3,
          isTrue,
          reason: '2.0.0 should be greater than 1.9.9',
        );

        // Test case 4
        final isGreaterThan4 = version1 > sameVersion;
        expect(
          isGreaterThan4,
          isFalse,
          reason: '1.2.3 should not be greater than itself',
        );

        // Test case 5
        final isGreaterThan5 = version2 > version1;
        expect(
          isGreaterThan5,
          isFalse,
          reason: '1.2.2 should not be greater than 1.2.3',
        );
      });

      test('< operator should correctly compare versions', () {
        // Arrange
        final version1 = Version('1.2.2');
        final version2 = Version('1.2.3');
        final version3 = Version('1.1.4');
        final version4 = Version('1.9.9');
        final version5 = Version('2.0.0');
        final sameVersion = Version('1.2.3');

        // Act & Assert
        // Test case 1
        final isLessThan1 = version1 < version2;
        expect(isLessThan1, isTrue, reason: '1.2.2 should be less than 1.2.3');

        // Test case 2
        final isLessThan2 = version3 < version2;
        expect(isLessThan2, isTrue, reason: '1.1.4 should be less than 1.2.3');

        // Test case 3
        final isLessThan3 = version4 < version5;
        expect(isLessThan3, isTrue, reason: '1.9.9 should be less than 2.0.0');

        // Test case 4
        final isLessThan4 = version2 < sameVersion;
        expect(
          isLessThan4,
          isFalse,
          reason: '1.2.3 should not be less than itself',
        );

        // Test case 5
        final isLessThan5 = version2 < version1;
        expect(
          isLessThan5,
          isFalse,
          reason: '1.2.3 should not be less than 1.2.2',
        );
      });

      test('>= operator should correctly compare versions', () {
        // Arrange
        final version1 = Version('1.2.3');
        final version2 = Version('1.2.2');
        final sameVersion = Version('1.2.3');

        // Act & Assert
        // Test case 1
        final isGreaterOrEqual1 = version1 >= version2;
        expect(
          isGreaterOrEqual1,
          isTrue,
          reason: '1.2.3 should be greater than or equal to 1.2.2',
        );

        // Test case 2
        final isGreaterOrEqual2 = version1 >= sameVersion;
        expect(
          isGreaterOrEqual2,
          isTrue,
          reason: '1.2.3 should be equal to itself',
        );

        // Test case 3
        final isGreaterOrEqual3 = version2 >= version1;
        expect(
          isGreaterOrEqual3,
          isFalse,
          reason: '1.2.2 should not be greater than or equal to 1.2.3',
        );
      });

      test('<= operator should correctly compare versions', () {
        // Arrange
        final version1 = Version('1.2.2');
        final version2 = Version('1.2.3');
        final sameVersion = Version('1.2.3');

        // Act & Assert
        // Test case 1
        final isLessOrEqual1 = version1 <= version2;
        expect(
          isLessOrEqual1,
          isTrue,
          reason: '1.2.2 should be less than or equal to 1.2.3',
        );

        // Test case 2
        final isLessOrEqual2 = version2 <= sameVersion;
        expect(
          isLessOrEqual2,
          isTrue,
          reason: '1.2.3 should be equal to itself',
        );

        // Test case 3
        final isLessOrEqual3 = version2 <= version1;
        expect(
          isLessOrEqual3,
          isFalse,
          reason: '1.2.3 should not be less than or equal to 1.2.2',
        );
      });
    });

    test('empty version should be valid', () {
      // Arrange
      const expectedEmptyValue = '';

      // Act
      final emptyVersion = Version.empty;
      final actualValue = emptyVersion.value;

      // Assert
      expect(actualValue, equals(expectedEmptyValue));
    });
  });
}
