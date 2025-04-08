//
//  EmojiMemoryGame(VM).swift
//  StanfordCS193p-1-Memorize
//
//  Created by Ali serkan Boyracı  on 28.02.2025.
//

import SwiftUI  // ViewModel oldugundan

//func createCarContent(forPairAtIndex index: Int) -> String { return ["🇹🇷","🇦🇿","🇺🇸","🇦🇺","🇩🇪","🇷🇺","🇨🇦","🇭🇷","🇦🇱","🇪🇸"][index]} cardContentFactory icine closure olarak yazdik.

//let emojis = ["🇹🇷","🇦🇿","🇺🇸","🇦🇺","🇩🇪","🇷🇺","🇨🇦","🇭🇷","🇦🇱","🇪🇸"] biraz once class icindeyken initiliaze yapmamizi istiyorud sorunu cozduk ama bu sekilde sorunun cozumu mantikli degil, global variable kulanmak tehlikeli. onun yerine class icine tekrar koyup static ekleyecegiz.

class EmojiMemoryGame {
    
    private static let emojis = ["🇹🇷","🇦🇿","🇺🇸","🇦🇺","🇩🇪","🇷🇺","🇨🇦","🇭🇷","🇦🇱","🇪🇸"]
    
   
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in // pairIndex yerine $0 yazabilirdik. ilk parametre demek
            if emojis.indices.contains(pairIndex){ // to protect we add if clause
                return emojis[pairIndex] //yukarda static yazinca bunu EMjiMEmoryGame.emojis olarak algiliyor.
            } else {
                return "⁉️"
            }
         
        }
    }
    
    private var model = createMemoryGame() // direkt yukaridaki funca esitledik
    
   /* private var model: MemoryGame<String> = MemoryGame<String>( //yukardakinin uzun hali
        numberOfPairsOfCards: 12,
        cardContentFactory:  { (index: Int) -> String in // type inference yazmaya gerek yok// index in Int oldugunu da yazmaya gerek yok
            return ["🇹🇷","🇦🇿","🇺🇸","🇦🇺","🇩🇪","🇷🇺","🇨🇦","🇭🇷","🇦🇱","🇪🇸"][index]
        })*/
    
    // haberlesmede kullanacagiz. normalde model diye bir isim verilmiyor. kolay anlasilsin diye yapildi.
    // private olmazsa viemmodel.model directly model ile konusabilir. private yapinca sadece bu class modelle konusabilir yapiyoruz..
    // peki boyle yapinca View nasil modelle iletisime gececek, bu durum VM sorumlulugunda
    // ONLY VIEWMODEL CAN SEE IT
    // takim arkadasinda uzerinde calisacak olabilir o yuzden private olmasi daha iyi
    var cards : [MemoryGame<String>.Card] {
        return model.cards // bu sekilde modeli view den koruyoruz.
    }
    
    func choose(_ card: MemoryGame<String>.Card) { // _ card yazinca asagida tekar card:card yazmamiza gerek kalmadi
        model.choose(card)
    }
    
    
}
