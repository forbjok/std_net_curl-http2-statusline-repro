import std.stdio;
import std.conv : text;
import std.net.curl;

void main()
{
  auto http = HTTP();
  http.verbose = true;

  http.onReceiveStatusLine = (sl) {
    writeln("RCV " ~ text(sl.code, " ", sl.reason));
  };

   http.onProgress = (dlTotal, dlNow, ulTotal, ulNow) {
     writeln("PROGR");
     return 0;
  };

  auto url = "https://http2.pro/";

  std.net.curl.download(url, "content.html", http);

  writeln("Response: " ~ text(http.statusLine.code, " ", http.statusLine.reason));
}
