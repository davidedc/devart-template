/* Based on Simple Thread        */
/* example from:                 */
/* Daniel Shiffman               */
/* Programming from A to Z       */
/* Spring 2006                   */
/* http://www.shiffman.net       */
/* daniel.shiffman@nyu.edu       */


import java.net.*;
import java.io.*;

public class ServerConnectorThread extends Thread {

  public boolean running;           // Is the thread running?  Yes or no?
  private int wait;                  // How many milliseconds should we wait in between executions?
  private String id;                 // Thread name
  private int count;                 // counter

  public String JSONResponseFromServer = "empty - empty - empty - empty - empty - empty - empty - empty - empty - empty";
  private HttpURLConnection urlConnection;
  private UIv0 parent;

  UIv0.AnimationState
    deltaStateForServer,
    checkpointState,
    stateBeforeSending,
    previousExplicitServerState,
    serverState,
    deltaMostUpToDateChanges,
    goodUpdatesFromServer;

  // Constructor, create the thread
  // It is not running by default
  public ServerConnectorThread (int w, String s, UIv0 parent) {
    wait = w;
    running = false;
    id = s;
    count = 0;
    this.parent = parent;
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

      // Ok, let's wait for however long we should wait
      try {
        sleep((long)(wait));
      } 
      catch (Exception e) {
      }

      System.out.println(id + ": " + count);
      count++;

      String JSONOfDeltaLocalState = "{}";
      
      if (checkpointState == null) {
        checkpointState = parent.animationState.clone();
        System.out.println("#### no recollection of previous state, creating one");
      }

      System.out.println("#### checkpoint: " + checkpointState.toJSON());
      System.out.println("#### current state: " + parent.animationState.toJSON());

      deltaStateForServer = parent.animationState.delta(checkpointState);
      stateBeforeSending = parent.animationState.clone();
      System.out.println("#### state before connection: " + stateBeforeSending.toJSON());

      JSONOfDeltaLocalState = deltaStateForServer.toJSON();
      System.out.println("#### JSONOfDeltaLocalState: " + JSONOfDeltaLocalState);

      // Now send the local state delta to the server
      
      try {
        //String JSONOfDeltaLocalStatePlusID =  JSONOfDeltaLocalState.substring(0, JSONOfDeltaLocalState.length()-1);
        //JSONOfDeltaLocalStatePlusID += ",'id':" + parent.randomSessionID + "}";
        URL url = new URL(parent.urlToFetch + JSONOfDeltaLocalState);
        System.out.println(">>>> server request");
        int startTime = parent.millis();
        urlConnection = (HttpURLConnection) url.openConnection();
        InputStream in = new BufferedInputStream(urlConnection.getInputStream());
        JSONResponseFromServer = readStream(in);
        int endTime = parent.millis();
        System.out.println(">>>> server reply in " +  (endTime-startTime) + " milliseconds : " + JSONResponseFromServer);
      } 
      catch (Exception e) {
        System.out.println(">>>> exception while connecting to server: " +  e);
        continue; // go back to top of the loop.
      }
      // don't worry, it does TCP connection pooling
      // and keepalive behind the scenes.
      urlConnection.disconnect();

      if (JSONResponseFromServer.equals("{}")) {
        if (previousExplicitServerState == null) continue;
        serverState = previousExplicitServerState.clone();
        System.out.println("#### reply from server empty, using: " + serverState.toJSON());
      }
      else {
        serverState = parent.new AnimationState(JSONResponseFromServer);
        previousExplicitServerState = serverState.clone();
        System.out.println("#### reply from server: " + serverState.toJSON());
      }



      // 200ms are a long time so
      // re-take a snapshot of the UI to figure out
      // what to change and what not to change
      deltaMostUpToDateChanges = parent.animationState.delta(checkpointState);
      System.out.println("#### while connecting the user has changed this: " + deltaMostUpToDateChanges.toJSON());
      
      goodUpdatesFromServer = serverState.minus(deltaMostUpToDateChanges);
      goodUpdatesFromServer = goodUpdatesFromServer.delta(parent.animationState); // don't update what's same as current state
      System.out.println("#### updates from server we are going to apply: " + goodUpdatesFromServer.toJSON());
      parent.deltaStateFromServerToUpdateUI = goodUpdatesFromServer;
      checkpointState = stateBeforeSending.plus(goodUpdatesFromServer);
      System.out.println("#### new checkpoint: " + checkpointState.toJSON());
      


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

