Realtime synching of UIs over networks
--------------------------------------

Rubberbanding is a term well known to whoever engaged in multiplayer first-person-shooter games. You or your opponent is going in one direction, only to find out moments later that the character is "bouncing back" midway-through or even going in the opposite direction.

It's basically a problem of state synching over a network with latency.

So inevitably we had to fight the same problem to some degree, as we are synching the whole UI across a number of clients.

To be analytical - a part of the problem is inherent and unavoidable, for example concurrent modification of the same slider is going to end up in one winner and one loser. But there is a particular part of the problem that is very annoying and *can* be avoided, i.e. the issue of having a widget updated *while* the user is working with it. Whoever tried to drag a slider that "opposed resistance" or acted erratically knows the feeling. It just completely breaks the feeling of consistency of the UI.

How would one go about solving that? One idea is to hope there is no problem and hope that some kind of simple magical merge will work, as in this first diagram of mine:

![Happy days](https://raw.github.com/davidedc/devart-template/master/project_images/UI-Synch-diagram-1-happy-days.gif)

This is what lead to a couple of nights of manual adjusting. You know the feeling. Maybe you can merge this update. Except in this case. And you need to remember the previous value. But maybe not if you pressed the button recently. And wait maybe you need a copy of the copy here cause you need it in this case, but let's leave this old variable name even though it's misleading.

After a couple of nights of this you see that the buttons over the clients start to mimic one another in a dance loop. You swallow the humble sandwich. You figure that some proper thinking is needed.

Back to pen and paper
----------------------

The server's account of the UI status is authoritative. Except for the parts of the UI that the user updated since the last communication. And also the changes that the user performs during the 250ms or more *while* the server is contacted need to be taken into account, so those changes will have to resist the updates from the server too, but those need to be sent at the next communication. Oh and don't forget that we definitely don't want the client to send back to the server the changes that it received from server. Also both the clients and the server send (almost) minimal deltas back and forth, so some care is needed to always have an accurate rendition of the states.

So. After quite a bit ot thinking. This is what synchronising UI over latencies looks like (note that the diagram assumes 10 seconds latency to highlight that things need to work no matter what the amount of latency is):

![going deeper](https://raw.github.com/davidedc/devart-template/master/project_images/UI-Synch-diagram-2-we-have-to-go-deeper.gif)

Or, more clearly:

![done](https://raw.github.com/davidedc/devart-template/master/project_images/UI-Synch-diagram-3-finally-order.gif)

Once that's done there is still some debugging for inevitable glitches and errors, but the result is that one can now change two sliders (the same or different) on two separate clients without rubber-banding and with eventual consistency. Or try to scatter-tap around the UI! It works! It all eventually synchs!

If the "conflict" situations are specifically highlighted in the UI (perhaps by flashing a small "thunder" icon next to the widget as it's changed by "other" clients), then we have a pretty reasonable handling of a problem that is not super-simple at all!