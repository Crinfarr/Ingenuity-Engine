use std::collections::HashMap;

use iroh::SecretKey;
use tokio::sync::RwLock;
use tracing::{debug, info, instrument};
use uuid::Uuid;

#[derive(Debug, thiserror::Error)]
pub enum GameInitError {
    #[error("Error binding socket: {}", .0)]
    IrohBindError(#[from] iroh::endpoint::BindError),
}
type GameInitResult<T> = Result<T, GameInitError>;

pub struct Game<const N: usize> {
    socket: iroh::Endpoint,
}
impl<const N: usize> Game<N> {
    //     #[instrument]
    //     pub async fn new() -> GameInitResult<Self> {
    //         let mut s = iroh::Endpoint::builder(iroh::endpoint::presets::N0)
    //             .alpns(vec![crate::INGENUITY_ENGINE_ALPN.to_owned()])
    //             .secret_key(iroh::SecretKey::generate())
    //             .bind()
    //             .await?;
    //
    //         todo!()
    //     }
}
