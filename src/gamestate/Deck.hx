package src.gamestate;

import src.gamestate.Card;
import src.gamestate.Gamestate;

typedef TDeck = {
    format:Gamestate.Format,
    main:Array<Card.Tcard>,
    sBoard:Null<Array<Card.Tcard>>,
    command:Null<Array<Card.Tcard>>
}

class Deck {
    var format:Gamestate.Format;
    var main:Array<Card.Tcard>;
    var sBoard:Null<Array<Card.Tcard>>;
    var command:Null<Array<Card.Tcard>>;
    function new(i:TDeck) {
        this.format = i.format;
        this.main = i.main;
    }
    private function verify(deck:TDeck, format:Format):Bool {
        if (format.deckSize.max != null) {
            if (deck.main.length > format.deckSize.max) {
                return false;
            }
        }
        if (format.deckSize.min != null) {
            if (deck.main.length < format.deckSize.min) {
                return false;
            }
        }
        if (format.commandZone.commander == true) {
            if (deck.command.length > format.commandZone.max || deck.command.length < format.commandZone.min) {
                return false;
            }
        }

        return true;
    }
}