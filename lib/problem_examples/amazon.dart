/*
Many different customer devices connect to the Alexa cloud. These devices have different quality speakers, 
and thus stream audio at different bit rates (the Echo Plus gets high quality audio, while the Dash Wand gets lower). 
Given a log of past audio streams, each with a start timestamp, end timestamp, and constant bitrate (for that stream), 
find the peak total bitrate that was utilized by the Alexa cloud.
    
Example:
    Stream   Start Time   End Time      Bandwidth Used (mbps)
    A        10:00:00 AM  11:00:00 AM   100
    B        10:30:00 AM  12:30:00 PM   200
    C        12:00:00 PM   1:00:00 PM   150

    => 350
*/

/*
C B A
*/

// Dart

// I find

void main(List<String> args) {
  final streams = [
    Call('A', DateTime(2022, 1, 1, 10), DateTime(2022, 1, 1, 11), 100),
    Call('C', DateTime(2022, 1, 1, 12), DateTime(2022, 1, 1, 13), 150),
    Call('D', DateTime(2022, 1, 1, 12), DateTime(2022, 1, 1, 13), 250),
    Call('E', DateTime(2022, 1, 1, 11), DateTime(2022, 1, 1, 12), 50),
    Call('F', DateTime(2022, 1, 1, 14), DateTime(2022, 1, 1, 15), 350),
    Call('B', DateTime(2022, 1, 1, 10, 30), DateTime(2022, 1, 1, 12, 30), 200),
    Call('G', DateTime(2022, 1, 1, 14, 30), DateTime(2022, 1, 1, 15), 150),
  ];

  final peak = findPeakTotalBitrate(streams);
  print(peak.map((e) => {e.streamName: e.bandwidth}));
}

class Call {
  final String streamName;
  final DateTime startTime, endTime;
  final int bandwidth;

  const Call(this.streamName, this.startTime, this.endTime, this.bandwidth);
}

List<Call> findPeakTotalBitrate(List<Call> streams) {
  streams.sort((a, b) => a.startTime.compareTo(b.startTime));

  int tempTotalBitrate = 0, peakTotalBitrate = 0;

  final queue = <Call>[];
  final returnedQueue = <Call>[];

  for (int i = 0; i < streams.length; i++) {
    final current = streams[i];

    if (queue.isEmpty) {
      queue.add(current);
      continue;
    }

    while (
        queue.isNotEmpty && queue.first.endTime.isBefore(current.startTime)) {
      queue.removeAt(0);
    }

    queue.add(current);

    tempTotalBitrate = queue.fold<int>(0, (p, e) => p + e.bandwidth);

    if (peakTotalBitrate < tempTotalBitrate) {
      peakTotalBitrate = tempTotalBitrate;
      returnedQueue.clear();
      returnedQueue.addAll(queue);
    }
  }

  return returnedQueue; /* 

  for (int i = 1; i < streams.length; i++) {
    // n
    // Stream B
    /*
 A ------------
 B                 -------------
 C                          ---------
 D                                       --------
        */
    final stream = streams[i];
    if (stream.startTime.isAfter(tempStream.endTime)) {
      if (stream.startTime.isBefore(streams[i - 1].endTime)) {
        tempStream = streams[i - 1];
      } else {
        tempStream = stream;
      }

      tempTotalBitrate = tempStream.bandwidth;

      if (peakTotalBitrate < tempTotalBitrate) {
        peakTotalBitrate = tempTotalBitrate;
      }
    } else {
      tempTotalBitrate += stream.bandwidth; // A + B
    }
  }
  return peakTotalBitrate; */
}

/*
A  ------
B     ----- 
C        ----
     

*/

/*

1        A+B   B  B+C C
         ======+++====++
 A ------------
 B       -------------
 C                ---------
 D                      --------

4
 A ------------
 B                 -------------
 C                                  ---------
 D                                               --------
 
 
3
 A -----------
 B -----------
 C ------------
 D ------------
 E       -------------
 F                --------- => tempTotalBitrate A + .. + E
 G                      --------
 
 
 
2
  A   ---------
  B    -------
  C     -----
  D      ---

5
 
A  -------
B      -------
C      -------
D      -------

*/
