//
//  ContentView.swift
//  StanfordCS193p-1-Memorize
//
//  Created by Ali serkan Boyracı  on 28.11.2024.
//

import SwiftUI

struct ContentView: View { //1 ContentView behaves like a View
    let emojis: [String] = ["🤬","🥶","😶‍🌫️","🤯","🫣","😰","🤢","😈","👺","🤖","👻","🫣","😰","🤢","😈","👺","🤖","👻"] // tek tek asagida yazmaktansa hepsini bir array icine koyduk.
    // Array<String> yazamaktansa [String] yazmak daha mantikli, bu arada hic yazmasanda olur.
    @State var cardCount : Int = 4
    
    var body: some View { //3 some = herhangi bir view = ne olursa olsun goster demek gibi.
        // 20 burda someView yazinca bizim yerimize TupleView yaziyor eger sadece some View yerine Text yazip icine text(...) biseyler yazsaydik sadece text cikardi. Eger 2 tane alt alta ya da yana yana text kullanacaksak some View kullanmak zorundayiz.
        VStack { // 29 bu sekilde saginda solunda guzel olmadi asagiya almak icin Vstack kullaniriz.
            cards
            cardCountAdjuster // 29 HERSEYI VAR ICLERINE KOYUP YAPTIK
        }
            /*
            CardView(content: emojis[0], isFaceUp: false)
            CardView(content: emojis[1], isFaceUp: false) // 24 eger carview struct inda tanimlarsak burda tekrar tanimlamaya gerek yok
            CardView(content: emojis[2], isFaceUp: true)
            CardView(content: emojis[3], isFaceUp: false)*/
        
        /* ZStack(content: { // Vstack altli ustlu olmasini sagliyor
            // Zstack ayni dikez duzlemde olmasini sagliyor
            //2  burdan padding sonuna kadar property dye gecer
            // 6. content onuce ve padding oncesine parantez ekleyerek, Vstack icerigini belirttik.
            // 5. aslinda burda 3 tane struct var birisi image digeri text sonuncusu da Vstack, Vstack() acilip icerisi degistirilebilir.
           // Image(systemName: "globe")// 4 creating image struct, //6 systemName: systemde kayitli olan bir imagei cagiriyor. imageNamed olsaydi assetlerden bakacaktik.
            
            
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white) // 9. arka plani beyaz yapmak icin gerekli ancak hem foreground hemde storl ayni anda olmuyor o yuzden bir tane daha rectangle olusutuyoruz.
            RoundedRectangle(cornerRadius: 15)// 8.wir müssen cornerradius geben.
                            .strokeBorder(lineWidth: 3) // 9.kenarik icin
            
            Text("🥶").font(.largeTitle)
                
        })*/
        //.foregroundColor(Color.orange) // 7 functions to change color
        //.imageScale(.large) //7/ functions to make large
        //.foregroundStyle(.tint)
        //5 creating text struct
        .padding()
    }
    
    
    var cards: some View { //burda {} arasi Viewbuilder degil sadece normal func, we dont need return here.
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in // for loop gibi ama fro each ile her view i gormemizi sagliyor.
                //ardindan { ile closure ypip her view icine bunu koy diyoruz. ve kapatiyoruz.}
                // (0..<4 = 0...5 = emojis.indices en guzeli souncusu eklendikce otomatik degisir. //4 ten 7 yaptim otomatik artti.
                // 28 bu kadar otomatik olunca cok fazla emojiyi ayni anda gormek istemyourm onun icin bir varibale atamak daha mantikli
                CardView(content: emojis[index])  //isFaceUp i default olarak birakiyoruz
            }
            .foregroundColor(Color.orange)
        }
    }
    
    var cardCountAdjuster : some View {
        HStack { //29 butonlari yan yana yapmak icin yine Hstack kullaniriz
            
            cardRemover
            Spacer() //ayri durmasi icin
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)

        .padding() // etafina cerceve gibi yer acmak icin padding kullaniriz.
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName :symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover : some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    var cardAdder : some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    
    /*
    var cardRemover : some View { // 29 ADDER VE REMOVER BIRBIRINE BENZIYOR, BURAYI BIRBIRINE BENZETELIM.
        Button(action: {
            if cardCount > 1 {// kartlar min ya da max sayisi gecince crash oluyor engellemek icin if koyacagiz
                cardCount -= 1
            }
        }, label: {
            Image(systemName :"rectangle.stack.fill.badge.minus")
        })
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardAdder : some View {
        Button(action: {
            if cardCount < emojis.count { // buraya uyari konulur
                cardCount += 1
            }
        }, label: {
            Image(systemName :"rectangle.stack.fill.badge.plus")
        })
        .imageScale(.large)
        .font(.largeTitle)
        /*Button("Add Card") { bu buttonlar sadece yaziyla pek hos gozukmuyor onun yerine buraya sembol koymak daha iyi
         cardCount += 1
         }
         Spacer() // birbirinden ayirmak icin
         Button("Remove Card") {
         cardCount -= 1
         } */
    } */
}

struct CardView : View {
    let content : String // content tipi degismesin
    @State var isFaceUp : Bool = true // burayi let yapamazsin // burda da Bool yazmana gerek yok
    
    var body: some View {
        ZStack { // 21 Zstack (.alignment: .top yazarak-.center merkeze alir icerigi yukariya alabilirsin. 23 center yazmana gerek yok zaetn default o sekilde. o yuzden siliyourz
            // 23 bos parantezi de eger trailing closure varsa silebilirsin.
            //22 burda alignment den sonra content vardi ama herhengi bir icerigi yoktu o yuzden bulnamsina gerek yok
            let shape = RoundedRectangle(cornerRadius: 15) // burayi let yapmak daha mantikli // burda basta type olarak yani basina : koyarak typ ini bildirmistik ancak gerek yok, zaten esittir yapinca o type inference ile kendisi anliyor.
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth :2)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
                /* RoundedRectangle(cornerRadius: 15) // 25 burdaki gibi surekli ayni seyi yazmaktansa bir Roundedrectangle durumunu bir degiskene atamaliyiz.
                    .fill(.white)
                RoundedRectangle(cornerRadius: 15)// 8.wir müssen cornerradius geben.
                    .strokeBorder(lineWidth: 3)
                Text("🥶").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15)// .fill yazmaya gerek yok zaten default geliyor.
                }*/
        }
        .onTapGesture(count:1) { //(count:2) eklersen 2 defa tikladiginda calisir.
            // print("Tapperrrr") great way to control the code.
            // isFaceUp = !isFaceUp // 26 yukariya var basina @State koyarak onu pointer yapiyoruz bu sekilde o degismiyor ancak burayai degistirme yetkimiz oluyor.
            isFaceUp.toggle() // 27 yukardakinin Bool icin kolay yazma yontemi burasi onemli
        }
    }
}


#Preview {
    ContentView()
}

