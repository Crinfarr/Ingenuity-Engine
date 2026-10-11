#[derive(Debug, thiserror::Error)]
pub enum GameInitError {}
type GameInitResult<T> = Result<T, GameInitError>;
pub struct Game<const N: usize> {
    socket: Box<dyn ingenuity_engine_traits::IngenuitySocket<Error = Box<dyn std::error::Error>>>,
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
