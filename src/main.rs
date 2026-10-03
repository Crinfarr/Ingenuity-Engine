use std::env::VarError;

use tracing::Level;

mod game;

pub const INGENUITY_ENGINE_ALPN: &'static [u8] = b"INGENUITY_ENGINE//V:0//P:0";

#[derive(Debug, thiserror::Error)]
enum MainErr {
    #[error("DotENV error: {}", .0)]
    DotEnvErr(#[from] dotenv::Error),
    #[error("Bad ENV for var {}: {:?}", .0, .1)]
    BadEnvErr(&'static str, std::ffi::OsString),
}

#[tokio::main]
async fn main() -> Result<(), MainErr> {
    dotenv::dotenv()?;
    let loglevel = match std::env::var("LOGLEVEL") {
        Ok(val) => match val.as_str() {
            "ERROR" => Level::ERROR,
            "WARN" => Level::WARN,
            "INFO" => Level::INFO,
            "DEBUG" => Level::DEBUG,
            "TRACE" => Level::TRACE,
            _other => Level::INFO,
        },
        // error handling
        Err(VarError::NotPresent) => Level::INFO,
        Err(VarError::NotUnicode(txt)) => {
            return Err(MainErr::BadEnvErr("loglevel", txt));
        }
    };
    tracing_subscriber::FmtSubscriber::builder()
        .with_max_level(loglevel)
        .pretty()
        .init();
    Ok(())
}
