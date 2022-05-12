package src.gamestate;

private typedef ManaCost = {
    mc:String,
    cmc:Int
}

typedef Tcard = {
    name:String,
    manacost:Array<ManaCost>,
    image:String,
    colorI:Null<String>,
    typeline: {
        cardtype:Array<String>,
        subtype:Null<Array<String>>
    },
    expansion: {
        code:String,
        sym:Null<String>
    },
    tbox: {
        text:Null<String>,
        keywords:Null<Array<String>>,
        abilities:Null<String>
    },
    pt:Null<Array<Int>>,
    loyalty:Null<Int>,
    handmod:Null<String>,
    lifemod:Null<String>,
    artist:Null<String>,
    legal:Null<String>,
    cnum:Null<Int>
}

class Card {
    function new(card:Tcard) {
    }
}