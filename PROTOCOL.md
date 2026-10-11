- The Ingenuity Engine itself will run over any transmission protocol capable of communicating with a client.
  - In order to define a communication protocol, create a lib with an export that implements `ingenuity-engine-traits::IngenuitySocket`
  - To enable a communication protocol while compiling the engine, append that protocol's flag to the INGENUITY_PROTOS environment variable, separated by a comma.
    | protocol | flag |
    | --- | --- |
    | Raw TCP | `tcp` |
    | Raw UDP | `udp` |
    | Websocket | `websocket` |
    | QUIC | `quic` |
    | RTC/WebRTC | `rtc` |
    | Iroh | `iroh` |
  - To build with TCP and Websocket support only, for example, use the following:
    `INGENUITY_PROTOS="tcp,websocket" cargo build`
  - TODO: Macroify imports and setup code for sockets
- Cards for Ingenuity Engine are written in Lua
  - Stub definitions and docs will be available here once they're stabilized
