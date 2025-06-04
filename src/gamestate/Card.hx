package src.gamestate;

import h3d.scene.Mesh;
import h3d.prim.Cube;

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

class Card extends h3d.scene.Graphics {
    final geo:Cube;
    function new(parent:h3d.scene.Object, card:Tcard) {
        super(parent);
        geo = new h3d.prim.Cube(0.63, 0.88, 0.01);
    }
}