# Delphi Web Socket #
## About the Web Socket protocol ##
According to the [draft specification](http://tools.ietf.org/pdf/draft-hixie-thewebsocketprotocol-60.pdf), the Web Socket protocol _enables two-way communication between a user agent running untrusted code running in a controlled environment to a remote host that has opted-in to communications from that code. The security model used for this is the Origin-based security model commonly used by Web browsers. The protocol consists of an initial handshake followed by basic message framing, layered over TCP. The goal of this technology is to provide a mechanism for browser-based applications that need two-way communication with servers that does not rely on opening multiple HTTP connections (e.g. using XMLHttpRequest or iframes and long polling)._

Translated into human language, using Web Sockets, the (web)server can now initiate communication and send data to the client (browser) without being asked. This happens after a trusty channel of communication is established over a TCP connection.

## This project ##
The project contains a Delphi implementation of the Web Socket protocol (server side) and a HTML chat example. The [Indy 9](http://www.indyproject.org/Sockets/Download/Files/Indy9.EN.aspx) library is needed to compile the source code. To test the Web Socket client html you would need the [Dev channel version of Google Chrome](http://www.chromium.org/getting-involved/dev-channel), the only browser supporting the protocol at this time.

## Goals ##
This project evolved from my personal goal to understand the protocol better and get starting with JavaScript. Please do not use the provided component for production stuff just yet.