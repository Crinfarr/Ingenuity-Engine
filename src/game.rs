use std::collections::HashMap;

pub struct Game {
    player_sockets: HashMap<uuid::Uuid, iroh::Endpoint>,
}
