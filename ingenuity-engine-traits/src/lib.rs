use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
pub enum Packet {
    Connect,
    Disconnect,
    ServerMessage(String),
}

/// The IngenuitySocket trait is used to implement a communications protocol between the Engine and an arbitrary client.
/// The only functions that needs to be implemented are
/// - get_channel, returning a 2-way channel to and from a client, and
/// - set_callback, which should hand off a Uuid instance identifying the client.
///
/// Structs that impl IngenuitySocket are expected to handle their own statefulness, connection list,
/// and threading independently from the engine.
/// This may include internal thread runtimes if necessary.
pub trait IngenuitySocket {
    type Error: std::error::Error;
    /// This function should return an error only if the socket itself errors.
    /// If there is no socket with the requested UUID, this should return Ok(None).
    fn get_channel(
        &self,
        id: uuid::Uuid,
    ) -> Result<
        Option<(
            &mut tokio::sync::mpsc::UnboundedReceiver<Packet>,
            &tokio::sync::mpsc::Sender<Packet>,
        )>,
        Self::Error,
    >;
    /// This function will receive a function pointer, which the socket should call with the UUID of any newly established connections.
    /// If this function is called a second time, the first callback should be dropped.
    fn set_callback(&self, callback: fn(uuid::Uuid)) -> ();
}
