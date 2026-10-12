// Feature safety checks
#[cfg(any(all(
    feature = "auth",
    not(any(feature = "auth_password", feature = "auth_jwt"))
)))]
compile_error!("feature 'auth' requires at least one authentication module to be enabled");
mutually_exclusive_features::none_or_one_of!(
    "serde_tag_internal",
    "serde_tag_adjacent",
    "serde_tag_none"
);
use tokio::sync::mpsc::{UnboundedReceiver, UnboundedSender};
use uuid::Uuid;
mod client_message;
pub use client_message::ClientMessage;
mod server_message;
pub use server_message::ServerMessage;

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
        id: Uuid,
    ) -> Result<
        Option<(
            &mut UnboundedReceiver<ClientMessage>,
            &UnboundedSender<ServerMessage>,
        )>,
        Self::Error,
    >;
    /// This function will receive a function pointer, which the socket should call with the UUID of any newly established connections.
    /// If this function is called a second time, the first callback should be dropped.
    fn set_callback(&self, callback: fn(Uuid)) -> ();
}
