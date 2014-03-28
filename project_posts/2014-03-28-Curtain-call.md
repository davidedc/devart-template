Something we learned
-----------

**Patrick:** The Raspberry Pi continues to surprise with its capability. At several stages it seemed unlikely that it had the processing power to cope with rendering complex shaders at the same time as serving data over the network fast enough. Each time it proved possible to tweak and optimise it back on track.

**Davide:** UI (state) synching across multiple clients is more complex than I thought. Also, I learned around 20 ways to get my Raspberry PI to freeze.

What’s cutting edge about the project
-----------

**Patrick:** it’s a *cheap kit*, everyone can have
this setup in their living room!

**Davide:** It looks waaaay cool! And I think that the possibility of synching multiple displays and multiple clients is really cool too. This installation can truly scale from coffee-table with friends to something much-much bigger.

What next?
--------

**Patrick:** Lots of screens as portholes to give the impression of a moving room. One of the issues with this project was getting the sudden changes to be reflected in all the client devices with minimal delay. Obviously with a large number of clients there will be a constraint on the polling frequency. Possibly this could be coped with by having a more smoothly changing scene... A world with surreal scenery; a cityscape, a forest, underwater or in space.

**Davide:** There is quite a bit of refactoring that could be done on the UI side. Potentially, the processing UI and the synching mechanism could be turned into a skeleton framework of their own. “Common state” web frameworks are all the rage now (e.g. firebase), and maybe a custom and minimal open-source processing-oriented solution could be useful.

Finally
------

**Patrick:** We set out to do something fun and succeeded!

**Davide:** Yes and I really liked the approach of having it to work fully (although in some embryonic form). There is a sense of “done” and “shipped”. Bish bash bosh, video of the thing working, one more project to add to our websites, moving on to the next thing - I like that. Or I’m happy to come back to this if we find interested parties :-)