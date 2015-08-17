This is a package of test data for you to play with. The data was
obtained using a test network.

The package contains .pcap and .bin files. The .bin files are the
input to the diag_import (snoopsnitch) and not really needed for
this exercise. However, the files might be useful if want to do
experiments with snoopsnitch's gsm-parser.


== Test network ==

To set up a test network we used a nanoBTS with openBSC. The test 
network simulates the subscriber's home network. It is not much
different from a regular network. Like normal networks it uses
authentication and encryption. It even advertises some neighbors. 

MCC: 001
MNC: 01
LAC: 23
CID: 1337
ARFCN: 873 (GSM1800)
Neighbors: 871,872,873
The intercepted subscriber's IMSI is: 001010000000016


== Situation No. 1: Silent SMS (silent_sms.pcap) ==

A silent sms is a special type of SMS which is used for tracking
people. However, it can also be used as a control channel.

Frame 114 contains a normal SMS. The payload text is "hello".
This SMS would be displayed at the UI as you know it. Now look at
Frame 229. You will find an SMS that says "this is a silent sms".
This SMS will not be displayed.

Excercise: Compare the two short messages and find out what's
the difference between the two.


== Situation No. 2: Tracking catcher (tracking_catcher.pcap) ==

IMSI-Catchers are not only used to intercept calls, they are also
a powerful tool to track people by just asking them for their IMSI
and IMEI, then letting them go again.
We call these IMSI-collecting rogue base stations "Type-I Catchers".

The catcher has the following ID data:
MCC: 001
MNC: 01
LAC: 1212
CID: 1337
ARFCN: 872 (GSM1800)
Neighbors: 871,872,873

Look at Frame 266. You will find a location update request. A 
little below you find lots of identity requests. And a location
update reject at frame 282.

If you scroll down to Frame 391 you see the phone coming back to
its home network.

Excercise: Compare the location update to the home network to the
one from the catcher. Can you imagine a situation where the location
update from the catcher is a normal situation?

Excercise: Why did the attacker choose a different LAC?


== Situation No. 3: Intercepting catcher (intercepting_catcher.pcap) ==

Here we simulate an intercepting rogue base station catcher.
The configuration is almost like in Situation 2 with the little
exception that this time we will accept the mobile and even provide
service to it.
We call these intercepting rogue base stations "Type-II Catchers"

The catcher has the following ID data:
MCC: 001
MNC: 01
LAC: 13
CID: 1337
ARFCN: 872 (GSM1800)
Neighbors: 871,872,873,875

The trace begins when the mobile is already logged into its home
network. Everything is fine so far.

At frame 158 you find the call setup for a test call we made with
our home network.

Lets finish the call and bring the catcher into the game. At frame
224 you can see how the phone moves over from its legitimate cell to
to the catcher. The  phone is now no longer served by its home network.
The catcher is now providing service.

At Frame 261 you see a call setup. Beware, this call is intercepted.
Shortly after the call is finished you see how the mobile tries to
send an SMS. Frame 433 tells you the content of the SMS. Sadly
our catcher does not support SMS routing. In Frame 445 you can see
how the SMS gets rejected. Our monitoring work is done. Its time to
slope off...

At frame 538 you can see how the the phone is comming back to its
home network.

Exercise: Compare the call with the catcher with the call in the
home network. What is different and how does it affect the 
security of the call?


== Appendix ==

There are also more elaborated call interception devices on the 
marked you should beware of:

a) Transparent catchers: We call these catchers "Type-III Catchers"
The devices are fully transparent. They just forward the traffic
between your phone and your mobile operator. The device has no 
chance to sniff the session Key (Kc), it only sees the RAND and
the SRES. Consequently, the interception device must crack the Kc.
This  requires some time. A long waiting period befor the
CIPHER MODE COMPLETE message can hint at this type of catcher.

b) Passive monitoring devices: These devices just record the
spectrum and crack the data afterwards. It may be difficult to
identify a specific subscriber, because the attacker does not
necessarly know the target's TMSI (There are ways to find it out).
Bad news is that these "catchers" are absolutely undetectable.
Good news is, if you use a proper encryption like A53, they will
be unable to crack session key and your traffic remains protected.


This educational package was crafted by:

luca Melette <luca@srlabs.de>  and  Philipp Maier <dexter@srlabs.de> 