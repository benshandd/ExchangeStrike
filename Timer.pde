class Timer {
  int startTime = 0;
  int stopTime = 0;
  
  // Initialising a variable detecting whether the timer is currently running or not.
  boolean isRunning = false; // initial value
  void start(){
    startTime = millis();
    isRunning = true;
  }
  void stop(){
    stopTime = millis();
    isRunning = false;
  }
  int calculateTimeElapsed(){
    return isRunning ? (millis() - startTime) : (stopTime - startTime);
  }
  // Creating a method to calculate the amount of time elapsed in seconds
  float timeElapsedInSeconds(){
    return (calculateTimeElapsed() / 1000.0);
  }
}
