use ingenuity_engine_traits::IngenuitySocket;
use tokio::sync::mpsc::{UnboundedReceiver, UnboundedSender};
use uuid::Uuid;
pub struct Socket {
    internal: tokio::net::TcpStream,
}
#[derive(Debug, thiserror::Error)]
pub enum Error {
    #[error("Unknown error: {}", .0)]
    Other(#[from] Box<dyn std::error::Error>),
}
impl IngenuitySocket for Socket {
    type Error = Error;
    fn get_channel(
        &self,
        id: Uuid,
    ) -> Result<
        Option<(
            &mut UnboundedReceiver<ingenuity_engine_traits::ClientMessage>,
            &UnboundedSender<ingenuity_engine_traits::ServerMessage>,
        )>,
        Self::Error,
    > {
        todo!();
    }
    fn set_callback(&self, callback: fn(uuid::Uuid)) -> () {
        todo!();
    }
}
