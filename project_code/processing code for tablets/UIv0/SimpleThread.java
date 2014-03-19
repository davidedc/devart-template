/* Daniel Shiffman               */
/* Programming from A to Z       */
/* Spring 2006                   */
/* http://www.shiffman.net       */
/* daniel.shiffman@nyu.edu       */

// A Simple Thread example

import java.net.*;
import java.io.*;

public class SimpleThread extends Thread {

  public boolean running;           // Is the thread running?  Yes or no?
  private int wait;                  // How many milliseconds should we wait in between executions?
  private String id;                 // Thread name
  private int count;                 // counter

  public String JSONResponseFromServer = "empty - empty - empty - empty - empty - empty - empty - empty - empty - empty";
  private HttpURLConnection urlConnection;
  private UIv0 parent;

  UIv0.AnimationState previousAnimationState;
  //UIv0.AnimationState previousAnimationStateFromServer;

  // Constructor, create the thread
  // It is not running by default
  public SimpleThread (int w, String s, UIv0 parent) {
    wait = w;
    running = false;
    id = s;
    count = 0;
    this.parent = parent;
    //previousAnimationStateFromServer = parent.new AnimationState();
  }

  // Overriding "start()"
  public void start () {
    // Set running equal to true
    running = true;
    // Print messages
    System.out.println("Starting thread (will execute every " + wait + " milliseconds.)"); 
    // Do whatever start does in Thread, don't forget this!
    super.start();
  }


  // Here is what happens:
  // every x milliseconds we check what the user changes
  // have been. He might have touched two buttons and a slider.
  // We compare the changes against a previously saved snapshot
  // of the state at the previous loop.
  // We send the changes to the Server. The Server sends us back
  // a full AnimationState which incorporates all changes from all
  // users so far.
  // We calculate the delta of what the Server state is with what the
  // local state is, and we put that in the main thread so that
  // the next frame the main thread will update the UI to reflect
  // the consolidated state from the server.
  public void run () {
    while (running /* && count < 10 */) {
      System.out.println(id + ": " + count);
      count++;

      String JSONOfDelta = "{}";

      if (previousAnimationState == null) {
        previousAnimationState = parent.animationState.clone();
        System.out.println(">>>> no recollection of previous state, creating one");
      }
      else {
        UIv0.AnimationState delta = parent.animationState.deltaOfState(previousAnimationState);
        JSONOfDelta = delta.toJSON();
        previousAnimationState = parent.animationState.clone();
        if (!JSONOfDelta.equals("{}")) {
          System.out.println(">>>> JSON of delta: >" + JSONOfDelta + "<");
        }
        else {
          System.out.println(">>>> no changes to animation state");
        }
      }



      try {
        URL url = new URL(parent.urlToFetch + JSONOfDelta);
        System.out.println(">>>> server request");
        int startTime = parent.millis();
        urlConnection = (HttpURLConnection) url.openConnection();
        InputStream in = new BufferedInputStream(urlConnection.getInputStream());
        JSONResponseFromServer = readStream(in);
        int endTime = parent.millis();
        System.out.println(">>>> server reply in " +  (endTime-startTime) + " milliseconds : " + JSONResponseFromServer);
      } 
      catch (Exception e) {
        JSONResponseFromServer = e.toString();
      }
      // don't worry, it does TCP connection pooling
      // and keepalive behind the scenes.
      urlConnection.disconnect();

      UIv0.AnimationState animationStateFromServer;
      
      if (JSONResponseFromServer.equals("{}")) {
        //animationStateFromServer = previousAnimationStateFromServer;
        parent.deltaStateFromServerToUpdateUI = null;
      }
      else {
        animationStateFromServer = parent.new AnimationState(JSONResponseFromServer);
        System.out.println(">>>> server reply (formatted): " + animationStateFromServer.toString());      
        parent.deltaStateFromServerToUpdateUI = animationStateFromServer.deltaOfState(parent.animationState);
        // we baseline future local changes against the
        // server authoritative state info.
        previousAnimationState = animationStateFromServer;
      }
      


      // Ok, let's wait for however long we should wait
      try {
        sleep((long)(wait));
      } 
      catch (Exception e) {
      }
    }
    System.out.println(id + " thread is done!");  // The thread is done when we get to the end of run()
  }


  // Our method that quits the thread
  public void quit() {
    System.out.println("Quitting."); 
    running = false;  // Setting running to false ends the loop in run()
    // We used to need to call super.stop()
    // We don't any more since it is deprecated, see: http://java.sun.com/j2se/1.5.0/docs/guide/misc/threadPrimitiveDeprecation.html
    // super.stop();
    // Instead, we use interrupt, in case the thread is waiting. . .
    interrupt();
  }

  private String readStream(InputStream is) {
    try {
      ByteArrayOutputStream bo = new ByteArrayOutputStream();
      int i = is.read();
      while (i != -1) {
        bo.write(i);
        i = is.read();
      }
      return bo.toString();
    } 
    catch (IOException e) {
      return "";
    }
  }
}

