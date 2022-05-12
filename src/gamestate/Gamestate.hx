package src.gamestate;

typedef Format = {
    formatName:String,
    deckSize: {
        min:Int,
        max:Null<Int>
    },
    commandZone: {
        commander:Bool,
        vanguard:Bool,
        conspiracy:Bool,
        min:Null<Int>,
        max:Null<Int>
    },
    sideboard: {
        max:Null<Int>
    },
    maxDupes:Null<Int>
}

var commander:Format = {
    formatName: "Commander",
    deckSize: {
        min: 98,
        max: 99
    },
    commandZone: {
        commander: true,
        vanguard: false,
        conspiracy: false,
        min: 1,
        max: 2,
    },
    sideboard: {
        max: null
    },
    maxDupes: 1
}
var casual:Format = {
    formatName: "Casual",
    deckSize: {
        min: 60,
        max: null,
    },
    commandZone: {
        commander: false,
        vanguard: false,
        conspiracy: false,
        min: null,
        max: 0
    },
    sideboard: {
        max: 15
    },
    maxDupes: 4
}

class Gamestate {
}