//Packet can derive Ser/De
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[cfg_attr(feature = "serde_tag_internal", serde(tag = "type"))]
#[cfg_attr(
    feature = "serde_tag_adjacent",
    serde(tag = "tag", content = "content")
)]
//Depending on enabled features, some unknown messages may be present
#[non_exhaustive]
pub enum ServerMessage {}
