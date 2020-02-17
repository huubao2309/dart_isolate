# Dart Isolate
Link: https://api.dart.dev/stable/2.7.1/dart-isolate/dart-isolate-library.html

`Concurrent programming using isolates: independent workers that are similar to threads but don't share memory, communicating only via messages.`

## Why use Dart iSolate?
* Dart is Single Threaded
* Calculate so many on a threaded => Hang app
    ```javascript
      for (var i = 0; i < 1000000000000; i++) {
        total += i;
      }
    ```
* Speed up application

### [Create a new iSolate](https://github.com/huubao2309/dart_isolate/blob/master/dart_isolate/lib/raise_button_new.dart)

    ![New Solate](/images/create_isolate.png)

### [iSolate two-ways](https://github.com/huubao2309/dart_isolate/blob/master/dart_isolate/lib/send_isolate_two_ways.dart)

    ![Send iSolate two-ways](/images/two-ways_isolate.png)

### [Kill isolate](https://github.com/huubao2309/dart_isolate/blob/master/dart_isolate/lib/send_isolate_two_ways.dart)

  ```javascript
      // After 1s will kill isolate
      Future.delayed(Duration(seconds: 1), () {
        newIsolate.kill(priority: Isolate.immediate);
        newIsolate = null;
        print('Isolate is killed after 1s!');
      });
  ```
    
### [Compute isolate](https://github.com/huubao2309/dart_isolate/blob/master/dart_isolate/lib/compute_isolate.dart)

  ```javascript
      Future<void> demoCompute() async {
        // Calculate a new value
        var result = await compute(calutate, 5);
        print(result);
      }

      static int calutate(int number) {
        return number * 10;
      }
  ```
    
    
