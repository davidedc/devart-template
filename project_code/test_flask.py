from multiprocessing import Process, Queue
import time
from flask import Flask, render_template
import json
import random

app = Flask(__name__)
QUEUE = Queue()
STATE = [[0 for i in range(10)] for j in range(2)]

@app.route("/")
def hello():
  templateData = {} # could current state I suppose
  return render_template('main.html', **templateData)

@app.route("/update/<index>/<value>")
def check(index, value):
  #NB this STATE is different from STATE in the parent process!
  global STATE
  if not QUEUE.empty():
    STATE = QUEUE.get()
  return json.dumps(STATE, separators=(',',':'))

def start_server():
  app.run(host='0.0.0.0', port=80, debug=True)

if __name__ == "__main__":
  p = Process(target=start_server)
  p.start()

  while True:
    #this would really be the main animation loop
    time.sleep(5.0)
    STATE = [[random.randint(0, 100) for i in range(10)] for j in range(2)]
    while not QUEUE.empty(): #cear it if nothing has consumed previous input to queue
      QUEUE.get()
    QUEUE.put(STATE) #NB STATE in this process is different from STATE in spawned process p
  
